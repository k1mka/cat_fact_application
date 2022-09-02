import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CatFactWidget extends StatefulWidget {
  final String fact;
  final DateTime date;
  const CatFactWidget({Key? key, required this.fact, required this.date})
      : super(key: key);

  @override
  State<CatFactWidget> createState() => _CatFactWidgetState();
}

class _CatFactWidgetState extends State<CatFactWidget> {
  String formattedDate = '';

  @override
  void didChangeDependencies() {
    initializeDateFormatting().then((_) => setState(() {}));
    String locale = Localizations.localeOf(context).languageCode;
    formattedDate = DateFormat.yMd(locale).format(widget.date);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            // TODO: format data with locale
            'Created at $formattedDate',
            style: const TextStyle(
              fontSize: 20,
              // TODO: добавить красивый шрифт
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Text(
                  widget.fact,
                  style: const TextStyle(
                    fontSize: 20,
                    // TODO: добавить красивый шрифт
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
