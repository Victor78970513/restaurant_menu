import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MesaWidget extends StatelessWidget {
  final int idmesa;
  const MesaWidget({super.key, required this.idmesa});

  @override
  Widget build(BuildContext context) {
    final mesaProvider = Provider.of<MesaProvider>(context);
    return GestureDetector(
      onTap: () {
        mesaProvider.index = idmesa;
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 14),
          height: 110,
          width: 128,
          child: Column(
            children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_Silla(), _Silla()]),
              Stack(
                children: [
                  _Mesa(
                      color: mesaProvider.index == idmesa
                          ? Colors.orange[600]!
                          : Colors.black),
                  Positioned(
                    top: 10,
                    left: 50,
                    child: Text(
                      '$idmesa',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_Silla(), _Silla()]),
            ],
          )),
    );
  }
}

class _Silla extends StatelessWidget {
  const _Silla();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: 15,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 3, color: Colors.black)),
    );
  }
}

class _Mesa extends StatelessWidget {
  final Color color;

  const _Mesa({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 106,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 3, color: color)),
    );
  }
}

class MesaProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set index(int valor) {
    _index = valor;
    notifyListeners();
  }
}
