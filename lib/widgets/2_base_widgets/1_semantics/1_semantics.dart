import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class SemanticsWidget extends StatelessWidget {
  const SemanticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          // Widget title
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: const Text(
              'Semantics',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                inherit: false,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Widget demonstration
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // we should emable screen reader to hear
                  Semantics(
                    label: ("Alarm"),
                    button: true,
                    liveRegion: true,
                    onTapHint: 'Activate alarm',
                    child: IconButton(
                      iconSize: 40,
                      tooltip: 'Alarm',
                      onPressed: () {
                        SemanticsService.announce(
                          'Alarm',
                          Directionality.of(context),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Alarm tapped')),
                        );
                      },
                      icon: const Icon(Icons.alarm),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
