import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BusScheduleScreen extends StatelessWidget {
  const BusScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33.0, vertical: 35),
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
                        'Bus Schedule',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    BusWiidget(
                      routeNum: 1,
                      color: Color.fromRGBO(185, 195, 189, 1),
                    ),
                    SizedBox(height: 20),
                    BusWiidget(
                      routeNum: 2,
                      color: Color.fromRGBO(92, 167, 120, 1),
                    ),
                    SizedBox(height: 20),
                    BusWiidget(
                      routeNum: 3,
                      color: Color.fromRGBO(237, 191, 206, 1),
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

class BusWiidget extends StatelessWidget {
  const BusWiidget({
    super.key,
    required this.color,
    required this.routeNum,
  });
  final Color color;
  final int routeNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(240, 245, 238, 1),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/bus.png',
                  scale: 1.3,
                ),
                const SizedBox(width: 20),
                Text(
                  'Route no.$routeNum',
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Building 900 to 14',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                '1:00 PM',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Building 14 to 900',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                '1:10 PM',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
