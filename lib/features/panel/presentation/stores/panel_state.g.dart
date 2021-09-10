// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panel_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PanelState on _PanelState, Store {
  Computed<bool>? _$isInitialDateValidComputed;

  @override
  bool get isInitialDateValid => (_$isInitialDateValidComputed ??=
          Computed<bool>(() => super.isInitialDateValid,
              name: '_PanelState.isInitialDateValid'))
      .value;
  Computed<bool>? _$isUfInputEnabledComputed;

  @override
  bool get isUfInputEnabled => (_$isUfInputEnabledComputed ??= Computed<bool>(
          () => super.isUfInputEnabled,
          name: '_PanelState.isUfInputEnabled'))
      .value;
  Computed<bool>? _$isCitiesInputEnabledComputed;

  @override
  bool get isCitiesInputEnabled => (_$isCitiesInputEnabledComputed ??=
          Computed<bool>(() => super.isCitiesInputEnabled,
              name: '_PanelState.isCitiesInputEnabled'))
      .value;
  Computed<String>? _$initialDateFormattedComputed;

  @override
  String get initialDateFormatted => (_$initialDateFormattedComputed ??=
          Computed<String>(() => super.initialDateFormatted,
              name: '_PanelState.initialDateFormatted'))
      .value;
  Computed<DateTime?>? _$initialDateStringToDateTimeComputed;

  @override
  DateTime? get initialDateStringToDateTime =>
      (_$initialDateStringToDateTimeComputed ??= Computed<DateTime?>(
              () => super.initialDateStringToDateTime,
              name: '_PanelState.initialDateStringToDateTime'))
          .value;
  Computed<List<DropdownMenuItem<int>>>? _$ufMenuItemsComputed;

  @override
  List<DropdownMenuItem<int>> get ufMenuItems => (_$ufMenuItemsComputed ??=
          Computed<List<DropdownMenuItem<int>>>(() => super.ufMenuItems,
              name: '_PanelState.ufMenuItems'))
      .value;
  Computed<List<DropdownMenuItem<int>>>? _$cityMenuItemsComputed;

  @override
  List<DropdownMenuItem<int>> get cityMenuItems => (_$cityMenuItemsComputed ??=
          Computed<List<DropdownMenuItem<int>>>(() => super.cityMenuItems,
              name: '_PanelState.cityMenuItems'))
      .value;
  Computed<int?>? _$selectedUfValueOrNullComputed;

  @override
  int? get selectedUfValueOrNull => (_$selectedUfValueOrNullComputed ??=
          Computed<int?>(() => super.selectedUfValueOrNull,
              name: '_PanelState.selectedUfValueOrNull'))
      .value;
  Computed<String>? _$selectedUfInitialsComputed;

  @override
  String get selectedUfInitials => (_$selectedUfInitialsComputed ??=
          Computed<String>(() => super.selectedUfInitials,
              name: '_PanelState.selectedUfInitials'))
      .value;
  Computed<int?>? _$selectedCityValueOrNullComputed;

  @override
  int? get selectedCityValueOrNull => (_$selectedCityValueOrNullComputed ??=
          Computed<int?>(() => super.selectedCityValueOrNull,
              name: '_PanelState.selectedCityValueOrNull'))
      .value;
  Computed<String>? _$selectedCityNameComputed;

  @override
  String get selectedCityName => (_$selectedCityNameComputed ??=
          Computed<String>(() => super.selectedCityName,
              name: '_PanelState.selectedCityName'))
      .value;

  final _$selectedUfAtom = Atom(name: '_PanelState.selectedUf');

  @override
  int get selectedUf {
    _$selectedUfAtom.reportRead();
    return super.selectedUf;
  }

  @override
  set selectedUf(int value) {
    _$selectedUfAtom.reportWrite(value, super.selectedUf, () {
      super.selectedUf = value;
    });
  }

  final _$selectedCityAtom = Atom(name: '_PanelState.selectedCity');

  @override
  int get selectedCity {
    _$selectedCityAtom.reportRead();
    return super.selectedCity;
  }

  @override
  set selectedCity(int value) {
    _$selectedCityAtom.reportWrite(value, super.selectedCity, () {
      super.selectedCity = value;
    });
  }

  final _$initialDateAtom = Atom(name: '_PanelState.initialDate');

  @override
  String get initialDate {
    _$initialDateAtom.reportRead();
    return super.initialDate;
  }

  @override
  set initialDate(String value) {
    _$initialDateAtom.reportWrite(value, super.initialDate, () {
      super.initialDate = value;
    });
  }

  final _$ufsAtom = Atom(name: '_PanelState.ufs');

  @override
  ObservableList<Uf> get ufs {
    _$ufsAtom.reportRead();
    return super.ufs;
  }

  @override
  set ufs(ObservableList<Uf> value) {
    _$ufsAtom.reportWrite(value, super.ufs, () {
      super.ufs = value;
    });
  }

  final _$citiesAtom = Atom(name: '_PanelState.cities');

  @override
  ObservableList<City> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(ObservableList<City> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  final _$isLoadingUfsAtom = Atom(name: '_PanelState.isLoadingUfs');

  @override
  bool get isLoadingUfs {
    _$isLoadingUfsAtom.reportRead();
    return super.isLoadingUfs;
  }

  @override
  set isLoadingUfs(bool value) {
    _$isLoadingUfsAtom.reportWrite(value, super.isLoadingUfs, () {
      super.isLoadingUfs = value;
    });
  }

  final _$isLoadingCitiesAtom = Atom(name: '_PanelState.isLoadingCities');

  @override
  bool get isLoadingCities {
    _$isLoadingCitiesAtom.reportRead();
    return super.isLoadingCities;
  }

  @override
  set isLoadingCities(bool value) {
    _$isLoadingCitiesAtom.reportWrite(value, super.isLoadingCities, () {
      super.isLoadingCities = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PanelState.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isformSubmittedAtom = Atom(name: '_PanelState.isformSubmitted');

  @override
  bool get isformSubmitted {
    _$isformSubmittedAtom.reportRead();
    return super.isformSubmitted;
  }

  @override
  set isformSubmitted(bool value) {
    _$isformSubmittedAtom.reportWrite(value, super.isformSubmitted, () {
      super.isformSubmitted = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_PanelState.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$_PanelStateActionController = ActionController(name: '_PanelState');

  @override
  void changeSelectedUf(int? value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeSelectedUf');
    try {
      return super.changeSelectedUf(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedCity(int? value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeSelectedCity');
    try {
      return super.changeSelectedCity(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeInitialDate(String value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeInitialDate');
    try {
      return super.changeInitialDate(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeUfs(List<Uf> list) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeUfs');
    try {
      return super.changeUfs(list);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCities(List<City> list) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeCities');
    try {
      return super.changeCities(list);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoadingUfs(bool value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeIsLoadingUfs');
    try {
      return super.changeIsLoadingUfs(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoadingCities(bool value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeIsLoadingCities');
    try {
      return super.changeIsLoadingCities(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsFormSubmitted(bool value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeIsFormSubmitted');
    try {
      return super.changeIsFormSubmitted(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeErrorMessage');
    try {
      return super.changeErrorMessage(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedUf: ${selectedUf},
selectedCity: ${selectedCity},
initialDate: ${initialDate},
ufs: ${ufs},
cities: ${cities},
isLoadingUfs: ${isLoadingUfs},
isLoadingCities: ${isLoadingCities},
isLoading: ${isLoading},
isformSubmitted: ${isformSubmitted},
errorMessage: ${errorMessage},
isInitialDateValid: ${isInitialDateValid},
isUfInputEnabled: ${isUfInputEnabled},
isCitiesInputEnabled: ${isCitiesInputEnabled},
initialDateFormatted: ${initialDateFormatted},
initialDateStringToDateTime: ${initialDateStringToDateTime},
ufMenuItems: ${ufMenuItems},
cityMenuItems: ${cityMenuItems},
selectedUfValueOrNull: ${selectedUfValueOrNull},
selectedUfInitials: ${selectedUfInitials},
selectedCityValueOrNull: ${selectedCityValueOrNull},
selectedCityName: ${selectedCityName}
    ''';
  }
}
