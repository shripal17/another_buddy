import 'package:another_buddy/features/home/home_screen.dart';
import 'package:another_buddy/features/initialise/bloc/initialise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialiseScreen extends StatelessWidget {
  const InitialiseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialiseBloc(),
      child: const InitialisePage(),
    );
  }
}

class InitialisePage extends StatefulWidget {
  const InitialisePage({Key? key}) : super(key: key);

  @override
  State<InitialisePage> createState() => _InitialisePageState();
}

class _InitialisePageState extends State<InitialisePage> {
  late final bloc = context.read<InitialiseBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => bloc.add(CheckRootAvailabilityEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InitialiseBloc, InitialiseState>(
            listener: (context, state) {
              if (state is RootCheckedState && state.available) {
                bloc.add(CheckRootAccessEvent());
              } else if (state is RootAccessCheckedState && state.granted) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }
            },
            builder: (context, state) {
              if (state is LoadingState) {
                return const CircularProgressIndicator();
              } else if (state is RootCheckedState) {
                return Text("Root available: ${state.available}");
              } else if (state is RootAccessCheckedState) {
                return Text("Root access granted: ${state.granted}");
              }
              return const Text("Checking for root availability");
            },
          ),
        ),
      ),
    );
  }
}
