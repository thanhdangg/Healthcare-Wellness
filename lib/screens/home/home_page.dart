import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/screens/home/bloc/home_bloc.dart';
import 'package:healthcare_wellness/screens/home/widgets/item_device.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title});

  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  late HomeBloc _homeBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(GetDeviceList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return ListView.separated(
          controller: _scrollController,
          separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          itemBuilder: (context, index) {
            final device = state.devices?[index];
            return ItemDevice(device: device!);
          },
          itemCount: state.devices?.length ?? 0,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(0.0,
              duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.amber,
        ),
      ),
    );
  }
}
