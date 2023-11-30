import 'package:flutter/material.dart';

import '../widgets/barber_list_item.dart';
import '../widgets/home_banner.dart';
import '../widgets/home_service_button.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  width: 193,
                  height: 93,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.location_on_rounded, size: 22),
                  label: Text(
                    'Ranchview',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFC7CDD9),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white10,
                    minimumSize: Size(100, 30),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'LOOKY',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
              letterSpacing: 6,
              height: 1
            ),
          ),
          Text(
            'Fastest Way to Find Barbers',
            style: TextStyle(
              color: Color(0x8A95ABCC),
              fontSize: 14,
              height: 1,
            ),
          ),
          const SizedBox(height: 30),
          SearchField(),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeServiceButton(
                iconPath: 'assets/svg/cutter.svg',
                label: 'HAIRCUT',
              ),
              HomeServiceButton(
                iconPath: 'assets/svg/gilette.svg',
                label: 'FACE SHAVE',
              ),
              HomeServiceButton(
                iconPath: 'assets/svg/cream.svg',
                label: 'SKIN FADES',
              ),
              HomeServiceButton(
                iconPath: 'assets/svg/cream_brush.svg',
                label: 'COLORING',
              ),
            ],
          ),
          const SizedBox(height: 27),
          HomeBanner(),
          const SizedBox(height: 33),
          Row(
            children: [
              Expanded(
                child: Text(
                  '100 Barber Shop/barbers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.sort),
                label: Text('Filters'),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text('Shops'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xFFAA935F),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                child: Text('Barbers'),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                child: Text('Haircut'),
              ),
            ],
          ),
          const SizedBox(height: 23),
          BarberListItem(),
        ],
      ),
    );
  }
}
