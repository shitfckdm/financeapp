import 'package:flutter/material.dart';

class GridMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const GridMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.color = Colors.deepOrange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120, // lebar container lebih kecil
      height: 120, // tinggi container lebih kecil
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: color),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: color.darken(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extension untuk membuat warna lebih gelap
extension ColorBrightness on Color {
  Color darken([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}