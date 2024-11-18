import 'package:flutter/material.dart';

class EmailCardComponent extends StatelessWidget {
  const EmailCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "randomemaildfd@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              IconButton(
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.onSecondary),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
