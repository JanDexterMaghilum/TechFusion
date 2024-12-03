import 'package:flutter/material.dart';

class PhysicalActivityScreen extends StatelessWidget {
  const PhysicalActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physical Activity Guidelines'),
        backgroundColor: Colors.pink[100],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pink[50]!,
              Colors.white,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSection(
              title: 'Recommended Activities',
              icon: Icons.favorite,
              color: Colors.pink[100]!,
              items: [
                _ActivityItem(
                  icon: Icons.directions_walk,
                  title: 'Walking',
                  description: '20-30 minutes daily at a comfortable pace',
                ),
                _ActivityItem(
                  icon: Icons.pool,
                  title: 'Swimming',
                  description: 'Gentle swimming and water exercises',
                ),
                _ActivityItem(
                  icon: Icons.self_improvement,
                  title: 'Prenatal Yoga',
                  description: 'Guided by certified prenatal instructor',
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Safety Precautions',
              icon: Icons.shield,
              color: Colors.blue[100]!,
              items: [
                _ActivityItem(
                  icon: Icons.water_drop,
                  title: 'Stay Hydrated',
                  description: 'Drink water before, during, and after exercise',
                ),
                _ActivityItem(
                  icon: Icons.thermostat,
                  title: 'Avoid Overheating',
                  description: 'Exercise in cool, well-ventilated areas',
                ),
                _ActivityItem(
                  icon: Icons.monitor_heart,
                  title: 'Monitor Intensity',
                  description: 'Keep exercise moderate, be able to talk easily',
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Activities to Avoid',
              icon: Icons.warning,
              color: Colors.orange[100]!,
              items: [
                _ActivityItem(
                  icon: Icons.sports_kabaddi,
                  title: 'Contact Sports',
                  description: 'Avoid activities with risk of impact',
                ),
                _ActivityItem(
                  icon: Icons.fitness_center,
                  title: 'Heavy Lifting',
                  description: 'Avoid straining exercises',
                ),
                _ActivityItem(
                  icon: Icons.dangerous,
                  title: 'High-Risk Activities',
                  description: 'Skip activities with fall risks',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<_ActivityItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Icon(icon, size: 24),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ...items.map((item) => _buildActivityTile(item)),
        ],
      ),
    );
  }

  Widget _buildActivityTile(_ActivityItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, size: 24, color: Colors.pink[300]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  item.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityItem {
  final IconData icon;
  final String title;
  final String description;

  _ActivityItem({
    required this.icon,
    required this.title,
    required this.description,
  });
} 