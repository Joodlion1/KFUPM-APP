// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../src/data/job.dart';

// class AuthRepository {
//   AuthRepository(this._firestore);
//   final FirebaseFirestore _firestore;

//   Future<void> addJob(String uid, String title, String company) =>
//       _firestore.collection('users/$uid/jobs').add({
//         'title': title,
//         'company': company,
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//   Future<void> updateJob(
//           String uid, String jobId, String title, String company) =>
//       _firestore.doc('users/$uid/jobs/$jobId').update({
//         'title': title,
//         'company': company,
//       });

//   Future<void> deleteJob(String uid, String jobId) =>
//       _firestore.doc('users/$uid/jobs/$jobId').delete();

//   Query<Job> jobsQuery(String uid) {
//     return _firestore
//         .collection('users/$uid/jobs')
//         .withConverter(
//           fromFirestore: (snapshot, _) => Job.fromMap(snapshot.data()!),
//           toFirestore: (job, _) => job.toMap(),
//         )
//         .orderBy('createdAt', descending: true);
//   }
// }

// final firestoreRepositoryProvider = Provider<AuthRepository>((ref) {
//   return AuthRepository(FirebaseFirestore.instance);
// });