import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kfupm/features/events/screens/events_screen.dart';

class EventDetailsScreen extends ConsumerWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(selectedEventProvider);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33.0, vertical: 30),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        event.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 6,
                child: SizedBox(height: 340, child: Image.asset(event.image)),
              ),
              const SizedBox(height: 30),
              Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          const Text(
                            'Rigestration link:  ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            event.link,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.8,
                    ),
                    SizedBox(
                      height: 45,
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          const Text(
                            'Place: ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            event.place,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.8,
                    ),
                    SizedBox(
                      height: 45,
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          const Text(
                            'Target audiance: ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            event.audiance,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.8,
                    ),
                    SizedBox(
                      height: 45,
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          const Text(
                            'Duration: ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${event.duration} days',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
