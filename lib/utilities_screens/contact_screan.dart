import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kfupm/models/contact.dart';

final contacts = [
  Contact(name: 'Saudi Red Crescent', phopneNumber: '0550000000'),
  Contact(name: 'Emergency for security', phopneNumber: '0550000000'),
  Contact(name: 'Maintenance department', phopneNumber: '0550000000'),
  Contact(name: 'Buses Numbers', phopneNumber: '0550000000'),
  Contact(name: 'Males Dorms Security ', phopneNumber: '0550000000'),
  Contact(name: 'Females Dorms Security  ', phopneNumber: '0550000000'),
];

class ContctScreen extends ConsumerWidget {
  const ContctScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
        child: Material(
            color: Colors.transparent,
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: SafeArea(
                  bottom: true,
                  child: Padding(
                    padding:
                       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
                    child: Column(
                      children: [
                        Stack(
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
                            const Center(
                              child: Text(
                                'Important Contacts',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            final contact = contacts[index];
                            return ListTile(
                              title: Text(
                                contact.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              subtitle: Text(
                                contact.phopneNumber,
                                style: const TextStyle(fontSize: 13),
                              ),
                              trailing: const Icon(
                                Icons.phone,
                                size: 25,
                                color: Color.fromARGB(255, 15, 68, 17),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              thickness: 0.3,
                              color: Colors.grey,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
