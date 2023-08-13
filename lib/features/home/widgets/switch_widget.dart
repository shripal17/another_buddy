import 'package:another_buddy/horizontal_divider.dart';
import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/util/dialog_utils.dart';
import 'package:another_buddy/util/theme_utils.dart';
import 'package:flutter/material.dart';

/*
 * Created by Shripal Jain
 * on 28/05/2023
 */

class SwitchWidget extends StatelessWidget {
  final AnotherBooleanTunable tunable;
  final void Function(bool newValue) onValueChanged;

  const SwitchWidget(
      {Key? key, required this.tunable, required this.onValueChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        SwitchListTile(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(tunable.label),
              IconButton(
                onPressed: () => DialogUtils.showHelpDialog(
                    context, tunable, tunable.valueLabel(tunable.defaultValue)),
                icon: const Icon(Icons.help),
                iconSize: 22,
              ),
            ],
          ),
          value: (tunable.value as num).toInt() == 1,
          onChanged: onValueChanged,
        ),
        const SizedBox(height: 8),
        HorizontalDivider(
          color: ThemeUtils.getDividerColor(theme),
        ),
      ],
    );
  }
}
