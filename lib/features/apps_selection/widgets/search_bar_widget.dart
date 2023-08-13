import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    required this.closeSearch,
    required this.controller,
    super.key,
  });

  final VoidCallback closeSearch;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      maxLines: 1,
      autofocus: true,
      onSubmitted: (_) => closeSearch(),
      onTapOutside: (_) => closeSearch(),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search by app name or package name",
        suffixIcon: controller.text.isNullOrEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => controller.text = "",
              ),
      ),
    );
  }
}
