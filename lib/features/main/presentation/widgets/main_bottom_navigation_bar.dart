import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnBottomNavigationBarItemClick = void Function(int);

class MainBottomNavigationBar extends StatelessWidget {
  final OnBottomNavigationBarItemClick? onItemClick;

  const MainBottomNavigationBar({
    this.onItemClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          iconSize: 24,
          currentIndex: 0,
          onTap: onItemClick,
          items: [
            BottomNavigationBarItem(
              label: '●', // because of using flutter sdk widgets only :/
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                width: 24,
                height: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: '●',
              icon: SvgPicture.asset(
                'assets/svg/bookmark.svg',
                width: 24,
                height: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: '●',
              icon: SvgPicture.asset(
                'assets/svg/location.svg',
                width: 24,
                height: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: '●',
              icon: SvgPicture.asset(
                'assets/svg/person.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
