import 'package:mobx/mobx.dart';

import '../../domain/entities/vaccination.dart';
import '../../domain/repositories/vaccination_repository.dart';
import '../../domain/usecases/get_vaccinated.dart';

part 'vaccination_state.g.dart';

class VaccinationState extends _VaccinationState with _$VaccinationState {
  VaccinationState(VaccinationRepository repository)
      : assert(repository != null) {
    super.repository = repository;
  }
}

abstract class _VaccinationState with Store {
  VaccinationRepository repository;

  @observable
  String scrollId = '';
  @observable
  ObservableList<Vaccination> vaccinesApplied = ObservableList();
  @observable
  bool isLoading = false;
  @observable
  String errorMessage = '';

  @action
  void changePage(String value) => scrollId = value ?? '';
  @action
  void changeVaccinesApplied(List<Vaccination> list) =>
      vaccinesApplied = ObservableList.of(list) ?? [];
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeErrorMessage(String value) => errorMessage = value;

  /// Requisita lista de boletins
  Future<void> loadVaccinated() async {
    changeIsLoading(true);
    final actual = await GetVaccinated(repository)(Params(scrollId: scrollId));

    actual.fold(
      (failure) {
        changeErrorMessage(
          failure?.message ??
              'Não foi possível carregar os estados, tente novamnete.',
        );
      },
      (list) {
        changeVaccinesApplied(list);
      },
    );
    changeIsLoading(false);
  }
}
