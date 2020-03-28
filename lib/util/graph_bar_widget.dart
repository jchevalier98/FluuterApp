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

    print('----> ${widget.data}');
    final expenses = new List<DayOfMonth>();
    for(int i = 0; i < widget.data.length; i++){
      print(widget.data[i].toString());
      expenses.add(new DayOfMonth(i.toString(), widget.data[i]));
    }

    List<Series<DayOfMonth, String>> series = [
      Series<DayOfMonth, String>(
        id: 'Mobile',
        domainFn: (DayOfMonth index, _) => index.day,
        measureFn: (DayOfMonth index, _) => index.amount,
        data: expenses,
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) =>
            MaterialPalette.blue.shadeDefault.lighter,
      )
    ];

    final staticTicks = <TickSpec<String>>[
      TickSpec('0', label: '01', style: new TextStyleSpec(color: new Color(r: 0x192, g: 0x192, b: 0x192))),
      TickSpec('4', label: '05', style: new TextStyleSpec(color: new Color(r: 0x192, g: 0x192, b: 0x192))),
      TickSpec('9', label: '10', style: new TextStyleSpec(color: new Color(r: 0x192, g: 0x192, b: 0x192))),
      TickSpec('14', label: '15', style: new TextStyleSpec(color: new Color(r: 0x192, g: 0x192, b: 0x192))),
      TickSpec('19', label: '20', style: new TextStyleSpec(color: new Color(r: 0x192, g: 0x192, b: 0x192))),
      TickSpec('24', label: '25', style: new TextStyleSpec(color: new Color(r: 0x192, g: 0x192, b: 0x192))),
      TickSpec('29', label: '30', style: new TextStyleSpec(color: new Color(r: 0x192, g: 0x192, b: 0x192))),
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
      barGroupingType: BarGroupingType.stacked,
    );
  }
}

class DayOfMonth {
  final String day;
  final double amount;

  DayOfMonth(this.day, this.amount);
}