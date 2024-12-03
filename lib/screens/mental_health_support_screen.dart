import 'package:flutter/material.dart';

class MentalHealthSupportScreen extends StatelessWidget {
  const MentalHealthSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Mental Health Support',
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
                      right: -30,
                      top: -30,
                      child: Icon(
                        Icons.psychology,
                        size: 180,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.favorite,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                    _buildSupportCard(
                      title: 'Emotional Support',
                      icon: Icons.sentiment_satisfied_alt,
                      items: [
                        'Talk to your healthcare provider about your feelings',
                        'Join pregnancy support groups',
                        'Practice relaxation techniques',
                        'Share your concerns with trusted friends and family',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildSupportCard(
                      title: 'Self-Care Tips',
                      icon: Icons.spa,
                      items: [
                        'Get adequate sleep and rest',
                        'Practice gentle exercise like prenatal yoga',
                        'Maintain a healthy diet',
                        'Take time for activities you enjoy',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildSupportCard(
                      title: 'Professional Help',
                      icon: Icons.medical_services,
                      items: [
                        'Consult with mental health professionals',
                        'Attend counseling sessions if needed',
                        'Consider therapy options',
                        'Ask about support services available',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildEmergencyCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportCard({
    required String title,
    required IconData icon,
    required List<String> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.pink[100]!.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink[400]!, Colors.pink[300]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 30),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: items.map((item) => _buildListItem(item)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.pink[400], size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pink[200]!),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.emergency, color: Colors.red, size: 24),
              SizedBox(width: 12),
              Text(
                'Emergency Contacts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildEmergencyContact('Mental Health Hotline', '1-800-XXX-XXXX'),
          _buildEmergencyContact('Crisis Support', '1-800-XXX-XXXX'),
        ],
      ),
    );
  }

  Widget _buildEmergencyContact(String title, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            number,
            style: TextStyle(
              fontSize: 16,
              color: Colors.pink[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
} 