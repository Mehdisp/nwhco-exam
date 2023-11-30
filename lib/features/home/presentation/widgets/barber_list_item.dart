import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarberListItem extends StatelessWidget {
  const BarberListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      // height: 97 + 14,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26, width: 2),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.all(7),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/image_1.jpg',
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
                      'William Rojer Salon',
                      style: TextStyle(
                        color: Color(0xFF1F2A40),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset('assets/svg/verified.svg'),
                    Spacer(),
                    Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFFD3BA4C),
                    ),
                    Text(
                      '4.1',
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
                      '5.0 Kms',
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' | Pirozzi street, bolvar ...',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF808A9E)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
