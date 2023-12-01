import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/entities/barber.dart';

class BarberListItem extends StatelessWidget {
  final Barber barber;

  const BarberListItem(this.barber, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26, width: 2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: barber.avatar,
              fit: BoxFit.cover,
              width: 93,
              height: 93,
            ),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      barber.fullName,
                      maxLines: 1,
                      style: TextStyle(
                        color: Color(0xFF1F2A40),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),

                    if (barber.isShop)
                      SvgPicture.asset('assets/svg/verified.svg'),

                    Spacer(),
                    Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFFD3BA4C),
                    ),
                    Text(
                      barber.rate.toStringAsFixed(1),
                      style: TextStyle(
                        color: Color(0xFFD3BA4C),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Haircut ,Face Shave ,Skin Fades',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF808A9E),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      barber.distance.toStringAsFixed(1) + ' Kms',
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' | ${barber.address}',
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF808A9E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
