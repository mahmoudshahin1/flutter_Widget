    import 'package:flutter/material.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  const AnimatedPhysicalModelWidget({super.key});

  @override
  State<AnimatedPhysicalModelWidget> createState() =>
      _AnimatedPhysicalModelWidgetState();
}

/// Demonstrates AnimatedPhysicalModel:
/// - Animates physical properties like elevation, shape, and color when they
///   change, producing a smooth transition.
/// - Useful for material surfaces that need to raise/lower with a shadow,
///   morph corners, or subtly change fill color.
class _AnimatedPhysicalModelWidgetState
    extends State<AnimatedPhysicalModelWidget> {
  bool _isRaised = false;
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
              'Animated Physical Model',
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
                  AnimatedPhysicalModel(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    elevation: _isRaised ? 16 : 2,
                    color: _isRaised
                        ? Colors.blue.shade300
                        : Colors.blue.shade100,
                    shadowColor: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(_isRaised ? 32 : 8),
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                      width: 180,
                      height: 120,
                      child: Center(
                        child: Text(
                          _isRaised ? 'Raised surface' : 'Flat surface',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isRaised = !_isRaised;
                      });
                    },
                    child: Text(_isRaised ? 'Lower' : 'Raise'),
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
