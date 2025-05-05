import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> listenToNewTickets() async {
  await Firebase.initializeApp();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseFunctions functions = FirebaseFunctions.instance;

  try {
    functions.httpsCallable('sendAdminNotification').call();
  } catch (e) {
    print('Error sending notification: $e');
  }

  firestore.collection('tickets').snapshots().listen((snapshot) {
    for (var change in snapshot.docChanges) {
      if (change.type == DocumentChangeType.added) {
        final newTicket = change.doc.data();
        print('New ticket created: $newTicket');

        firestore.collection('users').doc("admin_001").collection("messages").add({
          'text': 'A new ticket has been created.',
          'createdAt': FieldValue.serverTimestamp(),
          'senderId': 'function_bot',
        }).then((value) {
          print('Notification sent to admin_001');
        }).catchError((error) {
          print('Error sending notification to admin_001: $error');
        });
      }
    }
  });
}