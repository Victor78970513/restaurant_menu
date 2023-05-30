import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MesaProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Reservations',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 35, top: 35),
                  child: Text('Select a table',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 45),
                  height: 432,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MesaWidget(idmesa: 1),
                              MesaWidget(idmesa: 2)
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MesaWidget(idmesa: 3),
                              MesaWidget(idmesa: 4)
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MesaWidget(idmesa: 5),
                              MesaWidget(idmesa: 6)
                            ])
                      ],
                    ),
                  ),
                ),
                CustomButtonWidget(text: 'Reserve', width: 300.0, onTap: () {})
              ],
            ),
          )),
    );
  }
}
