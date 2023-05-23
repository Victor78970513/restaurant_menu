import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu/bloc/blocs.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class ShowScreen extends StatefulWidget {
  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  final scrollController = ScrollController();
  void onListen() => setState(() {});
  @override
  void initState() {
    context.read<ShowBloc>().add(OnGetShowsEvent());
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBloc, ShowState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back,
                    color: Colors.white, size: 37)),
            title: const Text('Shows', style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: SeccionShow(
                    scrollController: scrollController, shows: state.shows),
              ),
            ],
          ),
        );
      },
    );
  }
}
