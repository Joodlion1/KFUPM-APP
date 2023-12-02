import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm/common_widgets/option_widget.dart';
import 'package:kfupm/common_widgets/options_column.dart';
import 'package:kfupm/routing/app_router.dart';

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
                        color: const Color.fromRGBO(240, 240, 240, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          child: Text(auth.currentUser!.displayName?[0] ?? 'U'),
                        ),
                        title: Text(auth.currentUser!.displayName ?? 'Unknown'),
                        subtitle: Text(auth.currentUser!.email.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const OptionsColumn(
                      borderColor:  Color.fromRGBO(240, 240, 240, 1),
                      title: 'Reach us',
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      titleFontSize: 18,
                      children: [
                        OptionWidget(
                          icon: Icons.abc,
                          title: 'title',
                          showBottomBorder: true,
                        ),
                        OptionWidget(
                          icon: Icons.abc,
                          title: 'title',
                          showBottomBorder: true,
                        ),
                        OptionWidget(
                          icon: Icons.abc,
                          title: 'title',
                          showBottomBorder: false,
                        ),
                      ],
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
