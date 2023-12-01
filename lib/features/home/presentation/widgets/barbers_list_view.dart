import 'package:flutter/material.dart';
import 'package:nwhco_exam/features/home/presentation/cubit/home_cubit.dart';
import 'package:nwhco_exam/features/home/presentation/widgets/barber_list_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entities/barber.dart';
import '../../domain/entities/service.dart';
import '../../../../core/widgets/list_loading_more_progress.dart';

class BarbersListView extends StatelessWidget {
  final List<Barber> barbers;
  final bool isLoadingMore;
  final bool hasMoreItems;
  final void Function(String)? onItemClick;

  const BarbersListView({
    required this.barbers,
    required this.isLoadingMore,
    required this.hasMoreItems,
    this.onItemClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (barbers.isEmpty && isLoadingMore) {
      return _buildShimmer();
    }

    return ListView.separated(
      // برای اینکه لودینگ یا متن آخر لیست نشون بدیم تعداد آیتم ها رو یکی زیاد میکنیم
      itemCount: barbers.length + (hasMoreItems ? 1 : 0),
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      separatorBuilder: (_, i) => SizedBox(height: 8),
      itemBuilder: (_, index) {
        if (index < barbers.length) {
          return BarberListItem(barbers[index]);
        }

        // اگر در حال لود کردن صفحه ی جدید بود لودینگ و اگر به آخر لیست نرسیده بود متن رو نمایش میدیم
        return Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: isLoadingMore
              ? ListLoadingMoreProgress()
              : Text('Scroll To Load More'),
        );
      },
    );
  }

  ///
  /// افکت شیمر برای زمانی که لیست اولیه لود نشده
  ///
  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.white.withOpacity(0.1),
      highlightColor: Colors.white.withOpacity(0.2),
      child: ListView.separated(
        itemCount: 6,
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        separatorBuilder: (_, i) => SizedBox(height: 8),
        itemBuilder: (_, index) {
          return Container(
            width: double.infinity,
            height: 93 + 14,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(18),
            ),
          );
        },
      ),
    );
  }
}
