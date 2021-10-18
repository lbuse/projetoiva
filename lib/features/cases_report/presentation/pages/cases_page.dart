import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/datasources/bulletin_data_source.dart';
import '../../data/repositories/bulletin_repository_impl.dart';
import '../../domain/usecases/get_cases.dart';
import '../stores/bulletins_state.dart';

enum MetricType {
  cases,
  deaths,
  deathRate,
}

class CasesPage extends StatefulWidget {
  const CasesPage({Key? key}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    _disposers.addAll([
      reaction(
        (_) => bulletinsState.hasFiltersChanged,
        (_) => bulletinsState.loadBulletins(),
      ),
    ]);
    bulletinsState.loadBulletins();
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
    return LayoutBuilder(
      builder: (_, constraints) => Stack(
        children: [
          Positioned(
            left: 0.0,
            top: 0.0,
            right: 0.0,
            child: AnimatedSwitcher(
              duration: kThemeAnimationDuration,
              child: Observer(
                builder: (_) => bulletinsState.isLoading
                    ? const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: LinearProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
          Positioned(
            left: 16.0,
            top: 8.0,
            right: 16.0,
            bottom: 16.0,
            child: Observer(
              builder: (_) => bulletinsState.nothingFound
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '(˚Δ˚)b',
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    fontFamily: 'Roboto',
                                    fontSize: 156,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 56),
                        Text(
                          '''Nenhum dado entrontrado ${bulletinsState.state.isNotEmpty ? 'para ' + bulletinsState.state : ''} ${bulletinsState.city.isNotEmpty ? 'e ' + bulletinsState.city : ''}''',
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Observer(
                            builder: (_) => bulletinsState.hasBulletins
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        child: Text(
                                          bulletinsState.allBulletinsAreLoaded
                                              ? 'Todos os dados foram carregados'
                                              : 'Carregar mais dados',
                                        ),
                                        onPressed: bulletinsState
                                                .isLoadMoreBulletinsEnabled
                                            ? () =>
                                                bulletinsState.loadBulletins(
                                                  page: bulletinsState.page + 1,
                                                )
                                            : null,
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ),
                          const SizedBox(height: 8.0),
                          constraints.maxWidth > 860
                              ? Row(
                                  children: _buildCasesIndicators(),
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: _buildCasesIndicators(),
                                ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCasesIndicators() {
    return [
      Flexible(
        child: Observer(
          builder: (_) => _buildSfCartesianChart(
            title: 'Casos Acumulados',
            lineSeriesName: 'Casos',
            bulletins: bulletinsState.bulletinsByDate,
            metricType: MetricType.cases,
          ),
        ),
      ),
      const SizedBox(width: 8.0, height: 8.0),
      Flexible(
        child: Observer(
          builder: (_) => _buildSfCartesianChart(
            title: 'Óbitos Acumulados',
            lineSeriesName: 'Óbitos',
            bulletins: bulletinsState.bulletinsByDate,
            metricType: MetricType.deaths,
          ),
        ),
      ),
      const SizedBox(width: 8.0, height: 8.0),
      Flexible(
        child: Observer(
          builder: (_) => _buildSfCartesianChart(
            title: 'Taxa de mortalidade',
            lineSeriesName: 'Mortalidade',
            bulletins: bulletinsState.bulletinsByDate,
            metricType: MetricType.deathRate,
          ),
        ),
      ),
    ];
  }

  Widget _buildSfCartesianChart({
    required String title,
    String? yAxisTitle,
    String? xAxisTitle,
    required List<BulletinReturned> bulletins,
    String? lineSeriesName,
    required MetricType metricType,
    double? width,
    double? height = 400,
  }) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: bulletins.isEmpty
          ? const SizedBox.shrink()
          : Card(
              child: Container(
                width: width,
                height: height,
                padding: const EdgeInsets.all(16.0),
                child: SfCartesianChart(
                  title: ChartTitle(
                    text: title,
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  enableAxisAnimation: true,
                  primaryYAxis: NumericAxis(
                    title: AxisTitle(text: yAxisTitle),
                    labelFormat:
                        metricType == MetricType.deathRate ? '{value}%' : null,
                  ),
                  primaryXAxis: DateTimeCategoryAxis(
                    title: AxisTitle(text: xAxisTitle),
                    dateFormat: DateFormat(null, 'pt').add_MMMd(),
                  ),
                  series: <ChartSeries<BulletinReturned, dynamic>>[
                    FastLineSeries<BulletinReturned, dynamic>(
                      dataSource: bulletins,
                      xValueMapper: (bulletin, _) => bulletin.date,
                      yValueMapper: (bulletin, _) {
                        switch (metricType) {
                          case MetricType.deaths:
                            return bulletin.deaths;
                          case MetricType.deathRate:
                            return bulletin.deathRateFormated;
                          default:
                            return bulletin.confirmed;
                        }
                      },
                      name: lineSeriesName,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
