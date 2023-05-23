import 'package:flutter/material.dart';
import 'package:restaurant_menu/models/models.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:restaurant_menu/screens/screens.dart';

class SeccionPlato extends StatelessWidget {
  final ScrollController scrollController;
  final List platos;
  final Widget header;

  const SeccionPlato({
    super.key,
    required this.scrollController,
    required this.platos,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return platos.isEmpty
        ? Container(
            height: 100,
            child: const Center(child: CircularProgressIndicator()),
          )
        : Column(
            children: [
              header,
              SizedBox(
                height: 110,
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: platos.length,
                  itemBuilder: (context, index) {
                    final plato = platos[index];
                    final itemPositionOffset = index * 130;
                    final difference =
                        scrollController.offset - itemPositionOffset;
                    final percent = 1 - (difference / 110);
                    double opacity = percent;
                    if (opacity > 1.0) opacity = 1.0;
                    if (opacity < 0.0) opacity = 0.0;
                    return Opacity(
                      opacity: opacity,
                      child: Plato(
                        plato: plato,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}

class Plato extends StatelessWidget {
  final PlatosModel plato;
  const Plato({super.key, required this.plato});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DishDetailsScreen(plato: plato)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                0.1,
                1,
              ]),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        width: 110,
        child: Column(
          children: [
            Text(
              plato.nombre!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
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
                  height: 60,
                  width: 90,
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: AssetImage('assets/charque.jpg'),
                  // image: NetworkImage(plato.imagen!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String titulo;
  final String icono;
  const SectionHeader({
    super.key,
    required this.titulo,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => print(titulo),
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 19, bottom: 19),
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Iconify(
          icono,
          color: Colors.white,
          size: 36,
        )
      ],
    );
  }
}
