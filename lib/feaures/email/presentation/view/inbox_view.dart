import 'package:flutter/material.dart';
import 'package:flutter_project/feaures/email/presentation/components/inbox_component.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 26, 97, 213),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 2),
                            const FaIcon(FontAwesomeIcons.envelope,
                                color: Colors.white),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                "sdojsidjsids@sdjksokij.com",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 26, 97, 213),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.clipboard),
                          iconSize: 20,
                          color: Colors.white,
                        ),
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
