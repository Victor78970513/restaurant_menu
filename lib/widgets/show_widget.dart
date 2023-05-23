import 'package:flutter/material.dart';
import 'package:restaurant_menu/models/models.dart';

class SeccionShow extends StatelessWidget {
  final ScrollController scrollController;
  final List shows;

  const SeccionShow({
    super.key,
    required this.scrollController,
    required this.shows,
  });

  @override
  Widget build(BuildContext context) {
    return shows.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            child: ListView.builder(
              controller: scrollController,
              itemCount: shows.length,
              itemBuilder: (context, index) {
                final show = shows[index];
                final itemPositionOffset = index * 170;
                final difference = scrollController.offset - itemPositionOffset;
                final percent = 1.6 - (difference / (150 / 2));
                double opacity = percent;
                double scale = percent;
                if (opacity > 1.0) opacity = 1.0;
                if (opacity < 0.0) opacity = 0.0;
                if (scale > 1.0) scale = 1;
                return Column(
                  children: [
                    Opacity(
                      opacity: opacity,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(scale - 1),
                        child: ShowCard(show: show),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
  }
}

class ShowCard extends StatelessWidget {
  final ShowModel show;
  const ShowCard({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
    return InkWell(
      onTap: () => print(show.idFuncion),
      child: Container(
        height: 170,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(show.nombre!, style: style),
                Text(show.fecha!.substring(0, 10), style: style)
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              height: 80,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: const FadeInImage(
                  fit: BoxFit.fitWidth,
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: AssetImage('assets/tinku.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                show.descripcion!,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
