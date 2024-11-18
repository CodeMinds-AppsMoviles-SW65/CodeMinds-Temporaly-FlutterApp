import 'package:flutter/material.dart';
import 'package:flutter_project/feaures/email/presentation/components/email_card_components.dart';

class EmailView extends StatefulWidget {
  const EmailView({super.key});

  @override
  State<EmailView> createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'Active Emails',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 1,
                      indent: 20,
                      endIndent: 30,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  EmailCardComponent(),
                  EmailCardComponent(),
                  EmailCardComponent(),
                  EmailCardComponent(),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'Inactive Emails',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 1,
                      indent: 20,
                      endIndent: 30,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  EmailCardComponent(),
                  EmailCardComponent(),
                  EmailCardComponent(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
