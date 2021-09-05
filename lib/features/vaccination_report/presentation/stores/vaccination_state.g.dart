// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VaccinationState on _VaccinationState, Store {
  final _$scrollIdAtom = Atom(name: '_VaccinationState.scrollId');

  @override
  String get scrollId {
    _$scrollIdAtom.reportRead();
    return super.scrollId;
  }

  @override
  set scrollId(String value) {
    _$scrollIdAtom.reportWrite(value, super.scrollId, () {
      super.scrollId = value;
    });
  }

  final _$vaccinesAppliedAtom = Atom(name: '_VaccinationState.vaccinesApplied');

  @override
  ObservableList<Vaccination> get vaccinesApplied {
    _$vaccinesAppliedAtom.reportRead();
    return super.vaccinesApplied;
  }

  @override
  set vaccinesApplied(ObservableList<Vaccination> value) {
    _$vaccinesAppliedAtom.reportWrite(value, super.vaccinesApplied, () {
      super.vaccinesApplied = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_VaccinationState.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_VaccinationState.errorMessage');

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

  final _$_VaccinationStateActionController =
      ActionController(name: '_VaccinationState');

  @override
  void changePage(String value) {
    final _$actionInfo = _$_VaccinationStateActionController.startAction(
        name: '_VaccinationState.changePage');
    try {
      return super.changePage(value);
    } finally {
      _$_VaccinationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVaccinesApplied(List<Vaccination> list) {
    final _$actionInfo = _$_VaccinationStateActionController.startAction(
        name: '_VaccinationState.changeVaccinesApplied');
    try {
      return super.changeVaccinesApplied(list);
    } finally {
      _$_VaccinationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_VaccinationStateActionController.startAction(
        name: '_VaccinationState.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_VaccinationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String value) {
    final _$actionInfo = _$_VaccinationStateActionController.startAction(
        name: '_VaccinationState.changeErrorMessage');
    try {
      return super.changeErrorMessage(value);
    } finally {
      _$_VaccinationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scrollId: ${scrollId},
vaccinesApplied: ${vaccinesApplied},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
