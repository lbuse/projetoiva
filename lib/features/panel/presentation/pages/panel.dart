import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:projetoiva/core/widgets/feedback_snackbar.dart';

import '../../../cases_report/presentation/pages/cases_page.dart';
import '../../data/datasources/city_datasource.dart';
import '../../data/datasources/uf_datasource.dart';
import '../../data/repositories/city_repository_impl.dart';
import '../../data/repositories/uf_repository_impl.dart';
import '../stores/panel_state.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({Key? key}) : super(key: key);

  @override
  _PanelPageState createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  final getIt = GetIt.instance;
  final panelState = PanelState(
    ufRepository: UfRepositoryImpl(UfDataSourceImpl()),
    cityRepository: CityRepositoryImpl(CityDataSourceImpl()),
  );
  final List<ReactionDisposer> _disposers = [];
  final formKey = GlobalKey<FormState>();
  final initialDateController = TextEditingController();
  final finalDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getIt.registerSingleton<PanelState>(panelState);
    _disposers.addAll([
      reaction<String>(
        (_) => panelState.errorMessage,
        (message) {
          if (message.isNotEmpty) {
            FeedbackSnackbar.show(
              context: context,
              message: message,
              type: SnackbarType.error,
              onClosedReaction: () => panelState.changeErrorMessage(''),
            );
          }
        },
      ),
    ]);
    panelState.loadUfs();
  }

  @override
  void dispose() {
    initialDateController.dispose();
    finalDateController.dispose();
    getIt.unregister<PanelState>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      top: 16.0,
                      right: 16.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'C'),
                                WidgetSpan(
                                  child: Image.asset(
                                    'assets/images/ic_covid.png',
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                                TextSpan(text: 'vid Search')
                              ],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: _buildSearchForm(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0.0,
              top: 72.0,
              right: 0.0,
              bottom: 0.0,
              child: CasesPage(),
            ),
          ],
        ),
      ),
    );
  }

  Form _buildSearchForm() {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   width: 180,
          //   child: Observer(
          //     builder: (_) => DatePicker(
          //       currentDate: panelState.initialDateStringToDateTime,
          //       controller: initialDateController,
          //       label: 'Data',
          //       onChanged: panelState.changeInitialDate,
          //       onSelected: (value) {
          //         panelState.changeInitialDate(value);
          //         setInitialDateValueViaController(value);
          //       },
          //     ),
          //   ),
          // ),
          // const SizedBox(width: 8.0),
          // SizedBox(
          //   width: 180,
          //   child: Observer(
          //     builder: (_) => DatePicker(
          //       currentDate: panelState.finalDateStringToDateTime,
          //       controller: finalDateController,
          //       label: 'Data Final',
          //       onChanged: panelState.changeFinalDate,
          //       onSelected: (value) {
          //         panelState.changeFinalDate(value);
          //         setFinalDateValueViaController(value);
          //       },
          //       validator: (_) =>
          //           panelState.isFinalDateValid ? null : 'Data inválida',
          //     ),
          //   ),
          // ),
          const SizedBox(width: 8.0),
          Flexible(
            fit: FlexFit.tight,
            child: Observer(
              builder: (_) => _buildDropdownFilter<int>(
                items: panelState.ufMenuItems,
                value: panelState.selectedUfValueOrNull,
                isEnabled: panelState.isUfInputEnabled,
                onChanged: panelState.isUfInputEnabled
                    ? panelState.changeSelectedUf
                    : null,
                labelText: panelState.isLoadingUfs ? 'Carregando...' : 'Estado',
                isLoading: panelState.isLoadingUfs,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            fit: FlexFit.tight,
            child: Observer(
              builder: (_) => _buildDropdownFilter<int>(
                items: panelState.cityMenuItems,
                value: panelState.selectedCityValueOrNull,
                isEnabled: panelState.isCitiesInputEnabled,
                onChanged: panelState.isCitiesInputEnabled
                    ? panelState.changeSelectedCity
                    : null,
                labelText:
                    panelState.isLoadingCities ? 'Carregando...' : 'Cidade',
                isLoading: panelState.isLoadingCities,
              ),
            ),
          ),
          // const SizedBox(width: 8.0),
          // Flexible(
          //   fit: FlexFit.loose,
          //   child: IconButton(
          //     icon: Icon(Icons.search_outlined),
          //     padding: EdgeInsets.zero,
          //     onPressed: () => panelState.changeSubmitTimeStamp(DateTime.now()),
          //   ),
          // ),
        ],
      ),
    );
  }

  Column _buildDropdownFilter<T>({
    required List<DropdownMenuItem<T>>? items,
    T? value,
    bool isEnabled = true,
    void Function(T?)? onChanged,
    required String labelText,
    bool isLoading = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField<T>(
          items: items,
          value: value,
          onChanged: isEnabled ? onChanged : null,
          isExpanded: true,
          decoration: const InputDecoration()
              .applyDefaults(Theme.of(context).inputDecorationTheme)
              .copyWith(
                border: const OutlineInputBorder(),
                isDense: true,
                labelText: labelText,
              ),
        ),
        AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: isLoading
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 3.0,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: LinearProgressIndicator(),
                  ),
                )
              : const SizedBox(height: 3.0),
        ),
      ],
    );
  }

  void setInitialDateValueViaController(String value) {
    initialDateController.value = TextEditingValue(
        text: value,
        selection: TextSelection.fromPosition(
          TextPosition(offset: value.length),
        ));
  }

  void setFinalDateValueViaController(String value) {
    finalDateController.value = TextEditingValue(
        text: value,
        selection: TextSelection.fromPosition(
          TextPosition(offset: value.length),
        ));
  }
}
