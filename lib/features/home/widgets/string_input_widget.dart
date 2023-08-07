import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/util/dialog_utils.dart';
import 'package:flutter/material.dart';

class StringInputWidget extends StatelessWidget {
  final AnotherStringTunable tunable;
  final VoidCallback onClick;

  const StringInputWidget({
    required this.tunable,
    required this.onClick,
    super.key,
  });

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
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          tunable.label,
                          style: theme.textTheme.bodyLarge,
                        ),
                        IconButton(
                          onPressed: () =>
                              DialogUtils.showHelpDialog(context, tunable),
                          icon: const Icon(Icons.help),
                          iconSize: 22,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tunable.valueLabel(),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onClick,
                icon: const Icon(Icons.chevron_right_rounded),
              )
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
}
