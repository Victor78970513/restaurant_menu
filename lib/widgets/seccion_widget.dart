import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Plato extends StatelessWidget {
  const Plato({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              // Color.fromARGB(255, 235, 182, 182),
              Color.fromARGB(255, 211, 188, 188),
              Colors.transparent,
            ],
            stops: [
              0.4,
              1,
            ]),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      width: 110,
      // height: 110,
      child: Column(
        children: [
          const Text(
            'Charquekan',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.59,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: AssetImage('assets/charque.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String titulo;
  const SectionHeader({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffFEA04D),
                Color(0xffFE564D),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
            child: Text(
              titulo,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(width: 15),
        const Icon(
          FontAwesomeIcons.spoon,
          color: Colors.white,
          size: 36,
        )
      ],
    );
  }
}
