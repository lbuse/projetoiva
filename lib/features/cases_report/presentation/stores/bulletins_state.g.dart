// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletins_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BulletinsState on _BulletinsState, Store {
  Computed<DateTime?>? _$dateComputed;

  @override
  DateTime? get date => (_$dateComputed ??=
          Computed<DateTime?>(() => super.date, name: '_BulletinsState.date'))
      .value;
  Computed<String>? _$stateComputed;

  @override
  String get state => (_$stateComputed ??=
          Computed<String>(() => super.state, name: '_BulletinsState.state'))
      .value;
  Computed<String>? _$cityComputed;

  @override
  String get city => (_$cityComputed ??=
          Computed<String>(() => super.city, name: '_BulletinsState.city'))
      .value;
  Computed<String>? _$cityIbgeCodeComputed;

  @override
  String get cityIbgeCode =>
      (_$cityIbgeCodeComputed ??= Computed<String>(() => super.cityIbgeCode,
              name: '_BulletinsState.cityIbgeCode'))
          .value;
  Computed<PlaceType>? _$placeTypeComputed;

  @override
  PlaceType get placeType =>
      (_$placeTypeComputed ??= Computed<PlaceType>(() => super.placeType,
              name: '_BulletinsState.placeType'))
          .value;
  Computed<bool>? _$hasBulletinsComputed;

  @override
  bool get hasBulletins =>
      (_$hasBulletinsComputed ??= Computed<bool>(() => super.hasBulletins,
              name: '_BulletinsState.hasBulletins'))
          .value;
  Computed<bool>? _$nothingFoundComputed;

  @override
  bool get nothingFound =>
      (_$nothingFoundComputed ??= Computed<bool>(() => super.nothingFound,
              name: '_BulletinsState.nothingFound'))
          .value;
  Computed<bool>? _$isLoadMoreBulletinsEnabledComputed;

  @override
  bool get isLoadMoreBulletinsEnabled =>
      (_$isLoadMoreBulletinsEnabledComputed ??= Computed<bool>(
              () => super.isLoadMoreBulletinsEnabled,
              name: '_BulletinsState.isLoadMoreBulletinsEnabled'))
          .value;
  Computed<String>? _$hasFiltersChangedComputed;

  @override
  String get hasFiltersChanged => (_$hasFiltersChangedComputed ??=
          Computed<String>(() => super.hasFiltersChanged,
              name: '_BulletinsState.hasFiltersChanged'))
      .value;
  Computed<ObservableList<BulletinReturned>>? _$bulletinsByDateComputed;

  @override
  ObservableList<BulletinReturned> get bulletinsByDate =>
      (_$bulletinsByDateComputed ??= Computed<ObservableList<BulletinReturned>>(
              () => super.bulletinsByDate,
              name: '_BulletinsState.bulletinsByDate'))
          .value;

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

  final _$_bulletinsAtom = Atom(name: '_BulletinsState._bulletins');

  ObservableList<BulletinReturned> get bulletins {
    _$_bulletinsAtom.reportRead();
    return super._bulletins;
  }

  @override
  ObservableList<BulletinReturned> get _bulletins => bulletins;

  @override
  set _bulletins(ObservableList<BulletinReturned> value) {
    _$_bulletinsAtom.reportWrite(value, super._bulletins, () {
      super._bulletins = value;
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

  final _$allBulletinsAreLoadedAtom =
      Atom(name: '_BulletinsState.allBulletinsAreLoaded');

  @override
  bool get allBulletinsAreLoaded {
    _$allBulletinsAreLoadedAtom.reportRead();
    return super.allBulletinsAreLoaded;
  }

  @override
  set allBulletinsAreLoaded(bool value) {
    _$allBulletinsAreLoadedAtom.reportWrite(value, super.allBulletinsAreLoaded,
        () {
      super.allBulletinsAreLoaded = value;
    });
  }

  final _$_isFirstLoadingAtom = Atom(name: '_BulletinsState._isFirstLoading');

  bool get isFirstLoading {
    _$_isFirstLoadingAtom.reportRead();
    return super._isFirstLoading;
  }

  @override
  bool get _isFirstLoading => isFirstLoading;

  @override
  set _isFirstLoading(bool value) {
    _$_isFirstLoadingAtom.reportWrite(value, super._isFirstLoading, () {
      super._isFirstLoading = value;
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
  void changeBulletins(List<BulletinReturned> list) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeBulletins');
    try {
      return super.changeBulletins(list);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addBulletins(List<BulletinReturned> list) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.addBulletins');
    try {
      return super.addBulletins(list);
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
  void changeAllBulletinsAreLoaded(bool value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeAllBulletinsAreLoaded');
    try {
      return super.changeAllBulletinsAreLoaded(value);
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
  void changeIsFirstLoading(bool value) {
    final _$actionInfo = _$_BulletinsStateActionController.startAction(
        name: '_BulletinsState.changeIsFirstLoading');
    try {
      return super.changeIsFirstLoading(value);
    } finally {
      _$_BulletinsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
isLoading: ${isLoading},
allBulletinsAreLoaded: ${allBulletinsAreLoaded},
date: ${date},
state: ${state},
city: ${city},
cityIbgeCode: ${cityIbgeCode},
placeType: ${placeType},
hasBulletins: ${hasBulletins},
nothingFound: ${nothingFound},
isLoadMoreBulletinsEnabled: ${isLoadMoreBulletinsEnabled},
hasFiltersChanged: ${hasFiltersChanged},
bulletinsByDate: ${bulletinsByDate}
    ''';
  }
}
