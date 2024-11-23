import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime _mondayOfWeek;
  late bool _isWeekend;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _mondayOfWeek = DateTime(now.year, now.month, now.day - (now.weekday - 1));
    _isWeekend = now.weekday == DateTime.saturday || now.weekday == DateTime.sunday;
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('de', null);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.nightlight_round,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white, // todo: REMOVE THE BACKGROUNDCOLOR AND ADD WHITE/DARKMODE
        body: Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd('de').format(DateTime.now()),
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
              Text(
                DateFormat.EEEE('de').format(DateTime.now()),
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    fontWeight: FontWeight.bold
                ),
              ),
              if (_isWeekend)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Hinweis: Samstag und Sonntag sind ausgeblendet.",
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: DatePicker(
                  _mondayOfWeek,
                  width: 60,
                  height: 100,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.blue,
                  selectedTextColor: Colors.white,
                  dateTextStyle: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                  dayTextStyle: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                  monthTextStyle: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                  locale: 'de',
                  daysCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
