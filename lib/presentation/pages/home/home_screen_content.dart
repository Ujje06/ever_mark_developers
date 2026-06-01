import 'package:ever_mark_developers/presentation/pages/home/widgets/animated_stat_card.dart';
import 'package:ever_mark_developers/presentation/pages/home/widgets/animated_statt_card.dart';
import 'package:ever_mark_developers/presentation/pages/home/widgets/animated_welcome_card.dart';
import 'package:ever_mark_developers/presentation/pages/home/widgets/attendance_overview.dart';
import 'package:ever_mark_developers/presentation/pages/home/widgets/fade_slide_transition.dart';
import 'package:ever_mark_developers/presentation/pages/home/widgets/recent_activity_list.dart';
import 'package:ever_mark_developers/presentation/pages/home/widgets/task_completion_card.dart';
import 'package:ever_mark_developers/presentation/pages/home/widgets/upcoming_meetings_card.dart';
import 'package:flutter/material.dart';
import '../../../dashboard_cards_section/dashboard_cards_section.dart';
import '../../../status_distribution/demo/status_demo_data.dart';
import '../../../status_distribution/status_distribution_card.dart';

// Import our new animated files here:


class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 1. ANIMATED WELCOME CARD (Separate Component File)
            const AnimatedWelcomeCard(),
            const SizedBox(height: 16),


            /// 4. QUICK STATS ROW
            Row(
              children: [
                Expanded(
                  child: AnimatedStattCard(
                    title: "Employees",
                    value: "120",
                    icon: Icons.people,
                    delayMultiplier: 1,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnimatedStattCard(
                    title: "Present",
                    value: "98",
                    icon: Icons.check_circle,
                    delayMultiplier: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// 5. ANIMATED ATTENDANCE RADIAL OVERVIEW
            const FadeSlideTransition(
              slideOffset: 20,
              child: AttendanceOverview(),
            ),
            const SizedBox(height: 24),

            /// 6. ANIMATED RECENT ACTIVITY TIMELINE
            const FadeSlideTransition(
              slideOffset: 25,
              child: RecentActivityList(),
            ),
            const SizedBox(height: 16),





            /// 6. ANIMATED RECENT ACTIVITY TIMELINE
            // const FadeSlideTransition(
            //   slideOffset: 25,
            //   child: RecentActivityList(),
            // ),
            // const SizedBox(height: 24),

            /// 7. NEW: ANIMATED TASK COMPLETION GRAPH
            const FadeSlideTransition(
              slideOffset: 20,
              child: TaskCompletionCard(),
            ),
            const SizedBox(height: 24),

            /// 8. NEW: DARK-THEMED PULSING UPCOMING MEETINGS WIDGET
            const FadeSlideTransition(
              slideOffset: 20,
              child: UpcomingMeetingsCard(),
            ),
            const SizedBox(height: 20),





            /// 2. DASHBOARD SLIDER CARD SECTION
            const SizedBox(
              height: 150,
              child: DashboardCardsSection(
                cardWidth: 260,
                cardHeight: 180,
              ),
            ),
            const SizedBox(height: 12),

            /// 3. STATUS DISTRIBUTION WITH STAGGERED FADE BUILDER
            FadeSlideTransition(
              duration: const Duration(milliseconds: 900), // Optional customization
              slideOffset: 30.0,                           // Optional customization
              child: StatusDistributionCard(
                title: "Lead Status",
                data: StatusDemoData.items,
              ),
            ),



            const SizedBox(height: 24),

            /// 4. QUICK STATS ROW USING OUR NEW ANIMATED STAT CARDS
            Row(
              children: [
                Expanded(
                  child: AnimatedStattCard(
                    title: "Employees",
                    value: "120",
                    icon: Icons.people,
                    delayMultiplier: 1, // Appears first with a snappy spring popup
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnimatedStattCard(
                    title: "Present",
                    value: "98",
                    icon: Icons.check_circle,
                    delayMultiplier: 2, // Trails right behind it seamlessly for a waves cascade effect
                  ),
                ),
              ],
            ),



            const SizedBox(height: 24),

            // TODO: Add employee attendance widget here
            // TODO: Add recent activity section here
          ],
        ),
      ),
    );
  }
}