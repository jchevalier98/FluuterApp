import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';


class SimpleBarChart extends StatefulWidget {

  final List<double> data;
  const SimpleBarChart({Key key, this.data}) : super(key:key);
  @override
  _SimpleBarChartState createState() => _SimpleBarChartState();
}


class _SimpleBarChartState extends State<SimpleBarChart>{

  _onSelectionChanged(SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    var time;
    final measures = <String, double>{};
    if(selectedDatum.isNotEmpty) {
      time = selectedDatum.first.datum;
      selectedDatum.forEach((SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum;
      });
    }
    print(time);
  }
  @override
  Widget build(BuildContext context) {

    final expenses = new List<DayOfMonth>();
    for(int i = 0; i < widget.data.length; i++){
      print(widget.data[i].toString());
      expenses.add(new DayOfMonth(i.toString(), widget.data[i]));
    }

    List<Series<DayOfMonth, String>> series = [
      Series<DayOfMonth, String>(
        id: 'Mobile',
        colorFn: (_, __) => MaterialPalette.red.shadeDefault,
        domainFn: (DayOfMonth index, _) => index.year,
        measureFn: (DayOfMonth index, _) => index.sales,
        data: expenses,
        strokeWidthPxFn: (_, __) => 4,
      )
    ];

    final staticTicks = <TickSpec<String>>[
      TickSpec('0', label: '01'),
      TickSpec('4', label: '05'),
      TickSpec('9', label: '10'),
      TickSpec('14', label: '15'),
      TickSpec('19', label: '20'),
      TickSpec('24', label: '25'),
      TickSpec('29', label: '30'),
    ];

    return BarChart(
      series,
      animate: true,
      selectionModels: [
        SelectionModelConfig(
          type: SelectionModelType.info,
          changedListener: _onSelectionChanged,
        )
      ],
      domainAxis: new OrdinalAxisSpec(
        tickProviderSpec: new StaticOrdinalTickProviderSpec(staticTicks)
      ),
    );
  }
}

/// Sample ordinal data type.
class DayOfMonth {
  final String year;
  final double sales;

  DayOfMonth(this.year, this.sales);
}