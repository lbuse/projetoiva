import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../data/datasources/bulletin_data_source.dart';
import '../../data/repositories/bulletin_repository_impl.dart';
import '../../domain/entities/bulletin.dart';
import '../stores/bulletins_state.dart';

class CasesPage extends StatefulWidget {
  final DateTime? date;
  final String? state;
  final String? city;
  final PlaceType? placeType;
  final DateTime? submitTimeStamp;

  const CasesPage({
    Key? key,
    this.date,
    this.state,
    this.city,
    this.placeType,
    this.submitTimeStamp,
  }) : super(key: key);

  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  final bulletinsState = BulletinsState(
    BulletinRepositoryImpl(
      BulletinDataSourceImpl(
        token: '4b959e1dcdec2c08abbae85ce111d9c659a0822d',
      ),
    ),
  );
  final List<ReactionDisposer> _disposers = [];
  final List<charts.Series<dynamic, num>> seriesList = [];

  @override
  void initState() {
    super.initState();
    _disposers.addAll([
      reaction(
        (_) => bulletinsState.submitTimeStamp,
        (dynamic _) {
          print(widget.submitTimeStamp.toString());
          bulletinsState.loadBulletins();
        },
      ),
    ]);
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    bulletinsState.changeDate(widget.date);
    bulletinsState.changeState(widget.state);
    bulletinsState.changeCity(widget.city);
    bulletinsState.changeSubmitTimeStamp(widget.submitTimeStamp);
  }

  @override
  void dispose() {
    for (final dispose in _disposers) {
      dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 600,
      child: Container(), //charts.LineChart(seriesList),
    );
  }
}
