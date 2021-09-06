// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletins_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BulletinsState on _BulletinsState, Store {
  final _$pageAtom = Atom(name: '_BulletinsState.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$dateAtom = Atom(name: '_BulletinsState.date');

  @override
  DateTime? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$stateAtom = Atom(name: '_BulletinsState.state');

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$cityAtom = Atom(name: '_BulletinsState.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$placeTypeAtom = Atom(name: '_BulletinsState.placeType');

  @override
  PlaceType get placeType {
    _$placeTypeAtom.reportRead();
    return super.placeType;
  }

  @override
  set placeType(PlaceType value) {
    _$placeTypeAtom.reportWrite(value, super.placeType, () {
      super.placeType = value;
    });
  }

  final _$bulletinsAtom = Atom(name: '_BulletinsState.bulletins');

  @override
  ObservableList<Bulletin> get bulletins {
    _$bulletinsAtom.reportRead();
    return super.bulletins;
  }

  @override
  set bulletins(ObservableList<Bulletin> value) {
    _$bulletinsAtom.reportWrite(value, super.bulletins, () {
      super.bulletins = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_BulletinsState.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_BulletinsState.errorMessage');

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

  final _$submitTimeStampAtom = Atom(name: '_BulletinsState.submitTimeStamp');

  @override
  DateTime? get submitTimeStamp {
    _$submitTimeStampAtom.reportRead();
    return super.submitTimeStamp;
  }

  @override
  set submitTimeStamp(DateTime? value) {
    _$submitTimeStampAtom.reportWrite(value, super.submitTimeStamp, () {
      super.submitTimeStamp = value;
    });
  }

  final _$_BulletinsStateActionController =
      ActionController(name: '_BulletinsState');

  @override
  void changePage(int value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changePage');
    try {
      return super.changePage(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDate(DateTime? value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeDate');
    try {
      return super.changeDate(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeState(String? value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCity(String? value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeCity');
    try {
      return super.changeCity(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePlaceType(PlaceType value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changePlaceType');
    try {
      return super.changePlaceType(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBulletinsList(List<Bulletin> list) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeBulletinsList');
    try {
      return super.changeBulletinsList(list);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeErrorMessage');
    try {
      return super.changeErrorMessage(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSubmitTimeStamp(DateTime? value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeSubmitTimeStamp');
    try {
      return super.changeSubmitTimeStamp(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
date: ${date},
state: ${state},
city: ${city},
placeType: ${placeType},
bulletins: ${bulletins},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
submitTimeStamp: ${submitTimeStamp}
    ''';
  }
}
