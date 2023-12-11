import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_guis/application/appbar.dart';
import 'package:flutter_guis/application/content.dart';
import 'package:flutter_guis/models/date_model.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints1) {
          return ChangeNotifierProvider(
            create: (context) => DateModel(),
            child: Column(
              children: [
                CalendarAppBar(barHeight: 50, barWidth: constraints1.maxWidth,),
                const CalendarContent(),
              ],
            ),
          );
        },
      ),
    );
  }
}
