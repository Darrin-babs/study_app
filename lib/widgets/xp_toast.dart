import 'package:flutter/material.dart';

void showXPToast(BuildContext context, String text) {
  final overlay = Overlay.of(context);
  final entry = OverlayEntry(
    builder: (_) => Positioned(
      top: 80,
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedXPToast(text: text),
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(Duration(milliseconds: 1800), () {
    entry.remove();
  });
}

class AnimatedXPToast extends StatefulWidget {
  final String text;
  const AnimatedXPToast({required this.text});

  @override
  State<AnimatedXPToast> createState() => _AnimatedXPToastState();
}

class _AnimatedXPToastState extends State<AnimatedXPToast>
    with SingleTickerProviderStateMixin {
  late AnimationController c;
  late Animation<double> a;

  @override
  void initState() {
    super.initState();
    c = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    a = CurvedAnimation(parent: c, curve: Curves.easeOutBack);
    c.forward();
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: a,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color(0xFF9FD9FF),
              Color(0xFF6AB8F7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF6AB8F7).withOpacity(0.45),
              blurRadius: 22,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}