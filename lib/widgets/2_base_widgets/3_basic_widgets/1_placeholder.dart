    import 'package:flutter/material.dart';

class PlaceholderWidget extends StatefulWidget {
  const PlaceholderWidget({super.key});

  @override
  State<PlaceholderWidget> createState() =>
      _PlaceholderWidgetState();
}

/// Demonstrates Placeholder:
/// - Renders a simple crossed-box used during layout debugging or when content
///   is not yet ready.
/// - Useful to visualize size/constraints or to mark TODO areas in UIs.
class _PlaceholderWidgetState
    extends State<PlaceholderWidget> {
  static const Size _boxSize = Size(240, 240);
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
              'Placeholder',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Default Placeholder (auto-sizes to parent constraints):',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: _boxSize.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.withOpacity(0.3)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Placeholder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Customized Placeholder (color + strokeWidth + fallback sizes):',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(
                    width: 160,
                    height: 100,
                    child: Placeholder(
                      color: Colors.purple,
                      strokeWidth: 3,
                      fallbackWidth: 160,
                      fallbackHeight: 100,
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
