import 'package:another_buddy/features/home/home_screen.dart';
import 'package:another_buddy/features/initialise/bloc/initialise_bloc.dart';
import 'package:another_buddy/util/dialog_utils.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (bloc.isFirstSetupDone()) {
        bloc.add(CheckRootAvailabilityEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: BlocConsumer<InitialiseBloc, InitialiseState>(
          listener: (context, state) {
            if (state is RootCheckedState && state.available) {
              bloc.add(CheckRootAccessEvent());
            } else if (state is RootAccessCheckedState && state.granted) {
              if (bloc.isFirstSetupDone()) {
                bloc.add(RequestNotificationPermissionEvent());
              } else {
                _showNotificationPermissionDialog();
              }
            } else if (state is NotificationPermissionResultState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                const SizedBox(height: 24),
                Text(
                  "Welcome to Another Kernel!",
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  "We are glad you chose to use our highly customisable, battery friendly kernel.\n\nThis app helps you configure the kernel as per your needs.\n\nIt can also set these parameters on every boot for you.",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                if (state is InitialState) ...{
                  OutlinedButton(
                    onPressed: _showWarning,
                    child: const Text("Get Started"),
                  ),
                } else if (state is LoadingState) ...{
                  const CircularProgressIndicator(),
                } else if (state is RootCheckedState) ...{
                  Text("Root available: ${state.available}"),
                  if (!state.available) ...{
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: _showWarning,
                      child: const Text("Try Again"),
                    )
                  }
                } else if (state is RootAccessCheckedState) ...{
                  Text("Root access granted: ${state.granted}"),
                  if (!state.granted) ...{
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: _showWarning,
                      child: const Text("Try Again"),
                    )
                  }
                } else ...{
                  const Text("Checking for root availability"),
                },
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _showWarning() async {
    await DialogUtils.showGeneralDialog(
      context,
      title: "Warning",
      content:
          "This app is only intended to be used with \"Another Kernel\" on the \"Redmi Note 10 Pro\". We will not be responsible for any damages to your device caused by the app or the kernel.\n\nBefore continuing, please make sure you have granted \"Superuser\" access to this app.",
      neutralButtonLabel: "Open KernelSU",
      positiveButtonLabel: "SU is granted",
      negativeButtonLabel: "Cancel",
      onPositiveButtonPressed: () {
        Navigator.maybePop(context);
        bloc.add(CheckRootAvailabilityEvent());
      },
      onNegativeButtonPressed: () => Navigator.maybePop(context),
      onNeutralButtonPressed: () async {
        const kernelSuPkg = 'me.weishu.kernelsu';
        if (await LaunchApp.isAppInstalled(androidPackageName: kernelSuPkg)) {
          await LaunchApp.openApp(androidPackageName: kernelSuPkg);
        }
      },
    );
  }

  Future<void> _showNotificationPermissionDialog() async {
    await DialogUtils.showGeneralDialog(
      context,
      title: "Set on boot",
      content:
          "The configuration you change in the app will be saved and will be automatically applied after 10 seconds of boot. The app will show a notification before applying the settings and allow you to cancel it through the notification.\nFor this to work, you need to allow the app notifications permission.",
      positiveButtonLabel: "Continue",
      onPositiveButtonPressed: () {
        Navigator.maybePop(context);
        bloc.add(RequestNotificationPermissionEvent());
      },
    );
  }
}
