import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/models/models.dart';
import 'package:restaurant_menu/utils/constants.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class DishDetailsScreen extends StatelessWidget {
  final PlatosModel plato;
  const DishDetailsScreen({super.key, required this.plato});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DetailsProvider(plato),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Details',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 45),
          ),
          centerTitle: true,
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 27),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const FadeInImage(
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          image: AssetImage('assets/charque.jpg'),
                        ))),
                Text(
                  plato.nombre!.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Text(plato.descripcion!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify),
                const SizedBox(height: 15),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_PlateCounter(), _TotalPrice()]),
                const SizedBox(height: 30),
                CustomButtonWidget(
                  text: 'Add to cart',
                  width: 320.0,
                  onTap: () {},
                  icon: FontAwesomeIcons.shop,
                )
              ],
            )),
      ),
    );
  }
}

class _TotalPrice extends StatelessWidget {
  const _TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<DetailsProvider>(context).totalPrice;
    return Container(
      width: 110,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff2D2B2B)),
      child: Center(
        child: Text(
          'Bs.$detailsProvider',
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _PlateCounter extends StatelessWidget {
  const _PlateCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<DetailsProvider>(context);
    return Container(
      width: 110,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff2D2B2B)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                detailsProvider.cantidad--;
              },
              icon: const Iconify(
                Constants.minusButton,
                color: Colors.white,
                size: 30,
              )),
          Text('${detailsProvider.cantidad}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          IconButton(
              onPressed: () {
                detailsProvider.cantidad++;
              },
              icon: const Iconify(
                Constants.addButton,
                color: Colors.white,
                size: 25,
              ))
        ],
      ),
    );
  }
}

class DetailsProvider extends ChangeNotifier {
  final PlatosModel plato;
  DetailsProvider(this.plato);

  int _cantidad = 0;
  num? totalPrice = 0;
  int get cantidad => _cantidad;
  set cantidad(int valor) {
    _cantidad = valor;
    totalPrice = _cantidad * plato.precio!;
    notifyListeners();
  }
}
