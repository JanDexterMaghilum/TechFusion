import 'package:birthtrack/inbox_page.dart';
import 'package:birthtrack/pages/report_issue_page.dart';
import 'package:birthtrack/pages/settings_page.dart';
import 'package:birthtrack/pages/user_records_page.dart';
import 'package:birthtrack/screens/appointment_booking_screen.dart';
import 'package:birthtrack/screens/birth_defects_prevention_screen.dart';
import 'package:birthtrack/screens/mental_health_support_screen.dart';
import 'package:birthtrack/screens/physical_activity_screen.dart';
import 'package:birthtrack/settings_page.dart';
import 'package:birthtrack/userdashboardreusable/dietary_guide_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // List of all guidelines
  final List<Map<String, dynamic>> _allGuidelines = [
    {
      'title': 'DIETARY AND CALORIC RECOMMENDATIONS',
      'icon': Icons.restaurant,
      'screen': const DietaryGuidePage(),
    },
    {
      'title': 'PHYSICAL ACTIVITY GUIDELINES',
      'icon': Icons.fitness_center,
      'screen': const PhysicalActivityScreen(),
    },
    {
      'title': 'PREVENTION OF BIRTH DEFECTS GUIDELINES',
      'icon': Icons.medical_services,
      'screen': const BirthDefectsPreventionScreen(),
    },
    {
      'title': 'MENTAL HEALTH SUPPORT',
      'icon': Icons.psychology,
      'screen': const MentalHealthSupportScreen(),
    },
  ];

  // Filtered guidelines based on search
  List<Map<String, dynamic>> _filteredGuidelines = [];

  // Add this list for fruit suggestions
  final List<Map<String, dynamic>> _fruitSuggestions = [
    {
      'fruit': 'Oranges',
      'benefit': 'Rich in Vitamin C & Folate',
      'image': 'assets/Orange-Fruit-Pieces.jpg',
      'servings': '1-2 per day'
    },
    {
      'fruit': 'Bananas',
      'benefit': 'High in Potassium & Fiber',
      'image': 'assets/ctba8538_banana_625x300_23_August_23.jpg',
      'servings': '1 per day'
    },
    {
      'fruit': 'Berries',
      'benefit': 'Antioxidants & Vitamins',
      'image': 'assets/Berries-shutterstock_132911189.jpg',
      'servings': '1 cup per day'
    },
    {
      'fruit': 'Carrots',
      'benefit': 'High in Vitamin A for baby\'s eye & skin health',
      'image': 'assets/two-fresh-carrots-sliced-two-fresh-carrots-sliced-isolated-white-background-172708500.webp',
      'servings': '1 per day'
    },
    {
      'fruit': 'Sweet Potatoes',
      'benefit': 'Rich in fiber & Vitamin A',
      'image': 'assets/sweet-potato.jpg',
      'servings': '1 serving per day'
    },
  ];
  
  static get s => null;

  @override
  void initState() {
    _filteredGuidelines = _allGuidelines;
    super.initState();
  }

  // Search function
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allGuidelines;
    } else {
      results = _allGuidelines
          .where((guideline) => guideline['title']
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredGuidelines = results;
    });
  }

  // Add this widget to build fruit suggestion cards
  Widget _buildFruitSuggestionCard(Map<String, dynamic> fruit) {
    return Container(
      width: 160,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.pink[50]!,
                    Colors.white,
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image container with shadow
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          fruit['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Title
                  Text(
                    fruit['fruit'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Benefit text
                  Expanded(
                    child: Text(
                      fruit['benefit'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Servings pill
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.pink[400]!,
                          Colors.pink[300]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      fruit['servings'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Optional: Add subtle pattern overlay
            Opacity(
              opacity: 0.03,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/pattern.png'), // Add a subtle pattern image
                    repeat: ImageRepeat.repeat,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with gradient
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B1962), Color(0xFFE91E63)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const Text(
                      'PREGNANT GUIDELINES',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Modified Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        onChanged: (value) => _runFilter(value),
                        decoration: const InputDecoration(
                          hintText: 'Search guidelines...',
                          border: InputBorder.none,
                          icon: Icon(Icons.search, color: Colors.pink),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatCard('Week', '12'),
                        _buildStatCard('Weight', '52kg'),
                        _buildStatCard('BP', '120/80'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Add this after the header and before the guidelines list
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Daily Fruit Suggestions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FlutterCarousel(
                    items: _fruitSuggestions.map((fruit) => 
                      _buildFruitSuggestionCard(fruit)
                    ).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      showIndicator: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      viewportFraction: 0.45,
                      enableInfiniteScroll: true,
                      padEnds: false,
                    ),
                  ),
                ],
              ),
            ),

            // Modified Guidelines List
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: _filteredGuidelines.map((guideline) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => guideline['screen'],
                            ),
                          );
                        },
                        child: _buildGuidelineCard(
                          guideline['title'],
                          guideline['icon'],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Records'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Home - already on this page
              break;
            case 1:
              // Timeline
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserRecordsPage()),
              );
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InboxPage()));
              break;
            case 3:
              // Settings
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AppointmentBookingScreen(),
            ),
          );
        },
        backgroundColor: Colors.pink[400],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidelineCard(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Subtle gradient background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.pink[50]!.withOpacity(0.5),
                    Colors.white,
                  ],
                ),
              ),
            ),
            
            // Main content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Icon container with gradient
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.pink[300]!,
                          Colors.pink[400]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 20),
                  
                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3142),
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Tap to view details',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Arrow icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.pink[400],
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            
            // Optional decorative elements
            Positioned(
              right: -20,
              bottom: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.pink[50]!.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
