import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<Navegacion>(context);
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Color(0xff272B2D),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: CustomItem(
              index: 0,
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: CustomItem(
                index: 1,
                icon: Icons.dining_sharp,
                text: '  Dish',
              ),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: CustomItem(
                icon: Icons.table_bar,
                text: ' Table',
                index: 2,
              ),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: CustomItem(
                icon: Icons.person_outline_outlined,
                text: 'Profile',
                index: 3,
              ),
              label: ''),
        ],
      ),
    );
  }
}

class Navegacion extends ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();
  int get paginaActual => _paginaActual;
  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}

class CustomItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String text;

  const CustomItem(
      {super.key, required this.icon, required this.text, required this.index});
  @override
  Widget build(BuildContext context) {
    final posicion = Provider.of<Navegacion>(context);
    List<Color> activeColor = const [
      Color(0xffFEA04D),
      Color(0xffFE564D),
    ];
    List<Color> deactiveColor = const [Color(0xff272B2D), Color(0xff272B2D)];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
      width: 90,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors:
                posicion.paginaActual == index ? activeColor : deactiveColor),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 26,
            color: posicion.paginaActual == index
                ? Colors.black
                : const Color(0xffD1C7C7),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: posicion.paginaActual == index
                  ? Colors.black
                  : const Color(0xffD1C7C7),
            ),
          ),
        ],
      ),
    );
  }
}
