import 'package:another_buddy/model/tunables/another_tunable.dart';
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
    return SwitchListTile(
      title: Text(tunable.label),
      value: tunable.value as bool,
      onChanged: onValueChanged,
    );
  }
}
