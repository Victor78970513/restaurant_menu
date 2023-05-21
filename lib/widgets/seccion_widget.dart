import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu/bloc/blocs.dart';
import 'package:restaurant_menu/models/models.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:restaurant_menu/utils/constants.dart';

class LunchPlato extends StatefulWidget {
  const LunchPlato({super.key});

  @override
  State<LunchPlato> createState() => _LunchPlatoState();
}

class _LunchPlatoState extends State<LunchPlato> {
  final scrollController = ScrollController();

  void onListen() {
    setState(() {
      print('SCROLL: ${scrollController.offset}');
    });
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    context.read<PlatosBloc>().add(OnGetLunchEvent());
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatosBloc, PlatosState>(
      builder: (context, state) {
        return state.lunch.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  const SectionHeader(
                    titulo: 'Lunch',
                    icono: Constants.lunch_chicken,
                  ),
                  Container(
                    height: 110,
                    child: ListView.builder(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.lunch.length,
                      itemBuilder: (context, index) {
                        final plato = state.lunch[index];
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
      },
    );
  }
}

class BreafFastPlato extends StatefulWidget {
  const BreafFastPlato({super.key});

  @override
  State<BreafFastPlato> createState() => _BreafFastPlatoState();
}

class _BreafFastPlatoState extends State<BreafFastPlato> {
  final scrollcontroller = ScrollController();
  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    scrollcontroller.addListener(onListen);
    context.read<PlatosBloc>().add(OnGetBreakFastEvent());
    super.initState();
  }

  @override
  void dispose() {
    scrollcontroller.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatosBloc, PlatosState>(
      builder: (context, state) {
        return state.breakfast.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  const SectionHeader(
                    titulo: 'BreakFast',
                    icono: Constants.breakfast_coffe,
                  ),
                  Container(
                    height: 110,
                    child: ListView.builder(
                      controller: scrollcontroller,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.breakfast.length,
                      itemBuilder: (context, index) {
                        final plato = state.breakfast[index];
                        final itemPositionOffset = index * 130;
                        final difference =
                            scrollcontroller.offset - itemPositionOffset;
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
      },
    );
  }
}

class AllSeccionPLato extends StatefulWidget {
  const AllSeccionPLato({super.key});

  @override
  State<AllSeccionPLato> createState() => _AllSeccionPLatoState();
}

class _AllSeccionPLatoState extends State<AllSeccionPLato> {
  final scrollController = ScrollController();
  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    context.read<PlatosBloc>().add(OnGetAllPlatos());
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatosBloc, PlatosState>(
      builder: (context, state) {
        return state.platos.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  const SectionHeader(
                    titulo: 'All',
                    icono: Constants.fork_knife,
                  ),
                  Container(
                    height: 110,
                    child: ListView.builder(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.platos.length,
                      itemBuilder: (context, index) {
                        final plato = state.platos[index];
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
      },
    );
  }
}

class Plato extends StatelessWidget {
  final PlatosModel plato;
  const Plato({super.key, required this.plato});

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
              0.1,
              1,
            ]),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      width: 110,
      // height: 110,
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
  // final IconData icon;
  final String icono;
  const SectionHeader({
    super.key,
    required this.titulo,
    required this.icono,
    // required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
