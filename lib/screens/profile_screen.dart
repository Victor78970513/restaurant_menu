import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:restaurant_menu/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            _Banner(),
            Positioned(
              top: 130,
              left: 20,
              child: _PhotoProfile(),
            ),
          ],
        ),
        _ProfileSection(titulo: 'Account', icono: Constants.account),
        _ProfileSection(
            titulo: 'Payment method', icono: Constants.paymentMethod),
        _ProfileSection(titulo: 'Change password', icono: Constants.password),
        _ProfileSection(titulo: 'Log out', icono: Constants.logOut),
      ],
    ));
  }
}

class _PhotoProfile extends StatelessWidget {
  const _PhotoProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Row(
          children: [
            const Iconify(
              Constants.profileIcon,
              size: 112,
              color: Color(0xff3C3C43),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, bottom: 30),
              child: const Text(
                'Hi, Victor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xffFEA04D),
                Color(0xffFE564D),
              ],
            ),
          ),
        ),
        const SizedBox(height: 100)
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final String titulo;
  final String icono;
  const _ProfileSection({
    super.key,
    required this.titulo,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Navegando a la pantalla $titulo');
        //TODO: NAVEGAR A LA PANTALLA
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 60,
        width: 370,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  const SizedBox(width: 18),
                  Iconify(
                    icono,
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(width: 18),
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Iconify(Constants.arrowRight, color: Colors.orange, size: 30),
          ],
        ),
      ),
    );
  }
}
