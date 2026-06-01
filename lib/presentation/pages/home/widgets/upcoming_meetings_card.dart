// presentation/pages/home/widgets/upcoming_meetings_card.dart
import 'package:flutter/material.dart';

class UpcomingMeetingsCard extends StatefulWidget {
  const UpcomingMeetingsCard({super.key});

  @override
  State<UpcomingMeetingsCard> createState() => _UpcomingMeetingsCardState();
}

class _UpcomingMeetingsCardState extends State<UpcomingMeetingsCard> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    // Setting up the infinitely repeating pulse glow for live meetings
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF13131A), // Sleek dark contrast layout box
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff7C3AED).withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Upcoming Meetings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("Today", style: TextStyle(color: Colors.white70, fontSize: 11)),
              )
            ],
          ),
          const SizedBox(height: 16),

          // Meeting Item 1: Live Sprint
          _buildMeetingRow(
            title: "Daily Scrum & Sprint Planning",
            time: "10:30 AM - 11:00 AM",
            room: "Room Lambda",
            isLive: true,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: SizedBox(height: 14, child: VerticalDivider(color: Colors.white10, thickness: 1)),
          ),

          // Meeting Item 2: Upcoming Review
          _buildMeetingRow(
            title: "Client Architecture Review",
            time: "02:00 PM - 03:00 PM",
            room: "Virtual (Google Meet)",
            isLive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildMeetingRow({
    required String title,
    required String time,
    required String room,
    required bool isLive,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pulsing / Timeline Node
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: isLive
              ? AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.6),
                      blurRadius: 4 + (_pulseController.value * 8),
                      spreadRadius: _pulseController.value * 4,
                    )
                  ],
                ),
              );
            },
          )
              : Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white24,
              border: Border.all(color: Colors.white38, width: 2),
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Text details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isLive ? Colors.white : Colors.white60,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 12, color: Colors.white38),
                  const SizedBox(width: 4),
                  Text(time, style: const TextStyle(fontSize: 11, color: Colors.white38)),
                  const SizedBox(width: 12),
                  const Icon(Icons.place_outlined, size: 12, color: Colors.white38),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      room,
                      style: const TextStyle(fontSize: 11, color: Colors.white38),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}