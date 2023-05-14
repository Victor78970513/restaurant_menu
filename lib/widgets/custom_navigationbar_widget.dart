import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<Navegacion>(context);
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Color(0xff272B2D),
      ),
      child: BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color(0xff272B2D),
            icon: CustomItem(
              icon: Icons.home_outlined,
              text: 'Profile',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              backgroundColor: Color(0xff272B2D),
              icon: CustomItem(
                icon: Icons.dining_sharp,
                text: 'Profile',
              ),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Color(0xff272B2D),
              icon: CustomItem(
                icon: Icons.table_bar,
                text: 'Profile',
              ),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Color(0xff272B2D),
              icon: CustomItem(
                icon: Icons.person_outline_outlined,
                text: 'Profile',
              ),
              label: ''),
        ],
      ),
    );
  }
}

class Navegacion extends ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = PageController();
  int get paginaActual => _paginaActual;
  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}

class CustomItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomItem({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
      width: 80,
      height: 36,
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
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black),
          Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
