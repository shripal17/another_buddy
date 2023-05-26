import 'package:another_buddy/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
 * Created by Shripal Jain
 * on 25/05/2023
 */

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            title: Text(
              "Another Manager",
              maxLines: 1,
              softWrap: true,
            ),
            pinned: true,
            floating: true,
            snap: false,
          )
        ],
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text("CPU"),
                  const SizedBox(height: 8),
                  Slider(
                    value: value,
                    min: 0,
                    max: 2,
                    divisions: 2,
                    onChanged: (newValue) => setState(() {
                      value = newValue;
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
