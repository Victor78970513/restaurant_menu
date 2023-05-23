import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/screens/screens.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Navegacion(),
      child: const Scaffold(
        backgroundColor: Color(0xff1B1D22),
        body: _Paginas(),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({super.key});

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<Navegacion>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomeScreen(),
        DishScreen(),
        TableScreen(),
        ProfileScreen(),
      ],
    );
  }
}
