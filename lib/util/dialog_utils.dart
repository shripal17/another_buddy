import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  DialogUtils._();

  static void showHelpDialog(
      BuildContext context, AnotherTunable tunable, String defaultValue) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tunable.label),
        content: Text("${tunable.helpText!}\n\nDefault Value: $defaultValue"),
        actions: [
          TextButton(
            onPressed: () => Navigator.maybePop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}
