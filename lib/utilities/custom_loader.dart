import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key});

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _loadingText = "";
  bool _isLoading = true;
  final String _helloText = "ꫜ꩐ꪚꪖ...";
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: _helloText.length.toDouble())
        .animate(_controller)
      ..addListener(() {
        setState(() {
          _loadingText = _helloText.substring(0, _animation.value.toInt());
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: _isLoading
            ? Text(
          _loadingText,
          style: const TextStyle(fontSize: 24),
        ) // Show loading animation
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_loadingText, style: const TextStyle(fontSize: 24)), // Show loaded data
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _controller.forward(from: 0);
                });
              },
              child: const Text('Reload'),
            ),
            // Loader overlay
            if (_isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.10), // Overlay color
                  child: Center(
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        _loadingText,
                        style: TextStyle(fontSize: 24, color: Colors.white), // Loader text style
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
