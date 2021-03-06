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

  final _$_selectedUfAtom = Atom(name: '_PanelState._selectedUf');

  int get selectedUf {
    _$_selectedUfAtom.reportRead();
    return super._selectedUf;
  }

  @override
  int get _selectedUf => selectedUf;

  @override
  set _selectedUf(int value) {
    _$_selectedUfAtom.reportWrite(value, super._selectedUf, () {
      super._selectedUf = value;
    });
  }

  final _$_selectedCityAtom = Atom(name: '_PanelState._selectedCity');

  int get selectedCity {
    _$_selectedCityAtom.reportRead();
    return super._selectedCity;
  }

  @override
  int get _selectedCity => selectedCity;

  @override
  set _selectedCity(int value) {
    _$_selectedCityAtom.reportWrite(value, super._selectedCity, () {
      super._selectedCity = value;
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

  final _$_ufsAtom = Atom(name: '_PanelState._ufs');

  ObservableList<Uf> get ufs {
    _$_ufsAtom.reportRead();
    return super._ufs;
  }

  @override
  ObservableList<Uf> get _ufs => ufs;

  @override
  set _ufs(ObservableList<Uf> value) {
    _$_ufsAtom.reportWrite(value, super._ufs, () {
      super._ufs = value;
    });
  }

  final _$_citiesAtom = Atom(name: '_PanelState._cities');

  ObservableList<City> get cities {
    _$_citiesAtom.reportRead();
    return super._cities;
  }

  @override
  ObservableList<City> get _cities => cities;

  @override
  set _cities(ObservableList<City> value) {
    _$_citiesAtom.reportWrite(value, super._cities, () {
      super._cities = value;
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
initialDate: ${initialDate},
isLoadingUfs: ${isLoadingUfs},
isLoadingCities: ${isLoadingCities},
isLoading: ${isLoading},
isformSubmitted: ${isformSubmitted},
errorMessage: ${errorMessage},
isInitialDateValid: ${isInitialDateValid},
isUfInputEnabled: ${isUfInputEnabled},
isCitiesInputEnabled: ${isCitiesInputEnabled},
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
