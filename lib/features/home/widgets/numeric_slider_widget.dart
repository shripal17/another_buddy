import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

/*
 * Created by Shripal Jain
 * on 28/05/2023
 */

class NumericSliderWidget extends StatelessWidget {
  final AnotherNumericTunable tunable;
  final void Function(double newValue) onValueChanged;

  const NumericSliderWidget(
      {Key? key, required this.tunable, required this.onValueChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(child: Text(tunable.label)),
              Text(tunable.valueLabel(tunable.value as double)),
            ],
          ),
        ),
        Slider(
          value: tunable.value as double,
          min: tunable.min,
          max: tunable.max,
          divisions: tunable.divisions,
          onChanged: onValueChanged,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tunable.minLabel()),
              Text(tunable.maxLabel()),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(width: double.maxFinite, height: 1, color: Colors.grey[700])
      ],
    );
  }
}
