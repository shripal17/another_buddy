import 'package:another_buddy/util/cache_memory_image_provider.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class AppItemWidget extends StatelessWidget {
  final ApplicationWithIcon app;
  final bool isSelected;
  final void Function(bool newSelection) onSelectionChange;

  const AppItemWidget({
    required this.app,
    required this.isSelected,
    required this.onSelectionChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: CheckboxListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(app.appName, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(app.packageName, style: theme.textTheme.bodySmall),
          ],
        ),
        secondary: Image(
          image: CacheMemoryImageProvider(app.packageName, app.icon),
        ),
        value: isSelected,
        onChanged: (newSelection) => onSelectionChange(newSelection ?? false),
      ),
    );
  }
}
