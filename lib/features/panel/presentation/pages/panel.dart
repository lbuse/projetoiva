import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/widgets/date_picker.dart';
import '../../../cases_report/presentation/pages/cases_page.dart';
import '../../data/datasources/city_datasource.dart';
import '../../data/datasources/uf_datasource.dart';
import '../../data/repositories/city_repository_impl.dart';
import '../../data/repositories/uf_repository_impl.dart';
import '../stores/panel_state.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({Key key}) : super(key: key);

  @override
  _PanelPageState createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  final panelState = PanelState(
    ufRepository: UfRepositoryImpl(UfDataSourceImpl()),
    cityRepository: CityRepositoryImpl(CityDataSourceImpl()),
  );
  final formKey = GlobalKey<FormState>();
  final initialDateController = TextEditingController();
  final finalDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // setInitialDateValueViaController(panelState.initialDateFormatted);
    // setFinalDateValueViaController(panelState.finalDateFormatted);
    panelState.loadUfs();
  }

  @override
  void dispose() {
    initialDateController.dispose();
    finalDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: Stack(
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Covid Search',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Expanded(child: _buildSearchForm()),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0.0,
                top: 66.0,
                right: 0.0,
                bottom: 0.0,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Observer(
                          builder: (_) => CasesPage(
                            date: panelState.initialDateStringToDateTime,
                            state: panelState.selectedUfInitials,
                            city: panelState.selectedCityName,
                            submitTimeStamp: panelState.submitTimeStamp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form _buildSearchForm() {
    return Form(
      key: formKey,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            child: Observer(
              builder: (_) => DatePicker(
                currentDate: panelState.initialDateStringToDateTime,
                controller: initialDateController,
                label: 'Data',
                onChanged: panelState.changeInitialDate,
                onSelected: (value) {
                  panelState.changeInitialDate(value);
                  setInitialDateValueViaController(value);
                },
              ),
            ),
          ),
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
              builder: (_) => DropdownButtonFormField<int>(
                items: panelState.ufMenuItems,
                value: panelState.dropdownUfValue,
                onChanged: panelState.isUfInputEnabled
                    ? panelState.changeSelectedUf
                    : null,
                isExpanded: true,
                decoration: const InputDecoration()
                    .applyDefaults(Theme.of(context).inputDecorationTheme)
                    .copyWith(
                      border: const OutlineInputBorder(),
                      isDense: true,
                      labelText:
                          panelState.isLoadingUfs ? 'Carregando...' : 'Estado',
                    ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            fit: FlexFit.tight,
            child: Observer(
              builder: (_) => DropdownButtonFormField<int>(
                items: panelState.cityMenuItems,
                value: panelState.dropdownCityValue,
                onChanged: panelState.isCitiesInputEnabled
                    ? panelState.changeSelectedCity
                    : null,
                isExpanded: true,
                decoration: const InputDecoration()
                    .applyDefaults(Theme.of(context).inputDecorationTheme)
                    .copyWith(
                      border: const OutlineInputBorder(),
                      isDense: true,
                      labelText: panelState.isLoadingCities
                          ? 'Carregando...'
                          : 'Cidade',
                    ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            fit: FlexFit.loose,
            child: IconButton(
              icon: Icon(Icons.search_outlined),
              padding: EdgeInsets.zero,
              onPressed: () => panelState.changeSubmitTimeStamp(DateTime.now()),
            ),
          ),
        ],
      ),
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
