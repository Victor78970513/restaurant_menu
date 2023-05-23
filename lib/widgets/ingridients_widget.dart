import 'package:flutter/material.dart';

class IngridientsWidget extends StatelessWidget {
  const IngridientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(30)),
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FadeInImage(
                    fit: BoxFit.fill,
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: AssetImage('assets/charque.jpg')),
              ),
            );
          }),
    );
  }
}
