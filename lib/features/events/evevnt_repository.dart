import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm/models/event.dart';
import 'package:kfupm/providers.dart';


final eventRepositoryProvider = Provider((ref) {
  return EventRepository(firestore: ref.watch(firestoreProvider));
});
final fetchEventsProvider = StreamProvider((ref) {
  return ref.watch(eventRepositoryProvider).fetchEvents();
});


class EventRepository {
  final FirebaseFirestore _firestore;
  EventRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  Stream<List<Event>> fetchEvents() {
    return _firestore.collection('events')
        .snapshots()
        .map((event) => event.docs
            .map((e) => Event.fromMap(e.data()))
            .toList());
  }
}
