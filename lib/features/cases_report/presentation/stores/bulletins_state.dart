import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../panel/presentation/stores/panel_state.dart';
import '../../domain/entities/bulletin.dart';
import '../../domain/entities/bulletin_details.dart';
import '../../domain/repositories/bulletin_repository.dart';
import '../../domain/usecases/get_cases.dart';

part 'bulletins_state.g.dart';

/// Estado da interface.
///
/// Exibe os [BulletinDetails] de forma que o usuário possa endenter a
/// informação.
class BulletinsState extends _BulletinsState with _$BulletinsState {
  BulletinsState(BulletinRepository repository) {
    super.repository = repository;
  }
}

abstract class _BulletinsState with Store {
  final panelState = GetIt.instance<PanelState>();
  late BulletinRepository repository;

  @observable
  int page = 1;
  @observable
  ObservableList<BulletinReturned> bulletins = ObservableList();
  @observable
  bool isLoading = false;
  @observable
  bool allBulletinsAreLoaded = false;
  @observable
  bool isFirstLoading = true;

  @computed
  DateTime? get date => panelState.initialDateStringToDateTime;
  @computed
  String get state => panelState.selectedUfInitials;
  @computed
  String get city => panelState.selectedCityName;
  @computed
  String get cityIbgeCode =>
      panelState.selectedCityValueOrNull?.toString() ?? '';
  @computed
  PlaceType get placeType => city.isNotEmpty ? PlaceType.city : PlaceType.state;
  @computed
  bool get hasBulletins => bulletins.isNotEmpty;
  @computed
  bool get nothingFound => !hasBulletins && !isFirstLoading;
  @computed
  bool get isLoadMoreBulletinsEnabled => !allBulletinsAreLoaded && !isLoading;
  @computed
  String get hasFiltersChanged => state + city + cityIbgeCode;
  @computed
  ObservableList<BulletinReturned> get bulletinsByDate {
    final ObservableList<BulletinReturned> listByDate = ObservableList.of([]);
    final tempList = bulletins.where(
      (i) =>
          i.placeType ==
          (placeType == PlaceType.city ? PlaceType.city : PlaceType.state),
    );
    final dates = tempList.map((b) => b.date).toSet();
    for (final d in dates) {
      final bulletinOfDate = tempList
          .where((b) => b.date!.isAtSameMomentAs(d!))
          .fold<BulletinReturned>(BulletinReturned(), (prev, next) {
        final confirmed = (prev.confirmed ?? 0) + (next.confirmed ?? 0);
        final deaths = (prev.deaths ?? 0) + (next.deaths ?? 0);
        final estimatedPopulation =
            (prev.estimatedPopulation ?? 0) + (next.estimatedPopulation ?? 0);
        final estimatedPopulation2019 = (prev.estimatedPopulation2019 ?? 0) +
            (next.estimatedPopulation2019 ?? 0);

        return BulletinReturned(
          date: next.date,
          state: next.state,
          city: next.city,
          cityIbgeCode: next.cityIbgeCode,
          placeType: next.placeType,
          confirmed: confirmed,
          deaths: deaths,
          estimatedPopulation: estimatedPopulation,
          estimatedPopulation2019: estimatedPopulation2019,
          confirmedPer100kInhabitants: estimatedPopulation == 0
              ? 0
              : (confirmed / estimatedPopulation) * 100000,
          deathRate: confirmed == 0 ? 0 : deaths / confirmed,
        );
      });

      listByDate.add(bulletinOfDate);
    }

    // Remove primeiro boletin caso a diferença estatistica seja maior que 5%.
    // Isso previne que um dia que não está completo devido a paginação
    // seja carregado.
    if (listByDate.length > 2) {
      final olderBulletin = bulletins.last;
      final secondOlderBulletin = bulletins.elementAt(1);
      final diff =
          (olderBulletin.confirmed! / secondOlderBulletin.confirmed!) * 100;
      if (diff >= 5) {
        listByDate.removeLast();
      }
    }

    return listByDate;
  }

  @action
  void changePage(int value) => page = value;
  @action
  void changeBulletins(List<BulletinReturned> list) =>
      bulletins = ObservableList.of(list);
  @action
  void addBulletins(List<BulletinReturned> list) =>
      bulletins.addAll(ObservableList.of(list));
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeAllBulletinsAreLoaded(bool value) => allBulletinsAreLoaded = value;
  @action
  void changeErrorMessage(String value) => panelState.changeErrorMessage(value);
  @action
  void changeIsFirstLoading(bool value) => isFirstLoading = value;

  /// Requisita lista de boletins
  Future<void> loadBulletins({int page = 1}) async {
    changePage(page);
    changeIsLoading(true);
    final actual = await GetCases(repository)(Params(
      page: page,
      date: date,
      placeType: placeType,
      state: state,
      city: city,
      cityIbgeCode: cityIbgeCode,
    ));

    actual.fold(
      (failure) {
        changeErrorMessage(
          failure.message ??
              'Não foi possível obter os dados, tente novamnete.',
        );
      },
      (bulletins) {
        if (page == 1) {
          changeAllBulletinsAreLoaded(false);
          changeBulletins(bulletins);
        } else {
          changeAllBulletinsAreLoaded(bulletins.isEmpty);
          addBulletins(bulletins);
        }
      },
    );

    changeIsFirstLoading(false);
    changeIsLoading(false);
  }
}
