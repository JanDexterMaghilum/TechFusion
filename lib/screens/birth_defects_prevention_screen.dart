import 'package:flutter/material.dart';

class BirthDefectsPreventionScreen extends StatelessWidget {
  const BirthDefectsPreventionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Fancy App Bar
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Birth Defects Prevention',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.pink[300]!,
                      Colors.pink[400]!,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -50,
                      top: -50,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.medical_services,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Content
          SliverToBoxAdapter(
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildSection(
                      title: 'Essential Nutrients',
                      icon: Icons.local_hospital,
                      color: Colors.pink[400]!,
                      items: [
                        _PreventionItem(
                          icon: Icons.medication,
                          title: 'Folic Acid',
                          description: 'Take 400 micrograms daily before and during pregnancy',
                          bgColor: Colors.pink[50]!,
                        ),
                        _PreventionItem(
                          icon: Icons.breakfast_dining,
                          title: 'Iron-rich Foods',
                          description: 'Include lean meats, beans, and fortified cereals',
                          bgColor: Colors.pink[50]!,
                        ),
                        _PreventionItem(
                          icon: Icons.water_drop,
                          title: 'Calcium',
                          description: 'Consume dairy products or calcium supplements',
                          bgColor: Colors.pink[50]!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildSection(
                      title: 'Lifestyle Recommendations',
                      icon: Icons.favorite,
                      color: Colors.pink[400]!,
                      items: [
                        _PreventionItem(
                          icon: Icons.directions_walk,
                          title: 'Regular Exercise',
                          description: 'Maintain moderate physical activity as approved by your doctor',
                          bgColor: Colors.pink[50]!,
                        ),
                        _PreventionItem(
                          icon: Icons.smoke_free,
                          title: 'Avoid Smoking',
                          description: 'Quit smoking and avoid secondhand smoke',
                          bgColor: Colors.pink[50]!,
                        ),
                        _PreventionItem(
                          icon: Icons.local_bar_outlined,
                          title: 'No Alcohol',
                          description: 'Completely avoid alcohol during pregnancy',
                          bgColor: Colors.pink[50]!,
                        ),
                        _PreventionItem(
                          icon: Icons.medical_services,
                          title: 'Regular Check-ups',
                          description: 'Attend all prenatal appointments',
                          bgColor: Colors.pink[50]!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildSection(
                      title: 'Environmental Factors',
                      icon: Icons.eco,
                      color: Colors.pink[400]!,
                      items: [
                        _PreventionItem(
                          icon: Icons.cleaning_services,
                          title: 'Avoid Harmful Chemicals',
                          description: 'Stay away from toxic substances and strong cleaners',
                          bgColor: Colors.pink[50]!,
                        ),
                        _PreventionItem(
                          icon: Icons.pets,
                          title: 'Pet Safety',
                          description: 'Avoid changing cat litter to prevent toxoplasmosis',
                          bgColor: Colors.pink[50]!,
                        ),
                        _PreventionItem(
                          icon: Icons.thermostat,
                          title: 'Avoid High Heat',
                          description: 'Stay away from hot tubs and very hot baths',
                          bgColor: Colors.pink[50]!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<_PreventionItem> items,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink[100]!.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ...items.map((item) => _buildPreventionItem(item)),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildPreventionItem(_PreventionItem item) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.bgColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: item.bgColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: item.bgColor.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Icon(item.icon, color: Colors.pink[400], size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: TextStyle(
                    color: Colors.grey[700],
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

class _PreventionItem {
  final IconData icon;
  final String title;
  final String description;
  final Color bgColor;

  _PreventionItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.bgColor,
  });
} 