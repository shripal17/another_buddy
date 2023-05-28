import 'package:another_buddy/features/home/bloc/home_bloc.dart';
import 'package:another_buddy/features/home/widgets/numeric_slider_widget.dart';
import 'package:another_buddy/features/home/widgets/switch_widget.dart';
import 'package:another_buddy/model/loading_stage.dart';
import 'package:another_buddy/model/tunables/another_tunable.dart';
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
  late final bloc = context.read<HomeBloc>();

  double value = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => bloc.add(FetchCurrentValuesEvent()));
  }

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
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeLoadingState &&
                state.stage == LoadingStage.initialLoad) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ValuesLoadedState) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...state.tunables.keys.map((key) {
                          final tunable = state.tunables[key];
                          if (tunable is AnotherNumericTunable) {
                            return NumericSliderWidget(
                              tunable: tunable,
                              // TODO: Fix update logic
                              onValueChanged: (newValue) => setState(() {
                                tunable.value = newValue;
                              }),
                            );
                          } else if (tunable is AnotherBooleanTunable) {
                            return SwitchWidget(
                              tunable: tunable,
                              onValueChanged: (_) {},
                            );
                          }
                          return Text("${tunable?.label}: ${tunable?.value}");
                        }),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text("Unexpected state"));
          },
        ),
      ),
    );
  }
}
