import 'package:flutter/material.dart';
import 'dashboard_card_demo_data.dart';
import 'dashboard_card_item.dart';
import 'dashboard_card_model.dart';

class DashboardCardsSection extends StatefulWidget {
  final List<DashboardCardModel>? cards;
  final double? cardWidth;
  final double? cardHeight;

  const DashboardCardsSection({
    super.key,
    this.cards,
    this.cardWidth,
    this.cardHeight,
  });

  @override
  State<DashboardCardsSection> createState() => _DashboardCardsSectionState();
}

class _DashboardCardsSectionState extends State<DashboardCardsSection> {
  late List<DashboardCardModel> cards;
  late PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    cards = widget.cards ?? DashboardCardDemoData.cards;

    // viewportFraction controls how much of the side cards leak onto the screen
    _pageController = PageController(viewportFraction: 0.85);

    // Listen to scroll progression to drive the 3D matrix math smoothly
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;

        return PageView.builder(
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final card = cards[index];

            // 1. Calculate how far this card is from the active focal view index
            // 0.0 means centered, 1.0 means fully to the right, -1.0 means fully to the left
            double positionOffset = index - _currentPage;

            // 2. Clamp the value so calculations don't go chaotic off-screen
            double scale = (1 - (positionOffset.abs() * 0.12)).clamp(0.8, 1.0);
            double rotation = (positionOffset * -0.15).clamp(-0.25, 0.25);
            double opacity = (1 - (positionOffset.abs() * 0.35)).clamp(0.5, 1.0);

            return Opacity(
              opacity: opacity,
              child: Transform(
                // 3. Set identity matrix and inject perspective anchor depth factor (0.001)
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..scale(scale)
                  ..rotateY(rotation), // Tilts the card along the Y-axis based on swipe distance
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: SizedBox(
                    height: widget.cardHeight ?? height,
                    child: DashboardCardItem(
                      cardData: card,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}