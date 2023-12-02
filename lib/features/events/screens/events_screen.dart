// ignore: unused_import
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kfupm/features/events/evevnt_repository.dart';
import 'package:kfupm/models/event.dart';
import 'package:kfupm/routing/app_router.dart';

final selectedEventProvider = StateProvider<Event>((ref) {
  return e[0];
});
final e = [
  Event(
    name: 'Flutter Weekend',
    image: 'assets/images/event1.png',
    link: 'https://kfupm.flutter',
    audiance: 'Flutter Developers',
    duration: 3,
    place: 'Techno valley,',
  ),
  Event(
    name: 'Nanotechnology',
    image: 'assets/images/event2.png',
    link: 'https://kfupm.Nanotechnology',
    audiance: 'Tech people',
    duration: 2,
    place: 'Techno valley,',
  ),
  Event(
    name: 'Material Debate',
    image: 'assets/images/event3.png',
    link: 'https://kfupm.material',
    audiance: 'Students',
    duration: 2,
    place: 'Building 10',
  ),
  Event(
    name: 'Supply Chain',
    image: 'assets/images/event4.png',
    link: 'https://kfupm.ise',
    audiance: 'Industrial students',
    duration: 4,
    place: 'Building 10',
  ),
  Event(
    name: 'GRW',
    image: 'assets/images/event5.png',
    link: 'https://kfupm.workshops',
    audiance: 'Students',
    duration: 3,
    place: 'Building 63',
  ),
  Event(
    name: 'KFUPM Winter',
    image: 'assets/images/event6.png',
    link: 'https://kfupm.events',
    audiance: 'KFUPM Students',
    duration: 3,
    place: 'Not applicable',
  ),
];

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text(
          'Upcoming Events',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.0),
        child: ref.watch(fetchEventsProvider).when(
            data: (events) => GridView.builder(
                  shrinkWrap: true,
                  itemCount: events.length,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final event = events[index];
                    return GestureDetector(
                      child: EventPoster(event: event),
                    );
                  },
                ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}

class EventPoster extends ConsumerWidget {
  const EventPoster({
    super.key,
    required this.event,
  });
  final Event event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedEventProvider.notifier).update((state) => event);
        context.pushNamed(AppRoute.event.name);
      },
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 7,
        child: Container(
          width: 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 0.25,
              color: const Color.fromARGB(255, 4, 55, 30),
            ),
            image: DecorationImage(
              image: AssetImage(event.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
