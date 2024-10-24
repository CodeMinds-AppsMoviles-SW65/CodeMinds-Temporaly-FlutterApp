import 'package:flutter/material.dart';

class PrivacyPolicySection extends StatelessWidget {
  final String fontFamily;

  const PrivacyPolicySection({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Espacio inicial
        const SizedBox(height: 16),

        // Título "Privacy Policies"
        Text(
          "Privacy Policies",
          style: TextStyle(
            fontFamily: fontFamily,  // Usamos la fuente personalizada
            fontWeight: FontWeight.w600,  // SemiBold es w600
            fontSize: 20,
          ),
        ),

        // Espacio entre el título y el contenido
        const SizedBox(height: 8),

        // Texto de la política de privacidad
        Text(
          "uwuuuuuu",
          style: TextStyle(
            fontFamily: fontFamily,  // Usamos la fuente personalizada
            fontWeight: FontWeight.w500,  // Medium es w500
            fontSize: 16,
          ),
          textAlign: TextAlign.justify,  // Justificación del texto
        ),
      ],
    );
  }
}
