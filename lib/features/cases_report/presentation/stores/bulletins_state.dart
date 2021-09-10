import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:projetoiva/features/panel/presentation/stores/panel_state.dart';

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
  ObservableList<BulletinDetails> bulletins = ObservableList();
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
  ObservableList<BulletinDetails> get bulletinsByDate {
    final ObservableList<BulletinDetails> listByDate = ObservableList.of([]);
    final tempList = bulletins.where(
      (i) =>
          i.placeType ==
          (placeType == PlaceType.city ? PlaceType.city : PlaceType.state),
    );
    final dates = tempList.map((b) => b.date).toSet();
    for (final d in dates) {
      final bulletinOfDate = tempList
          .where((b) => b.date!.isAtSameMomentAs(d!))
          .fold<BulletinDetails>(BulletinDetails(), (prev, next) {
        final confirmed = (prev.confirmed ?? 0) + (next.confirmed ?? 0);
        final deaths = (prev.deaths ?? 0) + (next.deaths ?? 0);
        final estimatedPopulation =
            (prev.estimatedPopulation ?? 0) + (next.estimatedPopulation ?? 0);
        final estimatedPopulation2019 = (prev.estimatedPopulation2019 ?? 0) +
            (next.estimatedPopulation2019 ?? 0);

        return BulletinDetails(
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

  // @computed
  // ObservableList<List<BulletinDetails>> get bulletinsByState {
  //   final tempList = List.of(
  //     bulletins.where((i) => i.placeType == PlaceType.state),
  //   );
  //   final ufs = tempList.map((b) => b.state).toSet();
  //   tempList.sort((a, b) => a.state!.compareTo(b.state!));

  //   final List<List<BulletinDetails>> bulletinsByState = [];
  //   for (final uf in ufs) {
  //     final bulletinsOfState = bulletins.where((b) => b.state == uf).toList();
  //     bulletinsOfState.sort((a, b) => a.date!.compareTo(b.date!));
  //     bulletinsByState.addAll([bulletinsOfState]);
  //   }

  //   return ObservableList.of(bulletinsByState);
  // }

  // @computed
  // ObservableList<List<BulletinDetails>> get bulletinsByCity {
  //   final tempList = List.of(
  //     bulletins.where((i) => i.placeType == PlaceType.city),
  //   );
  //   final cities = tempList.map((b) => b.cityIbgeCode).toSet();
  //   tempList.sort((a, b) => a.city!.compareTo(b.city!));

  //   final List<List<BulletinDetails>> bulletinsByCity = [];
  //   for (final city in cities) {
  //     final bulletinsOfCity = bulletins.where((b) {
  //       if (cityIbgeCode.isNotNullAndNotEmpty && city.isNotNullAndNotEmpty) {
  //         return b.cityIbgeCode == cityIbgeCode && b.city == city;
  //       } else if (b.cityIbgeCode.isNotNullAndNotEmpty) {
  //         return b.cityIbgeCode == cityIbgeCode;
  //       } else {
  //         return b.city == city;
  //       }
  //     }).toList();
  //     bulletinsOfCity.sort((a, b) => a.date!.compareTo(b.date!));
  //     bulletinsByCity.addAll([bulletinsOfCity]);
  //   }

  //   return ObservableList.of(bulletinsByCity);
  // }

  // @computed
  // ObservableList<List<BulletinDetails>> get bulletinsByPlaceType =>
  //     placeType == PlaceType.city ? bulletinsByCity : bulletinsByState;

  // @computed
  // ObservableList<List<BulletinDetails>> get bulletinsByInterval {
  //   final tempList = List.of(listOfBulletinsByPlaceType);
  //   for (final bulletinsByCategory in tempList) {
  //     final firstDate = bulletinsByCategory.first.date;
  //     final lastDate = bulletinsByCategory.last.date;
  //     final interval = List.generate(
  //       (lastDate!.difference(firstDate!).inDays / 15).ceil(),
  //       (index) {
  //         return firstDate.add(Duration(days: 15 * index));
  //       },
  //     );
  //     bulletinsByCategory.removeWhere((b) => !interval.contains(b.date));
  //   }

  //   return ObservableList.of(tempList);
  // }

  @action
  void changePage(int value) => page = value;
  @action
  void changeBulletins(List<BulletinDetails> list) =>
      bulletins = ObservableList.of(list);
  @action
  void addBulletins(List<BulletinDetails> list) =>
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
