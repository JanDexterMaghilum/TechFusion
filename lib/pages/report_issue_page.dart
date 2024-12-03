import 'package:flutter/material.dart';
import 'package:birthtrack/services/report_service.dart';

class ReportIssuePage extends StatefulWidget {
  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  final _formKey = GlobalKey<FormState>();
  String _issueTitle = '';
  String _issueDescription = '';
  String _selectedCategory = 'Technical Issue';
  String _selectedPriority = 'Medium';

  // List sa mga category options
  final List<String> _categories = [
    'Technical Issue',
    'Account Problem',
    'App Feature Request',
    'Data Privacy Concern',
    'Others'
  ];

  // List sa mga priority levels
  final List<String> _priorities = [
    'Low',
    'Medium',
    'High',
    'Critical'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report an Issue'),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Category Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Issue Category',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                value: _selectedCategory,
                items: _categories.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
              ),
              SizedBox(height: 16),

              // Priority Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Priority Level',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.priority_high),
                ),
                value: _selectedPriority,
                items: _priorities.map((String priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPriority = newValue!;
                  });
                },
              ),
              SizedBox(height: 16),

              // Issue Title
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Issue Title',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Palihug isulat ang issue title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _issueTitle = value!;
                },
              ),
              SizedBox(height: 16),

              // Issue Description
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Issue Description',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Palihug ihulagway ang issue';
                  }
                  return null;
                },
                onSaved: (value) {
                  _issueDescription = value!;
                },
              ),
              SizedBox(height: 24),

              // Submit Button
              ElevatedButton.icon(
                onPressed: _submitReport,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: Icon(Icons.send),
                label: Text(
                  'Submit Report',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitReport() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      final reportService = ReportService();
      
      try {
        await reportService.createReport({
          'title': _issueTitle,
          'description': _issueDescription,
          'category': _selectedCategory,
          'priority': _selectedPriority,
          'userId': 'current_user_id', // TODO: Get actual user ID
        });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successful ang pag-submit sa imong report!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
} 