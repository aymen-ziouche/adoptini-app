import 'dart:io';

import 'package:adoptini_app/core/settings/domain/entities/ticket_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

abstract class TicketsDataSource {
  Future<void> createTicket(
    Ticket ticket,
  );
}

@Injectable(as: TicketsDataSource)
class ApiTicketsDataSource implements TicketsDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage storage;
  ApiTicketsDataSource(this._firestore, this.storage);

  @override
  Future<void> createTicket(
    Ticket ticket,
  ) async {
    String ticketId = _firestore.collection("tickets").doc().id;

    final storageRef = storage.ref().child('tickets/$ticketId');
    final uploadTask = storageRef.putFile(ticket.attachments as File);
    final ticketImageUrl = await (await uploadTask).ref.getDownloadURL();
    
    await _firestore.collection("tickets").doc(ticketId).set({
      "subject": ticket.subject,
      "type": ticket.type.toString().split('.').last,
      "message": ticket.message,
      "attachments": ticketImageUrl
    });
  }
}
