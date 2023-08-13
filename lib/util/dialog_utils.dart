import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  DialogUtils._();

  static Future<void> showHelpDialog(
      BuildContext context, AnotherTunable tunable, [String? defaultValue]) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tunable.label),
        content: Text(
            "${tunable.helpText!}${defaultValue != null ? "\n\nDefault Value: $defaultValue" : ""}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.maybePop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  static Future<void> showGeneralDialog(
    BuildContext context, {
    required String title,
    required String content,
    String positiveButtonLabel = "OK",
    String? negativeButtonLabel,
    String? neutralButtonLabel,
    VoidCallback? onPositiveButtonPressed,
    VoidCallback? onNegativeButtonPressed,
    VoidCallback? onNeutralButtonPressed,
  }) {
    if (negativeButtonLabel != null) {
      assert(onNegativeButtonPressed != null);
    }
    if (neutralButtonLabel != null) {
      assert(onNeutralButtonPressed != null);
    }
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (neutralButtonLabel != null)
            TextButton(
              onPressed: onNeutralButtonPressed,
              child: Text(neutralButtonLabel),
            ),
          if (negativeButtonLabel != null)
            TextButton(
              onPressed: onNegativeButtonPressed,
              child: Text(negativeButtonLabel),
            ),
          TextButton(
            onPressed:
                onPositiveButtonPressed ?? () => Navigator.maybePop(context),
            child: Text(positiveButtonLabel),
          ),
        ],
      ),
    );
  }
}
