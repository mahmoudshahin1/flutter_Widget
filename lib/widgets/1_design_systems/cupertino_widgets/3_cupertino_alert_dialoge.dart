import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAlertDialogeWidget extends StatelessWidget {
  const CupertinoAlertDialogeWidget({super.key});

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
              'Cupertino Alert Dialoge',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed:
                        () => showCupertinoDialog(
                          context: context,
                          builder:
                              (context) => CupertinoAlertDialog(
                                title: Text("Alert"),
                                content: Text(
                                  "This is Cupertino Alert Dialoge",
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("No"),
                                  ),
                                  CupertinoDialogAction(
                                    child: Text("Yes"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                        ),
                    color: CupertinoColors.systemBlue,
                    child: Text(
                      "Alert Dialoge",
                      style: TextStyle(color: Colors.white),
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
