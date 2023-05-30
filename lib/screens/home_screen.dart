import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_menu/bloc/blocs.dart';
import 'package:restaurant_menu/utils/constants.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController1 = ScrollController();
  final scrollController2 = ScrollController();
  final scrollController3 = ScrollController();
  final scrollController4 = ScrollController();
  final scrollController5 = ScrollController();
  final scrollController6 = ScrollController();
  void onListen() => setState(() {});
  void addListeners() {
    scrollController1.addListener(onListen);
    scrollController2.addListener(onListen);
    scrollController3.addListener(onListen);
    scrollController4.addListener(onListen);
    scrollController5.addListener(onListen);
    scrollController6.addListener(onListen);
  }

  void removeListeners() {
    scrollController1.removeListener(onListen);
    scrollController2.removeListener(onListen);
    scrollController3.removeListener(onListen);
    scrollController4.removeListener(onListen);
    scrollController5.removeListener(onListen);
    scrollController6.removeListener(onListen);
  }

  @override
  void initState() {
    addListeners();
    context.read<PlatosBloc>()
      ..add(OnGetAllPlatos())
      ..add(OnGetBreakFastEvent())
      ..add(OnGetLunchEvent())
      ..add(OnGetDinnerEvent())
      ..add(OnGetDessertEvent())
      ..add(OnGetDrinkEvent());
    super.initState();
  }

  @override
  void dispose() {
    removeListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatosBloc, PlatosState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                        icon: FontAwesomeIcons.masksTheater, route: 'show'),
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
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SeccionPlato(
                          scrollController: scrollController1,
                          platos: state.platos,
                          header: const SectionHeader(
                            titulo: 'All',
                            icono: Constants.forkKnife,
                          ),
                        ),
                        SeccionPlato(
                          scrollController: scrollController2,
                          platos: state.breakfast,
                          header: const SectionHeader(
                            titulo: 'BreakFast',
                            icono: Constants.breakfastCoffe,
                          ),
                        ),
                        SeccionPlato(
                          scrollController: scrollController3,
                          platos: state.lunch,
                          header: const SectionHeader(
                            titulo: 'Lunch',
                            icono: Constants.lunchChicken,
                          ),
                        ),
                        SeccionPlato(
                            scrollController: scrollController4,
                            platos: state.dinner,
                            header: const SectionHeader(
                                titulo: 'Dinner', icono: Constants.dinnerSoup)),
                        SeccionPlato(
                            scrollController: scrollController5,
                            platos: state.dessert,
                            header: const SectionHeader(
                                titulo: 'Dessert',
                                icono: Constants.dessertIceCream)),
                        SeccionPlato(
                            scrollController: scrollController6,
                            platos: state.drinks,
                            header: const SectionHeader(
                                titulo: 'Drinks',
                                icono: Constants.drinkCocoNut)),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
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
      onPressed: () => Navigator.pushNamed(context, route),
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
                  showCursor: false,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      label: Text(
                        'Search...',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
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
              child: const TextField(
                showCursor: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text(
                      'Search...',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )),
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
