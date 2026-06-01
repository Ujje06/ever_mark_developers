import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data for IT Fields / Categories
    final List<Map<String, dynamic>> categories = [
      {'label': 'Web', 'icon': Icons.web},
      {'label': 'Mobile', 'icon': Icons.phone_android},
      {'label': 'AI & ML', 'icon': Icons.psychology},
      {'label': 'Data-Sc', 'icon': Icons.analytics},
      {'label': 'Cloud', 'icon': Icons.cloud},
      {'label': 'Cyber', 'icon': Icons.security},
    ];

    // Mock Data for IT Projects
    final List<Map<String, dynamic>> projects = [
      {
        'title': 'Project Atlas: AI Insights Platform',
        'subtitle': 'Developing advanced machine learning models for predictive customer behavior analysis.',
        'status': 'Active',
        'progress': 0.78,
        'techStack': ['Python', 'TensorFlow', 'AWS', 'PostgreSQL', 'React'],
      },
      {
        'title': 'QuantumCommerce Platform',
        'subtitle': 'Next-gen microservices-based e-commerce engine with real-time analytics.',
        'status': 'Active',
        'progress': 0.45,
        'techStack': ['Go', 'Flutter', 'Docker', 'Kubernetes', 'GraphQL'],
      },
      {
        'title': 'CyberShield IoT Gateway',
        'subtitle': 'Securing smart home devices with zero-trust firmware and edge-computed telemetry.',
        'status': 'Review',
        'progress': 0.90,
        'techStack': ['Rust', 'C++', 'MQTT', 'Linux', 'Azure'],
      }
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Changed to a cleaner light background for contrast
      body: Column(
        children: [
          // 1. Dynamic Gradient Header containing Search Bar & Filter Chips
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF005C97), Color(0xFF363795)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search for projects or skills...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                      prefixIcon: const Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.15),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Horizontally Scrollable Field Chips
                SizedBox(
                  height: 38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      // Highlighting the third item (AI & ML) as "Selected"
                      final bool isSelected = index == 2;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: FilterChip(
                          avatar: Icon(
                            cat['icon'],
                            size: 16,
                            // Selected: Dark Blue icon | Unselected: Black icon
                            color: isSelected ? const Color(0xFF363795) : Colors.black87,
                          ),
                          label: Text(
                            cat['label'],
                            style: TextStyle(
                              // Selected: Dark Blue text | Unselected: Black text
                              color: isSelected ? const Color(0xFF363795) : Colors.black87,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            ),
                          ),
                          selected: isSelected,
                          onSelected: (_) {},
                          // Background color when selected (Light cyan/blue highlight)
                          selectedColor: const Color(0xFFE0F2FE),
                          // Background color when unselected (Solid White as requested)
                          backgroundColor: Colors.white,
                          showCheckmark: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              // Transparent border when unselected so it looks clean
                              color: isSelected ? const Color(0xFF005C97) : Colors.transparent,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),

          // 2. Results List Section
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row: Logo, Project Details and Status Tag
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(Icons.code_rounded, color: Colors.blue.shade700, size: 28),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project['title'],
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1E293B),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "Project Scope",
                                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                project['status'],
                                style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        // Project description
                        Text(
                          project['subtitle'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Tech Stack Subtitle
                        const Text(
                          "Tech Stack",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
                        ),
                        const SizedBox(height: 8),

                        // Tech Stack badging layout
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: (project['techStack'] as List<String>).map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(fontSize: 11, color: Color(0xFF334155), fontWeight: FontWeight.w500),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),

                        // Bottom row: Team Overlaps, Progress bar, and Actions
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Development Progress",
                                        style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                      ),
                                      Text(
                                        "${(project['progress'] * 100).toInt()}%",
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF334155)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: LinearProgressIndicator(
                                      value: project['progress'],
                                      backgroundColor: const Color(0xFFE2E8F0),
                                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF005C97)),
                                      minHeight: 6,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),

                            // Call to Action View Button
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1E293B),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Details', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}