// import 'package:flutter/material.dart';
// import 'nav_item.dart';
//
// class CustomBottomNav extends StatelessWidget {
//   final int currentIndex;
//   final List<NavItem> items;
//   final Function(int) onChanged;
//
//   const CustomBottomNav({
//     super.key,
//     required this.currentIndex,
//     required this.items,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       margin: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: const [
//           BoxShadow(
//             blurRadius: 20,
//             color: Colors.black12,
//           )
//         ],
//       ),
//
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(items.length, (index) {
//           final item = items[index];
//           final isActive = currentIndex == index;
//
//           return GestureDetector(
//             onTap: () => onChanged(index),
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 250),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 14,
//                 vertical: 8,
//               ),
//               decoration: BoxDecoration(
//                 color: isActive
//                     ? Colors.blue.withOpacity(0.1)
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     item.icon,
//                     color: isActive ? Colors.blue : Colors.grey,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     item.label,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: isActive ? Colors.blue : Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }






import 'dart:ui';

import 'package:flutter/material.dart';

import 'animations/bounce_animation.dart';

import 'enums/nav_animation.dart';
import 'enums/nav_style.dart';

import 'nav_item.dart';

import 'models/nav_style_model.dart';

import 'styles/nav_dark_style.dart';
import 'styles/nav_glass_style.dart';
import 'styles/nav_light_style.dart';

class CustomBottomNav extends StatelessWidget {

  final int currentIndex;

  final List<NavItem> items;

  final Function(int) onChanged;

  final NavAnimation animation;

  final NavStyle style;

  const CustomBottomNav({
    super.key,

    required this.currentIndex,

    required this.items,

    required this.onChanged,

    this.animation = NavAnimation.none,

    this.style = NavStyle.light,
  });

  @override
  Widget build(BuildContext context) {

    final NavStyleModel currentStyle =
    _getCurrentStyle();

    return Container(

      height: 75,

      margin: const EdgeInsets.all(12),

      child: ClipRRect(

        borderRadius:
        currentStyle.borderRadius,

        child: BackdropFilter(

          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),

          child: Container(

            decoration: BoxDecoration(

              color: currentStyle.backgroundColor,

              borderRadius:
              currentStyle.borderRadius,

              boxShadow:
              currentStyle.boxShadow,
            ),

            child: Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceAround,

              children: List.generate(
                items.length,
                    (index) {

                  final item = items[index];

                  final isActive =
                      currentIndex == index;

                  Widget navWidget =
                  GestureDetector(

                    onTap: () =>
                        onChanged(index),

                    child: AnimatedContainer(

                      duration:
                      const Duration(
                        milliseconds: 250,
                      ),

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(

                        color: isActive
                            ? currentStyle
                            .indicatorColor
                            : Colors.transparent,

                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),

                      child: Column(

                        mainAxisSize:
                        MainAxisSize.min,

                        children: [

                          Icon(
                            item.icon,

                            color: isActive
                                ? currentStyle
                                .activeColor
                                : currentStyle
                                .inactiveColor,
                          ),

                          const SizedBox(
                            height: 4,
                          ),

                          Text(

                            item.label,

                            style: TextStyle(

                              fontSize: 12,

                              color: isActive
                                  ? currentStyle
                                  .activeColor
                                  : currentStyle
                                  .inactiveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  navWidget =
                      _buildAnimation(
                        child: navWidget,
                        isActive: isActive,
                      );

                  return navWidget;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation({

    required Widget child,

    required bool isActive,

  }) {

    switch (animation) {

      case NavAnimation.bounce:

        return BounceAnimation(
          isActive: isActive,
          child: child,
        );

      case NavAnimation.none:

        return child;

      default:

        return child;
    }
  }

  NavStyleModel _getCurrentStyle() {

    switch (style) {

      case NavStyle.dark:

        return navDarkStyle;

      case NavStyle.glass:

        return navGlassStyle;

      case NavStyle.light:

        return navLightStyle;

      default:

        return navLightStyle;
    }
  }
}