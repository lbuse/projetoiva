import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/uf.dart';
import '../../domain/repositories/city_repository.dart';
import '../../domain/repositories/uf_repository.dart';
import '../../domain/usecases/get_cities_by_uf.dart';
import '../../domain/usecases/get_ufs.dart';

part 'panel_state.g.dart';

class PanelState extends _PanelState with _$PanelState {
  PanelState({
    required this.ufRepository,
    required this.cityRepository,
  }) {
    super._ufRepository = ufRepository;
    super._cityRepository = cityRepository;
  }

  final UfRepository ufRepository;
  final CityRepository cityRepository;
}

abstract class _PanelState with Store {
  late UfRepository _ufRepository;
  late CityRepository _cityRepository;

  @observable
  int selectedUf = 0;
  @observable
  int selectedCity = 0;
  @observable
  String initialDate = '';
  // @observable
  // String finalDate = '';
  @observable
  ObservableList<Uf> ufs = ObservableList();
  @observable
  ObservableList<City> cities = ObservableList.of([
    City(id: 0, nome: 'Nenhuma'),
  ]);
  @observable
  bool isLoadingUfs = false;
  @observable
  bool isLoadingCities = false;
  @observable
  bool isLoading = false;
  @observable
  bool isformSubmitted = false;
  @observable
  DateTime submitTimeStamp = DateTime.now();
  @observable
  String errorMessage = '';

  @computed
  bool get isInitialDateValid => initialDateStringToDateTime != null;
  // @computed
  // bool get isFinalDateValid => finalDateStringToDateTime != null;
  @computed
  bool get isUfInputEnabled => !isLoadingUfs && !isLoadingCities;
  @computed
  bool get isCitiesInputEnabled => isUfInputEnabled;
  @computed
  String get initialDateFormatted {
    if (initialDate.isEmpty) {
      return DateFormat('dd/MM/yyyy').format(DateTime.now());
    } else {
      return initialDate;
    }
  }

  // @computed
  // String get finalDateFormatted {
  //   if (finalDate == null || finalDate.isEmpty) {
  //     return DateFormat('dd/MM/yyyy').format(DateTime.now());
  //   } else {
  //     return finalDate;
  //   }
  // }

  @computed
  DateTime? get initialDateStringToDateTime {
    String date = '';
    final list = initialDate.split('/');
    if (list.length == 3) {
      date = '${list.last}-${list.elementAt(1)}-${list.first}';
    }
    try {
      return DateTime.parse(date);
    } on FormatException {
      return null;
    }
  }

  // @computed
  // DateTime get finalDateStringToDateTime {
  //   String date = '';
  //   if (finalDate != null) {
  //     final list = finalDate.split('/');
  //     if (list.length == 3) {
  //       date = '${list.last}-${list.elementAt(1)}-${list.first}';
  //     }
  //   }
  //   try {
  //     return DateTime.parse(date);
  //   } on FormatException {
  //     return DateTime.now();
  //   }
  // }

  @computed
  List<DropdownMenuItem<int>> get ufMenuItems => ufs
      .map((uf) => DropdownMenuItem<int>(
            value: uf.id,
            child: Text(uf.nome!),
          ))
      .toList();
  @computed
  List<DropdownMenuItem<int>> get cityMenuItems => cities
      .map((city) => DropdownMenuItem<int>(
            value: city.id,
            child: Text(city.nome!),
          ))
      .toList();
  @computed
  int? get selectedUfValueOrNull => selectedUf <= 0 ? null : selectedUf;
  @computed
  String? get selectedUfInitials => ufs
      .firstWhere(
        (uf) => selectedUf > 0 && uf.id == selectedUf,
        orElse: () => Uf(id: 0, nome: '', sigla: ''),
      )
      .sigla;
  @computed
  int? get selectedCityValueOrNull => selectedCity <= 0 ? null : selectedCity;
  // @computed
  // String? get selectedCityName => cities
  //     .firstWhere(
  //       (city) => selectedCity > 0 && city.id == selectedCity,
  //       orElse: () => City(id: 0, nome: ''),
  //     )
  //     .nome;

  @action
  void changeSelectedUf(int? value) {
    if (value == null || value == 0) {
      changeSelectedCity(0);
      changeCities([]);
      selectedUf = 0;
    } else if (value > 0 && value != selectedUf) {
      selectedUf = value;
      changeSelectedCity(0);
      loadCities();
    }
  }

  @action
  void changeSelectedCity(int? value) =>
      selectedCity = value == null || value < 0 ? 0 : value;
  @action
  void changeInitialDate(String value) => initialDate = value;
  // @action
  // void changeFinalDate(String value) =>
  //     finalDate = value ?? DateTime.now().toString();
  @action
  void changeUfs(List<Uf> list) {
    final defaultItem = Uf(id: 0, nome: 'Nenhum', sigla: '');
    ufs = ObservableList.of([defaultItem, ...list]);
  }

  @action
  void changeCities(List<City> list) {
    final defaultItem = City(id: 0, nome: 'Nenhuma');
    cities = ObservableList.of([defaultItem, ...list]);
  }

  @action
  void changeIsLoadingUfs(bool value) => isLoadingUfs = value;
  @action
  void changeIsLoadingCities(bool value) => isLoadingCities = value;
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeIsFormSubmitted(bool value) => isformSubmitted = value;
  @action
  void changeSubmitTimeStamp(DateTime value) => submitTimeStamp = value;
  @action
  void changeErrorMessage(String value) => errorMessage = value;

  /// Carrega lista de estados que preenchem filtros do painel.
  Future<void> loadUfs() async {
    changeIsLoadingUfs(true);
    final actual = await GetUfs(_ufRepository)(NoParams());

    actual.fold(
      (failure) {
        changeErrorMessage(
          failure.message ??
              'Não foi possível carregar os estados, tente novamnete.',
        );
      },
      (ufs) {
        ufs.sort((a, b) => a.nome!.compareTo(b.nome!));
        changeUfs(ufs);
      },
    );
    changeIsLoadingUfs(false);
  }

  /// Carrega lista de cidades com base no estado selecionado
  /// que preenchem filtros do painel.
  Future<void> loadCities() async {
    changeIsLoadingCities(true);
    final sigla = ufs.firstWhere((uf) => uf.id == selectedUf).sigla!;
    final actual = await GetCitiesByUfs(_cityRepository)(
      Params(sigla),
    );

    actual.fold(
      (failure) {
        changeErrorMessage(
          failure.message ??
              'Não foi possível carrega as cidades, tente novamnete.',
        );
      },
      (cities) {
        cities.sort((a, b) => a.nome!.compareTo(b.nome!));
        changeCities(cities);
      },
    );
    changeIsLoadingCities(false);
  }
}
