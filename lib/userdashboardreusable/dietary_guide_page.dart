import 'package:flutter/material.dart';

class DietaryGuidePage extends StatelessWidget {
  const DietaryGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dietary & Caloric Guide'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF8B1962), Color(0xFFC85A9C)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCalorieSection(),
              const SizedBox(height: 16),
              _buildNutrientSection(),
              const SizedBox(height: 16),
              _buildMealPlanSection(),
              const SizedBox(height: 16),
              _buildFoodsToAvoidSection(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalorieSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Daily Calorie Needs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B1962))),
            const Divider(),
            _buildCalorieRow('First Trimester', '1,800 cal'),
            _buildCalorieRow('Second Trimester', '2,200 cal'),
            _buildCalorieRow('Third Trimester', '2,400 cal'),
          ],
        ),
      ),
    );
  }

  Widget _buildCalorieRow(String trimester, String calories) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(trimester),
          Text(calories, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8B1962))),
        ],
      ),
    );
  }

  Widget _buildNutrientSection() {
    final nutrients = [
      {'name': 'Folic Acid', 'amount': '600-800 mcg', 'icon': Icons.spa},
      {'name': 'Iron', 'amount': '27 mg', 'icon': Icons.fitness_center},
      {'name': 'Calcium', 'amount': '1,000 mg', 'icon': Icons.opacity},
      {'name': 'Protein', 'amount': '75-100 g', 'icon': Icons.egg},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Essential Nutrients',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B1962))),
            const Divider(),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: nutrients.map((nutrient) => _buildNutrientCard(nutrient)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutrientCard(Map<String, dynamic> nutrient) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(nutrient['icon'] as IconData, color: const Color(0xFF8B1962)),
          Text(nutrient['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(nutrient['amount'] as String, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMealPlanSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Daily Meal Plan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B1962))),
            const Divider(),
            _buildMealTime('Breakfast', '• Cereal with milk\n• Fruits\n• Yogurt'),
            const Divider(),
            _buildMealTime('Lunch', '• Grilled chicken sandwich\n• Salad'),
            const Divider(),
            _buildMealTime('Dinner', '• Salmon\n• Brown rice\n• Vegetables'),
          ],
        ),
      ),
    );
  }

  Widget _buildMealTime(String mealTime, String foods) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mealTime, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8B1962))),
          const SizedBox(height: 4),
          Text(foods, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildFoodsToAvoidSection() {
    final foodsToAvoid = [
      'Raw/undercooked meat',
      'Unpasteurized dairy',
      'High-mercury fish',
      'Raw eggs',
      'Unwashed produce',
      'Excess caffeine',
    ];

    return Card(
      color: const Color(0xFFFCE4EC),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Foods to Avoid',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B1962))),
            const Divider(),
            ...foodsToAvoid.map((food) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.not_interested, color: Color(0xFF8B1962), size: 16),
                      const SizedBox(width: 8),
                      Text(food, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
} 