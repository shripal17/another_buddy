import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/util/dialog_utils.dart';
import 'package:flutter/material.dart';

/*
 * Created by Shripal Jain
 * on 28/05/2023
 */

class NumericSliderWidget extends StatelessWidget {
  final AnotherNumericTunable tunable;
  final void Function(double newValue) onValueChanged;
  final void Function(double newValue) onChangeEnd;

  const NumericSliderWidget({
    Key? key,
    required this.tunable,
    required this.onValueChanged,
    required this.onChangeEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            children: [
              Text(
                tunable.label,
                style: theme.textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () => DialogUtils.showHelpDialog(
                    context, tunable, tunable.valueLabel(tunable.defaultValue)),
                icon: const Icon(Icons.help),
                iconSize: 22,
              ),
              IconButton(
                onPressed: () => _showDefaultValue(context),
                icon: const Icon(Icons.refresh),
                iconSize: 22,
              ),
              const Spacer(),
              Text(
                tunable.valueLabel(tunable.value as num),
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Slider(
          value: (tunable.value as num).toDouble(),
          min: tunable.min,
          max: tunable.max,
          divisions: tunable.divisions,
          onChanged: onValueChanged,
          onChangeEnd: onChangeEnd,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tunable.minLabel(), style: theme.textTheme.bodySmall),
              Text(tunable.maxLabel(), style: theme.textTheme.bodySmall),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.maxFinite,
          height: 1,
          color: theme.colorScheme.primaryContainer.withAlpha(200),
        )
      ],
    );
  }

  void _showDefaultValue(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(SnackBar(
      content:
          Text("Default Value: ${tunable.valueLabel(tunable.defaultValue)}"),
      action: SnackBarAction(
          label: "Set", onPressed: () => onValueChanged(tunable.defaultValue)),
    ));
  }
}
