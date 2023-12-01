import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entities/service.dart';
import 'filter_button.dart';

class FiltersListView extends StatelessWidget {
  final List<Service>? services;
  final List<String>? selectedItems;
  final void Function(String)? onItemClick;

  const FiltersListView({
    this.services,
    this.selectedItems,
    this.onItemClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (services == null) {
      return _buildShimmer();
    }

    return ListView.separated(
      itemCount: services!.length,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10),
      separatorBuilder: (_, i) => SizedBox(width: 8),
      itemBuilder: (_, index) {
        final service = services![index];
        return FilterButton(
          onPressed: () => onItemClick?.call(service.slug),
          title: service.title,
          isSelected: selectedItems?.contains(service.slug) == true,
        );
      },
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.white12,
      highlightColor: Colors.white38,
      child: ListView.separated(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (_, i) => SizedBox(width: 8),
        itemBuilder: (_, index) {
          return Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(24),
            ),
          );
        },
      ),
    );
  }

}
