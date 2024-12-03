import 'package:flutter/material.dart';

class TimelineItem {
  final String title;
  final String subtitle;
  final String description;
  final List<String> guidelines;
  final bool isCompleted;

  TimelineItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.guidelines,
    required this.isCompleted,
  });
}

class TimelinePage extends StatelessWidget {
  TimelinePage({super.key});

  final List<TimelineItem> timelineItems = [
    TimelineItem(
      title: 'Week 1-2 (Month 1)',
      subtitle: 'Conception Period',
      description: 'Fertilization and early cell division',
      guidelines: [
        'Take prenatal vitamins with folic acid',
        'Avoid alcohol and smoking',
        'Maintain a healthy diet',
        'Schedule first prenatal visit'
      ],
      isCompleted: true,
    ),
    TimelineItem(
      title: 'Week 3-4 (Month 1)',
      subtitle: 'Implantation Stage',
      description: 'Embryo attaches to uterine wall',
      guidelines: [
        'Continue prenatal vitamins',
        'Stay hydrated (8-10 glasses of water daily)',
        'Get adequate rest',
        'Avoid raw or undercooked foods'
      ],
      isCompleted: false,
    ),
    // Add more weeks here...
  ];

  void _showGuidelinesDialog(BuildContext context, TimelineItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.title),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B1962),
                  ),
                ),
                const SizedBox(height: 10),
                Text(item.description),
                const SizedBox(height: 15),
                const Text(
                  'Guidelines:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                ...item.guidelines.map((guideline) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• '),
                          Expanded(child: Text(guideline)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimelineItem(BuildContext context, TimelineItem item) {
    return GestureDetector(
      onTap: () => _showGuidelinesDialog(context, item),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: item.isCompleted ? const Color(0xFF8B1962) : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: item.isCompleted
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : null,
                ),
                Container(
                  width: 2,
                  height: 60,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            const SizedBox(width: 15),
            // Content
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.description,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
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
    return SingleChildScrollView(
      child: Column(
        children: [
          // Pregnancy Progress Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8B1962), Color(0xFFE91E63)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Your Pregnancy Journey',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Month 1 - Week 4',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Baby is developing basic structures',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Timeline Content
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: timelineItems
                .map((item) => _buildTimelineItem(context, item))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class TimelinePageView extends StatelessWidget {
  const TimelinePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Pregnancy Progress Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8B1962), Color(0xFFE91E63)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Your Pregnancy Journey',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Month 1 - Week 4',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Baby is developing basic structures',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Timeline Content
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildTimelineItem(
                'Month 1 - Week 1-4',
                'Early Development Stage',
                'Fertilization and implantation occur',
                true,
              ),
              _buildTimelineItem(
                'Month 2 - Week 5-8',
                'Embryonic Period',
                'Major organs begin to form',
                false,
              ),
              _buildTimelineItem(
                'Month 3 - Week 9-12',
                'End of First Trimester',
                'Baby\'s basic physical structure is complete',
                false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    String title,
    String subtitle,
    String description,
    bool isCompleted,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isCompleted ? const Color(0xFF8B1962) : Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 20)
                    : null,
              ),
              Container(
                width: 2,
                height: 60,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(width: 15),
          // Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}