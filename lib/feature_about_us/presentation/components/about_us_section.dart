import 'package:flutter/material.dart';

class AboutUsSection extends StatelessWidget {
  final String fontFamily;

  const AboutUsSection({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,  // Alineación a la izquierda
      children: [
        // Texto
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "MS CodeMinds",
            style: TextStyle(
              fontFamily: fontFamily,  // Usamos la fuente personalizada
              fontWeight: FontWeight.w600,  // SemiBold
              fontSize: 24,
            ),
          ),
        ),
        
        // Imagen
        ClipRRect(
          borderRadius: BorderRadius.circular(12),  // Bordes redondeados
          child: Image.network(
            'https://i.ibb.co/mvLhy4h/about-us.jpg',
            width: double.infinity,  // Ancho completo
            height: 200,  // Altura de la imagen
            fit: BoxFit.cover,  // Ajusta la imagen sin distorsionar
          ),
        ),
      ],
    );
  }
}
