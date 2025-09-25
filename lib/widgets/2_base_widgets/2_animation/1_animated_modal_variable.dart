import 'package:flutter/material.dart';

class AnimatedModalBarrierWidget extends StatefulWidget {
  const AnimatedModalBarrierWidget({super.key});

  @override
  State<AnimatedModalBarrierWidget> createState() =>
      _AnimatedModalBarrierWidgetState();
}

/// Demonstrates AnimatedModalBarrier:
/// - Draws a full-screen modal scrim that blocks interactions with widgets
///   behind it (like when a dialog is shown).
/// - The scrim's color is animated using an AnimationController and ColorTween.
/// - It's marked dismissible; tapping the barrier triggers a route pop. We use
///   WillPopScope to intercept that pop and instead just hide the barrier.
class _AnimatedModalBarrierWidgetState
    extends State<AnimatedModalBarrierWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _barrierColor;
  bool _showBarrier = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _barrierColor = ColorTween(
      begin: Colors.blue.withOpacity(0.2),
      end: Colors.blue.withOpacity(0.6),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
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
              'AnimatedModalVariable',
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
              child: WillPopScope(
                onWillPop: () async {
                  if (_showBarrier) {
                    setState(() {
                      _showBarrier = false;
                    });
                    return false;
                  }
                  return true;
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tap the button to show an animated modal barrier',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showBarrier = true;
                            });
                          },
                          child: const Text('Show barrier'),
                        ),
                      ],
                    ),
                    if (_showBarrier) ...[
                      AnimatedModalBarrier(
                        color: _barrierColor,
                        dismissible: false,
                        semanticsLabel: 'Loading overlay',
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
