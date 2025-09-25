    import 'package:flutter/material.dart';

class PositionedTransitionWidget extends StatefulWidget {
  const PositionedTransitionWidget({super.key});

  @override
  State<PositionedTransitionWidget> createState() =>
      _PositionedTransitionWidgetState();
}

/// Demonstrates PositionedTransition:
/// - Animates a child's position inside a Stack using absolute pixel offsets
///   described by a RelativeRect (left, top, right, bottom from the Stack's edges).
/// - You provide exact pixel positions; no `size` parameter is needed.
class _PositionedTransitionWidgetState
    extends State<PositionedTransitionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<RelativeRect> _rectAnimation;
  bool _forward = true;

  static const Size _boxSize = Size(240, 240);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    const double boxSide = 80;
    _rectAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, _boxSize.width - boxSide, _boxSize.height - boxSide),
      end: RelativeRect.fromLTRB(_boxSize.width - boxSide, _boxSize.height - boxSide, 0, 0),
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
              'Positioned Transition',
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
                  SizedBox(
                    width: _boxSize.width,
                    height: _boxSize.height,
                    child: Stack(
                      children: [
                        // Background box for context
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.blue.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                        PositionedTransition(
                          rect: _rectAnimation,
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                              child: const Center(
                                child: Text(
                                  'Px-based',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_forward) {
                            _controller.forward(from: 0.0);
                          } else {
                            _controller.reverse(from: 1.0);
                          }
                          setState(() => _forward = !_forward);
                        },
                        child: Text(_forward ? 'Animate to end' : 'Animate to start'),
                      ),
                    ],
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
