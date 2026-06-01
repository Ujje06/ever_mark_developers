import 'package:flutter/material.dart';

class StatusHeader extends StatelessWidget {

  final String title;

  const StatusHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(

      builder: (context, constraints) {

        final titleSize =
            constraints.maxWidth * 0.05;

        return Row(

          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

          children: [

            Expanded(

              child: Text(

                title.toUpperCase(),

                overflow:
                TextOverflow.ellipsis,

                style: TextStyle(

                  fontSize:
                  titleSize.clamp(
                    14,
                    22,
                  ),

                  fontWeight:
                  FontWeight.bold,

                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}