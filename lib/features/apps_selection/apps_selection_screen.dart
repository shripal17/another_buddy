import 'package:another_buddy/features/apps_selection/cubit/apps_selection_cubit.dart';
import 'package:another_buddy/features/apps_selection/widgets/app_item_widget.dart';
import 'package:another_buddy/features/apps_selection/widgets/search_bar_widget.dart';
import 'package:another_buddy/horizontal_divider.dart';
import 'package:another_buddy/util/theme_utils.dart';
import 'package:dartx/dartx.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppsSelectionScreen extends StatelessWidget {
  final List<String> selectedApps;

  const AppsSelectionScreen({required this.selectedApps, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppsSelectionCubit(selectedApps: selectedApps)..loadAppsList(),
      child: const AppsSelectionPage(),
    );
  }
}

class AppsSelectionPage extends StatefulWidget {
  const AppsSelectionPage({super.key});

  @override
  State<AppsSelectionPage> createState() => _AppsSelectionPageState();
}

class _AppsSelectionPageState extends State<AppsSelectionPage> {
  late final cubit = context.read<AppsSelectionCubit>();
  final _searchController = TextEditingController();
  bool unsavedChanges = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        cubit.updateSearch(_searchController.text);
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (unsavedChanges) {
          return await _showConfirmationDialog();
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: cubit.isSearchActive
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBarWidget(
                    controller: _searchController,
                    closeSearch: () => setState(() {
                      cubit.isSearchActive = false;
                    }),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Select Apps'),
                    if (cubit.searchTerm.isNotNullOrEmpty)
                      Text(
                        "'${cubit.searchTerm}': ${cubit.appsToDisplay.length} apps",
                        style: theme.textTheme.labelMedium,
                      ),
                  ],
                ),
          actions: cubit.isSearchActive
              ? []
              : [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => setState(() {
                      cubit.isSearchActive = true;
                    }),
                  )
                ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            unsavedChanges = false;
            Navigator.maybePop(context, cubit.currentSelection);
          },
        ),
        body: BlocBuilder<AppsSelectionCubit, AppsSelectionState>(
          builder: (context, state) {
            if (state is AppsSelectionInitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AppsSelectionUpdateState) {
              return ListView.separated(
                itemCount: cubit.appsToDisplay.length,
                separatorBuilder: (_, __) => HorizontalDivider(
                  color: ThemeUtils.getDividerColor(theme),
                ),
                itemBuilder: (context, index) {
                  final app = cubit.appsToDisplay[index];
                  return AppItemWidget(
                    app: app as ApplicationWithIcon,
                    isSelected: cubit.isAppSelected(app),
                    onSelectionChange: (newSelection) {
                      unsavedChanges = true;
                      setState(() {
                        cubit.updateSelection(app, newSelection);
                      });
                    },
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Future<bool> _showConfirmationDialog() async {
    final result = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Unsaved changes"),
            content: const Text(
                "You have unsaved changes, are you sure you want to go back?"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.maybePop(context, false),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () => Navigator.maybePop(context, true),
                  child: const Text("Yes"))
            ],
          );
        });
    return result ?? false;
  }
}
