// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:another_buddy/model/tunables/another_tunable.dart' as prefix0;
import 'package:another_buddy/model/tunables/battery/auto_balance_tunable.dart'
    as prefix1;
import 'package:another_buddy/model/tunables/battery/continue_charge_tunable.dart'
    as prefix2;
import 'package:another_buddy/model/tunables/battery/cooldown_temperature_tunable.dart'
    as prefix3;
import 'package:another_buddy/model/tunables/battery/hot_slow_charge.dart'
    as prefix5;
import 'package:another_buddy/model/tunables/battery/max_temperature_tunable.dart'
    as prefix4;
import 'package:another_buddy/model/tunables/battery/stop_charge_tunable.dart'
    as prefix6;
import 'package:another_buddy/model/tunables/cpu/boost_frequency_tunable.dart'
    as prefix7;
import 'package:another_buddy/model/tunables/cpu/boost_timeout_tunable.dart'
    as prefix8;
import 'package:another_buddy/model/tunables/cpu/input_boost_tunable.dart'
    as prefix9;

// ignore_for_file: camel_case_types
// ignore_for_file: implementation_imports
// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.Tunable(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'AutoBalanceTunable',
            r'.AutoBalanceTunable',
            134217735,
            0,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix1.AutoBalanceTunable() : null},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'minLabel': 0,
              r'maxLabel': 0,
              r'valueLabel': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'divisions': 0,
              r'label': 0,
              r'max': 0,
              r'min': 0,
              r'path': 0,
              r'unit': 0,
              r'valueLabels': 0,
              r'index': 0,
              r'helpText': 0
            }),
        r.NonGenericClassMirrorImpl(
            r'ContinueChargeTunable',
            r'.ContinueChargeTunable',
            134217735,
            1,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix2.ContinueChargeTunable() : null},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'minLabel': 0,
              r'maxLabel': 0,
              r'valueLabel': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'divisions': 0,
              r'max': 0,
              r'min': 0,
              r'path': 0,
              r'unit': 0,
              r'valueLabels': 0,
              r'label': 0,
              r'index': 0,
              r'helpText': 0
            }),
        r.NonGenericClassMirrorImpl(
            r'CooldownTemperatureTunable',
            r'.CooldownTemperatureTunable',
            134217735,
            2,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {
              r'': (bool b) =>
                  () => b ? prefix3.CooldownTemperatureTunable() : null
            },
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'minLabel': 0,
              r'maxLabel': 0,
              r'valueLabel': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'divisions': 0,
              r'label': 0,
              r'max': 0,
              r'min': 0,
              r'path': 0,
              r'unit': 0,
              r'valueLabels': 0,
              r'index': 0,
              r'helpText': 0
            }),
        r.NonGenericClassMirrorImpl(
            r'MaxTemperatureTunable',
            r'.MaxTemperatureTunable',
            134217735,
            3,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix4.MaxTemperatureTunable() : null},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'minLabel': 0,
              r'maxLabel': 0,
              r'valueLabel': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'divisions': 0,
              r'label': 0,
              r'max': 0,
              r'min': 0,
              r'path': 0,
              r'unit': 0,
              r'valueLabels': 0,
              r'index': 0,
              r'helpText': 0
            }),
        r.NonGenericClassMirrorImpl(
            r'HotSlowChargeTunable',
            r'.HotSlowChargeTunable',
            134217735,
            4,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix5.HotSlowChargeTunable() : null},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'helpText': 0,
              r'index': 0,
              r'label': 0,
              r'path': 0
            }),
        r.NonGenericClassMirrorImpl(
            r'StopChargeTunable',
            r'.StopChargeTunable',
            134217735,
            5,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix6.StopChargeTunable() : null},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'minLabel': 0,
              r'maxLabel': 0,
              r'valueLabel': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'divisions': 0,
              r'max': 0,
              r'min': 0,
              r'path': 0,
              r'unit': 0,
              r'valueLabels': 0,
              r'label': 0,
              r'index': 0,
              r'helpText': 0
            }),
        r.NonGenericClassMirrorImpl(
            r'BoostFrequencyTunable',
            r'.BoostFrequencyTunable',
            134217735,
            6,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix7.BoostFrequencyTunable() : null},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'minLabel': 0,
              r'maxLabel': 0,
              r'valueLabel': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'divisions': 0,
              r'label': 0,
              r'max': 0,
              r'min': 0,
              r'path': 0,
              r'unit': 0,
              r'valueLabels': 0,
              r'index': 0,
              r'helpText': 0
            }),
        r.NonGenericClassMirrorImpl(
            r'BoostTimeoutTunable',
            r'.BoostTimeoutTunable',
            134217735,
            7,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix8.BoostTimeoutTunable() : null},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'minLabel': 0,
              r'maxLabel': 0,
              r'valueLabel': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'divisions': 0,
              r'label': 0,
              r'max': 0,
              r'min': 0,
              r'path': 0,
              r'unit': 0,
              r'valueLabels': 0,
              r'index': 0,
              r'helpText': 0
            }),
        r.NonGenericClassMirrorImpl(
            r'InputBoostTunable',
            r'.InputBoostTunable',
            134217735,
            8,
            const prefix0.Tunable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix9.InputBoostTunable() : null},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.tunable],
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'value': 0,
              r'value=': 1,
              r'name': 0,
              r'name=': 1,
              r'category': 0,
              r'defaultValue': 0,
              r'label': 0,
              r'path': 0,
              r'index': 0,
              r'helpText': 0
            })
      ],
      null,
      null,
      <Type>[
        prefix1.AutoBalanceTunable,
        prefix2.ContinueChargeTunable,
        prefix3.CooldownTemperatureTunable,
        prefix4.MaxTemperatureTunable,
        prefix5.HotSlowChargeTunable,
        prefix6.StopChargeTunable,
        prefix7.BoostFrequencyTunable,
        prefix8.BoostTimeoutTunable,
        prefix9.InputBoostTunable
      ],
      9,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'value': (dynamic instance) => instance.value,
        r'name': (dynamic instance) => instance.name,
        r'minLabel': (dynamic instance) => instance.minLabel,
        r'maxLabel': (dynamic instance) => instance.maxLabel,
        r'valueLabel': (dynamic instance) => instance.valueLabel,
        r'category': (dynamic instance) => instance.category,
        r'defaultValue': (dynamic instance) => instance.defaultValue,
        r'divisions': (dynamic instance) => instance.divisions,
        r'label': (dynamic instance) => instance.label,
        r'max': (dynamic instance) => instance.max,
        r'min': (dynamic instance) => instance.min,
        r'path': (dynamic instance) => instance.path,
        r'unit': (dynamic instance) => instance.unit,
        r'valueLabels': (dynamic instance) => instance.valueLabels,
        r'index': (dynamic instance) => instance.index,
        r'helpText': (dynamic instance) => instance.helpText
      },
      {
        r'value=': (dynamic instance, value) => instance.value = value,
        r'name=': (dynamic instance, value) => instance.name = value
      },
      null,
      [
        const [0, 0, null],
        const [1, 0, null]
      ])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
