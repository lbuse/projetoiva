import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../helpers/datetime_input_formatter.dart';

class DatePicker extends StatelessWidget {
  final DateTime? currentDate;
  final TextEditingController controller;
  final Function onChanged;
  final void Function(String) onSelected;
  final String Function(String?)? validator;
  final String label;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;
  final FocusScopeNode? focusScopeNode;

  const DatePicker({
    Key? key,
    required this.currentDate,
    required this.controller,
    required this.onChanged,
    required this.onSelected,
    this.validator,
    required this.label,
    this.enabled = true,
    this.autovalidateMode,
    this.focusScopeNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      onChanged: onChanged as void Function(String)?,
      validator: validator,
      onEditingComplete: () => focusScopeNode?.nextFocus(),
      decoration: const InputDecoration()
          .applyDefaults(Theme.of(context).inputDecorationTheme)
          .copyWith(
            labelText: label,
            isDense: true,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 16.0,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
          ),
      keyboardType: TextInputType.datetime,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        DateTimeInputFormatter(),
      ],
      enabled: enabled,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime? picked = await showDatePicker(
        locale: Locale('pt', 'BR'),
        context: context,
        initialDate: currentDate ?? DateTime.now(),
        currentDate: currentDate ?? DateTime.now(),
        firstDate: DateTime(2019, 10),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != currentDate) {
        onSelected(DateFormat('dd/MM/yyyy').format(picked));
      }
    } on Exception {
      // ignore
    }
  }
}
