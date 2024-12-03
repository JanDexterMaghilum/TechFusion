import 'package:cloud_firestore/cloud_firestore.dart';

class ReportService {
  final CollectionReference reports = 
      FirebaseFirestore.instance.collection('reports');

  // Create new report
  Future<void> createReport(Map<String, dynamic> reportData) async {
    await reports.add({
      ...reportData,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Get all reports
  Stream<QuerySnapshot> getReports() {
    return reports
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Update report status
  Future<void> updateReportStatus(String reportId, String status) async {
    await reports.doc(reportId).update({
      'status': status,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // Add response to report
  Future<void> addResponse(String reportId, String response) async {
    await reports.doc(reportId).update({
      'response': response,
      'respondedAt': FieldValue.serverTimestamp(),
    });
  }
}