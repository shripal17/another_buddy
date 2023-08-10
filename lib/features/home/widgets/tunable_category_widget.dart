import 'package:another_buddy/features/apps_selection/apps_selection_screen.dart';
import 'package:another_buddy/features/home/cubit/home_cubit.dart';
import 'package:another_buddy/features/home/widgets/numeric_slider_widget.dart';
import 'package:another_buddy/features/home/widgets/string_input_widget.dart';
import 'package:another_buddy/features/home/widgets/switch_widget.dart';
import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TunableCategoryWidget extends StatefulWidget {
  final TunableCategory category;
  final List<AnotherTunable> tunables;

  const TunableCategoryWidget({
    required this.category,
    required this.tunables,
    super.key,
  });

  @override
  State<TunableCategoryWidget> createState() => _TunableCategoryWidgetState();
}

class _TunableCategoryWidgetState extends State<TunableCategoryWidget> {
  late final cubit = context.read<HomeCubit>();
  late final theme = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withAlpha(150),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: theme.colorScheme.onPrimaryContainer.withAlpha(150)),
            ),
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: widget.tunables.map((tunable) {
                if (tunable is AnotherNumericTunable) {
                  return NumericSliderWidget(
                    tunable: tunable,
                    onValueChanged: (newValue) {
                      setState(() {
                        cubit.updateUIValue(tunable.name!, newValue.toInt());
                      });
                    },
                    onChangeEnd: (newValue) async {
                      cubit.updateTunableFile(tunable.name!, newValue.toInt());
                    },
                  );
                } else if (tunable is AnotherBooleanTunable) {
                  return SwitchWidget(
                    tunable: tunable,
                    onValueChanged: (newValue) {
                      setState(() {
                        if (newValue) {
                          cubit.updateUIValue(tunable.name!, 1);
                          cubit.updateTunableFile(tunable.name!, 1);
                        } else {
                          cubit.updateUIValue(tunable.name!, 0);
                          cubit.updateTunableFile(tunable.name!, 0);
                        }
                      });
                    },
                  );
                } else if (tunable is AnotherStringTunable) {
                  return StringInputWidget(
                    tunable: tunable,
                    onClick: () async {
                      final newAppsList =
                          await Navigator.of(context).push<List<String>>(
                        MaterialPageRoute(
                          builder: (context) => AppsSelectionScreen(
                              selectedApps: tunable.values()),
                        ),
                      );
                      if (newAppsList != null) {
                        cubit.updateUIValue(
                            tunable.name!, newAppsList.join(";"));
                        cubit.updateTunableFile(
                            tunable.name!, newAppsList.join(";"));
                      }
                    },
                  );
                }
                return Text("${tunable.label}: ${tunable.value}");
              }).toList(),
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 32,
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              widget.category.name.toUpperCase(),
              style: theme.textTheme.labelLarge
                  ?.copyWith(color: theme.colorScheme.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
