import 'package:flutter/material.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class DishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double size = (MediaQuery.of(context).size.width - 220) / 2;
    return Scaffold(
      backgroundColor: const Color(0xff1B1D22),
      appBar: AppBar(
        title: const Text(
          'Make Your Dish',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
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
            const Text(
              'Choose Your Ingridients',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            const IngridientsWidget()
          ],
        ),
      ),
    );
  }
}
