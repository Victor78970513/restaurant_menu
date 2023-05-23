import 'package:flutter/material.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class DishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double size = (MediaQuery.of(context).size.width - 220) / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Your Dish',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size),
              child: const FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: AssetImage('assets/plato.png')),
            ),
            const SizedBox(height: 44),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Choose Your Ingridients',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 15),
            const IngridientsWidget(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Maybe you are looking for',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            // TODO : MOSTRAR LOS PLATOS SEGUN EL INGREDIENTE QUE ESCOJA EL USUARIO
            const Expanded(
              child: Placeholder(),
            )
            // TODO : MOSTRAR LOS PLATOS SEGUN EL INGREDIENTE QUE ESCOJA EL USUARIO
          ],
        ),
      ),
    );
  }
}
