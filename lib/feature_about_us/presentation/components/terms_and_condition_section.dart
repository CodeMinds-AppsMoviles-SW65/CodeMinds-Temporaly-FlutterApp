import 'package:flutter/material.dart';

class TermsAndConditionSection extends StatelessWidget {
  final String fontFamily;

  const TermsAndConditionSection({super.key, required this.fontFamily,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        const SizedBox(height: 16),

        // Título
        Text(
          "Terms and Conditions",
          style: TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w600, // SemiBold
            fontSize: 20,
            color: Colors.black, // Nos aseguramos de que el texto sea negro puro
          ),
        ),

        const SizedBox(height: 8),

        // Caja con scroll sin borde visible y con espacio más limpio
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255), // Aseguramos que el fondo sea blanco
            borderRadius: BorderRadius.circular(8), // Redondeado más sutil
          ),
          height: 200, // Ajusta la altura
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Ajuste de padding
          child: Scrollbar(
            thumbVisibility: true, // Visibilidad del scrollbar
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              child: Text(
                """
                1. Terms

                We may modify these terms or any additional terms that apply to a Service to, for example, reflect changes to the law or changes to our Services. You should look at the terms regularly. We'll post notice of modifications to these terms on this page.
                
                If there is a conflict between these terms and the additional terms, the additional terms will control for that conflict.

                2. Changes to Services

                We reserve the right to change or modify any of our services at any time.
                """,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w500,  // Medium
                  fontSize: 16,
                  color: Colors.black87, // Un color más sutil y legible
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
