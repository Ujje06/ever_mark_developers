import 'package:flutter/material.dart';

import 'dashboard_card_model.dart';
import 'dashboard_card_responsive.dart';

class DashboardCardItem extends StatefulWidget {

  final DashboardCardModel cardData;

  const DashboardCardItem({
    super.key,
    required this.cardData,
  });

  @override
  State<DashboardCardItem> createState() =>
      _DashboardCardItemState();
}

class _DashboardCardItemState
    extends State<DashboardCardItem> {

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        /// PARENT SIZE
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        /// RESPONSIVE VALUES


        final padding =
        DashboardCardResponsive.padding(width);

        final iconContainerSize =
        DashboardCardResponsive
            .iconContainerSize(width);

        final iconSize =
        DashboardCardResponsive
            .iconSize(width);

        final titleFontSize =
        DashboardCardResponsive
            .titleFont(width);

        final countFontSize =
        DashboardCardResponsive
            .countFont(width);

        final subtitleFontSize =
        DashboardCardResponsive
            .subtitleFont(width);

        final spacing =
        DashboardCardResponsive
            .spacing(height);

        // final padding = width * 0.05;
        //
        // final iconContainerSize = width * 0.18;
        // final iconSize = iconContainerSize * 0.52;
        //
        // final titleFontSize = width * 0.050;
        // final countFontSize = width * 0.110;
        // final subtitleFontSize = width * 0.040;
        //
        // final spacing = height * 0.05;

        return Container(

          padding: EdgeInsets.all(padding),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
            // BorderRadius.circular(width * 0.06),
            BorderRadius.circular(
              DashboardCardResponsive
                  .borderRadius(width),
            ),

            border: Border.all(
              color: widget.cardData.color
                  .withValues(alpha: 0.18),
            ),

            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                spreadRadius: 1,

                offset: const Offset(0, 4),

                color: Colors.black
                    .withValues(alpha: 0.05),
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// TOP SECTION
              Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// ICON
                  Container(
                    height: iconContainerSize,
                    width: iconContainerSize,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.cardData.color,
                    ),

                    child: Icon(
                      widget.cardData.icon,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  ),

                  SizedBox(width: width * 0.04),

                  /// TEXT
                  Flexible(
                    child: Column(
                      mainAxisSize:
                      MainAxisSize.min,

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          widget.cardData.title,

                          maxLines: 1,

                          overflow:
                          TextOverflow.ellipsis,

                          style: TextStyle(
                            fontSize:
                            titleFontSize,

                            fontWeight:
                            FontWeight.w700,

                            color:
                            widget.cardData.color,
                          ),
                        ),

                        SizedBox(height: spacing),

                        FittedBox(
                          fit: BoxFit.scaleDown,

                          child: Text(
                            widget.cardData.count,

                            style: TextStyle(
                              fontSize:
                              countFontSize,

                              fontWeight:
                              FontWeight.bold,

                              color:
                              Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: spacing * 1.5),

              /// BOTTOM TEXT
              Text(
                widget.cardData.subtitle,

                maxLines: 1,

                overflow:
                TextOverflow.ellipsis,

                style: TextStyle(
                  fontSize:
                  subtitleFontSize,

                  fontWeight:
                  FontWeight.w500,

                  color: Colors.black
                      .withValues(alpha: 0.65),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}