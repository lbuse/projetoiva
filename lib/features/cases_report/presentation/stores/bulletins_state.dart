import 'package:mobx/mobx.dart';
import '../../domain/entities/bulletin_details.dart';
import '../../domain/entities/bulletin.dart';

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
  late BulletinRepository repository;

  @observable
  int page = 1;
  @observable
  DateTime? date;
  @observable
  String state = '';
  @observable
  String city = '';
  @observable
  PlaceType placeType = PlaceType.all;
  @observable
  ObservableList<BulletinDetails> bulletins = ObservableList();
  @observable
  bool isLoading = false;
  @observable
  String errorMessage = '';
  @observable
  DateTime? submitTimeStamp = DateTime.now();

  // @observable
  // ObservableStream<DateTime> _time = Stream.periodic(const Duration(seconds: 1))
  //     .map((_) => DateTime.now())
  //     .asObservable();

  // @computed
  // BulletinDataTableSource get dataTableSource =>
  //     BulletinDataTableSource(bulletins);

  @action
  void changePage(int value) => page = value;
  @action
  void changeDate(DateTime? value) => date = value;
  @action
  void changeState(String? value) {
    state = value ?? '';
    changePlaceType(state.isEmpty ? PlaceType.all : PlaceType.state);
  }

  @action
  void changeCity(String? value) {
    city = value ?? '';
    changePlaceType(city.isEmpty ? PlaceType.state : PlaceType.city);
  }

  @action
  void changePlaceType(PlaceType value) => placeType = value;
  @action
  void changeBulletinsList(List<BulletinDetails> list) =>
      bulletins = ObservableList.of(list);
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeErrorMessage(String value) => errorMessage = value;
  @action
  void changeSubmitTimeStamp(DateTime? value) => submitTimeStamp = value;

  /// Requisita lista de boletins
  Future<void> loadBulletins() async {
    changeIsLoading(true);
    final actual = await GetCases(repository)(Params(
      page: page,
      date: date,
      placeType: placeType,
      state: state,
      city: city,
    ));

    actual.fold(
      (failure) {
        changeErrorMessage(
          failure.message ??
              'Não foi possível obter os dados, tente novamnete.',
        );
      },
      (bulletins) {
        print('bulletins ${bulletins.length}');
        changeBulletinsList(bulletins);
      },
    );

    changeIsLoading(false);
  }
}

// class BulletinDataTableSource extends DataTableSource {
//   List<Bulletin> bulletins = [];

//   BulletinDataTableSource(this.bulletins);

//   @override
//   DataRow getRow(int index) {
//     final bulletin = bulletins.elementAt(index);
//     return DataRow(cells: [
//       DataCell(Text(bulletin.cityIbgeCode ?? '')),
//       DataCell(Text(bulletin.city ?? '')),
//       DataCell(Text(bulletin.state ?? '')),
//       DataCell(Text(bulletin.confirmed?.toString() ?? '')),
//       DataCell(Text(bulletin.confirmedPer100kInhabitants?.toString() ?? '')),
//       DataCell(Text(DateFormat('dd/MM/yyyy').format(bulletin.date))),
//       DataCell(Text(bulletin.deaths?.toString() ?? '')),
//       DataCell(Text(bulletin.rateFormated.toStringAsFixed(2) + '%' ?? '')),
//       DataCell(Text(bulletin.estimatedPopulation?.toString() ?? '')),
//       DataCell(Text(bulletin.estimatedPopulation2019?.toString() ?? '')),
//     ]);
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => bulletins.length;

//   @override
//   int get selectedRowCount => 0;
// }
