import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kfupm/common_widgets/option_widget.dart';
import 'package:kfupm/common_widgets/options_column.dart';
import 'package:kfupm/routing/app_router.dart';

void signOut(WidgetRef ref) async {
  await ref.read(firebaseAuthProvider).signOut();
  ref.read(goRouterProvider).goNamed(AppRoute.signIn.name);
}

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(firebaseAuthProvider);
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
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 233, 214),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green[900],
                          radius: 40,
                          child: Text(auth.currentUser!.displayName?[0] ?? 'J'),
                        ),
                        title: Text(
                          auth.currentUser!.displayName ?? 'Jood',
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(auth.currentUser!.email.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    const SizedBox(height: 40),
                    OptionsColumn(
                      borderColor: const Color.fromRGBO(240, 240, 240, 1),
                      title: 'Services',
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      titleFontSize: 18,
                      children: [
                        const OptionWidget(
                          icon: Icons.laptop,
                          title: 'Blackboard',
                          showBottomBorder: true,
                        ),
                        const OptionWidget(
                          icon: Icons.discount_outlined,
                          title: 'Discounts',
                          showBottomBorder: true,
                        ),
                        const OptionWidget(
                          icon: Icons.door_back_door,
                          title: 'Reserve a room',
                          showBottomBorder: false,
                        ),
                        GestureDetector(
                          onTap: () => context.pushNamed(AppRoute.map.name),
                          child: const OptionWidget(
                            icon: Icons.map,
                            title: 'KFUPM map',
                            showBottomBorder: false,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    OptionsColumn(
                      borderColor: const Color.fromRGBO(240, 240, 240, 1),
                      title: 'Reach us',
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      titleFontSize: 18,
                      children: [
                        GestureDetector(
                          onTap: () => context.pushNamed(AppRoute.contact.name),
                          child: const OptionWidget(
                            icon: Icons.call,
                            title: 'Importants contacts',
                            showBottomBorder: false,
                          ),
                        ),
                        const OptionWidget(
                          icon: Icons.settings,
                          title: 'Report a problem',
                          showBottomBorder: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color.fromRGBO(198, 44, 41, 1),
                          side: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(198, 44, 41, 1),
                          ),
                        ),
                        onPressed: () => signOut(ref),
                        child: const Text(
                          'Sign out',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromRGBO(198, 44, 41, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
