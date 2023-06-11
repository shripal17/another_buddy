import 'package:another_buddy/features/home/cubit/home_cubit.dart';
import 'package:another_buddy/features/home/widgets/tunable_category_widget.dart';
import 'package:another_buddy/model/loading_stage.dart';
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
      create: (context) => HomeCubit(),
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
  late final cubit = context.read<HomeCubit>();

  double value = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => cubit.fetchCurrentValues());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text(
              "Another Manager",
              maxLines: 1,
              softWrap: true,
            ),
            pinned: true,
            floating: true,
            snap: false,
            actions: [
              IconButton(
                onPressed: _showAboutDialog,
                icon: const Icon(Icons.info),
              ),
            ],
          )
        ],
        body: BlocConsumer<HomeCubit, HomeState>(
          buildWhen: (_, __) => true,
          listener: (context, state) {
            if (state is ValueUpdateFailedState) {
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
                  content: Text(
                      "Failed to update value for ${state.failedTunableName}")));
            }
          },
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
                        ...state.tunables.entries.map(
                          (e) => TunableCategoryWidget(
                              category: e.key, tunables: e.value),
                        ),
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

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: "Another Manager",
      applicationVersion: "v0.5",
      children: [
        Image.asset(
          'assets/logo.png',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        const Text(
            "Credits:\n- Carlo San (Kernel Creator)\n- RooGhz for base of AR version\n- Babu Frik (App Developer)")
      ],
    );
  }
}
