import 'package:e_com_flutter/covid_19/model/WorldStateModel.dart';
import 'package:e_com_flutter/covid_19/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final colorList = <Color>[
    Color(0xFF4285F4),
    Color(0xFF1aa260),
    Color(0xFFde5246),
  ];

  final dataMap = <String, double>{
    'Total': 20,
    'Recovered': 15,
    'Deaths': 5,
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    StatesServices statesServices = StatesServices();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .02,
              ),
              FutureBuilder(
                future: statesServices.fetchWorldStateRecords(),
                builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                  var data = snapshot.data;
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50.0,
                        controller: _controller,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            'Total': double.parse(data!.cases.toString()),
                            'Recovered': double.parse(data.recovered.toString()),
                            'Deaths': double.parse(data.deaths.toString()),
                          },
                          animationDuration: Duration(milliseconds: 1200),
                          legendOptions: LegendOptions(
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendPosition: LegendPosition.left),
                          centerText: "CHART",
                          chartType: ChartType.ring,
                          colorList: colorList,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height * .06),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(title: 'Total', value: '200'),
                                ReusableRow(title: 'Total', value: '200'),
                                ReusableRow(title: 'Total', value: '200'),
                                ReusableRow(title: 'Total', value: '200'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text("Track Countires"),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  ReusableRow({super.key, required this.title, required this.value});

  String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}
