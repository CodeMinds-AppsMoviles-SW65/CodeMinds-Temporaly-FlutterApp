import 'package:flutter/material.dart';

class AboutUsHeader extends StatelessWidget {
  const AboutUsHeader({super.key}); // Usamos const para mejorar el rendimiento.

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Privacy Policy",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'WorkSans', // Usamos la fuente WorkSans
          fontWeight: FontWeight.w600, // SemiBold es equivalente a w600
          fontSize: 26,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Const para el ícono
        onPressed: () {
          Navigator.of(context).pop(); // Acción de retroceso aquí
        },
        color: Colors.white, // Color del ícono
      ),
      backgroundColor: const Color(0xFF2979FF), // Color de fondo de la AppBar, const optimiza
    );
  }
}
