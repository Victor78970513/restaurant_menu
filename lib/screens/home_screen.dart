import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_menu/bloc/platos/platos_bloc.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<PlatosBloc>().add(OnGetAllPlatos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatosBloc, PlatosState>(
      builder: (context, state) {
        print(state.platos);
        return Scaffold(
          backgroundColor: const Color(0xff1B1D22),
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CustomIconButton(
                        icon: FontAwesomeIcons.masksTheater, route: 'shows'),
                    Text('Peña-Res',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600)),
                    CustomIconButton(
                        icon: FontAwesomeIcons.locationDot, route: 'loading')
                  ],
                ),
                const SizedBox(height: 19),
                const SearchContainer(),
                const SizedBox(height: 19),
                state.platos.isEmpty
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SectionHeader(
                                titulo: 'titulo',
                                icon: FontAwesomeIcons.spoon,
                              ),
                              Container(
                                height: 110,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.platos.length,
                                    itemBuilder: (context, index) {
                                      final texto = state.platos[index];
                                      return Plato();
                                    }),
                              ),
                              const SizedBox(height: 10),
                              const SectionHeader(
                                  titulo: 'BreakFast',
                                  icon: FontAwesomeIcons.breadSlice),
                              Container(
                                height: 110,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.platos.length,
                                    itemBuilder: (context, index) {
                                      final texto = state.platos[index];
                                      return Plato();
                                    }),
                              ),
                              const SizedBox(height: 10),
                              const SectionHeader(
                                titulo: 'Lunch',
                                icon: FontAwesomeIcons.briefcase,
                              ),
                              Container(
                                height: 110,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.platos.length,
                                    itemBuilder: (context, index) {
                                      final texto = state.platos[index];
                                      return Plato();
                                    }),
                              ),
                              const SizedBox(height: 10),
                              const SectionHeader(
                                titulo: 'Dinner',
                                icon: FontAwesomeIcons.cakeCandles,
                              ),
                              Container(
                                height: 110,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.platos.length,
                                    itemBuilder: (context, index) {
                                      final texto = state.platos[index];
                                      return Plato();
                                    }),
                              ),
                              const SizedBox(height: 10),
                              const SectionHeader(
                                titulo: 'Desserts',
                                icon: FontAwesomeIcons.cookie,
                              ),
                              Container(
                                height: 110,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.platos.length,
                                    itemBuilder: (context, index) {
                                      final texto = state.platos[index];
                                      return Plato();
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String route;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      icon: Icon(
        icon,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          width: 320,
          height: 35,
          decoration: BoxDecoration(
              color: const Color(0xffE7E7E7),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.black,
                  )),
              const SizedBox(width: 80),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      label: Text(
                    'Search...',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 50),
              margin: const EdgeInsets.only(left: 50),
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                  color: const Color(0xffE7E7E7),
                  borderRadius: BorderRadius.circular(30)),
              child: const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      label: Text(
                    'Search...',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.handHoldingDollar,
                  color: Colors.white,
                  size: 35,
                ))
          ],
        ),
      ],
    );
  }
}
