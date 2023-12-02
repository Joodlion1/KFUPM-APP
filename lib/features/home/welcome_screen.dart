import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm/routing/app_router.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(firebaseAuthProvider);

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/images/kfupm.png",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sunday 3 Dec',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'SWE216',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(240, 240, 240, 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              '8:00 AM',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'to',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '8:50 AM',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Column(
                          children: [
                            Text(
                              'SWE 216 - Review for major 2 exam on 6 Dec',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.room,
                                  color: Colors.green,
                                ),
                                Text(
                                  'Building 24',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(width: 22),
                                Icon(
                                  Icons.door_back_door,
                                  color: Colors.green,
                                ),
                                Text(
                                  'Room 221',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: StudentService(
                      asset: "assets/images/attendance.png",
                      title: "Darajati Attendance",
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: StudentService(
                      asset: "assets/images/qr.png",
                      title: "Attendence",
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: StudentService(
                      asset: "assets/images/grades.png",
                      title: "Darajati Grades",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: StudentService(
                      asset: "assets/images/calander.png",
                      title: "upcoming activities",
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: StudentService(
                      asset: "assets/images/gpa.png",
                      title: "GPA Calculater",
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: StudentService(
                      asset: "assets/images/schedule.png",
                      title: "schedule",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StudentService(
                    asset: "assets/images/bus.png",
                    title: "Bus Schedule",
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StudentService extends StatelessWidget {
  const StudentService({
    super.key,
    required this.title,
    required this.asset,
    required this.onPressed,
  });
  final String title;
  final String asset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            asset,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
