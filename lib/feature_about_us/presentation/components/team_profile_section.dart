import 'package:flutter/material.dart';

class TeamProfileSection extends StatelessWidget {
  const TeamProfileSection({super.key ,required this.fontFamily});
  final String fontFamily;

  // Función que crea el widget de imagen del perfil
  Widget buildProfileImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Espacio inicial
        const SizedBox(height: 16),

        // Título "Team Profile"
        Text(
          "Team Profile hola",
          style: TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w600,  // SemiBold
            fontSize: 20,
          ),
        ),
        
        const SizedBox(height: 8),

        // Fila de imágenes del equipo con desplazamiento horizontal
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Llamada a la función para cada miembro del equipo
              buildProfileImage('https://i.ibb.co/1mJr2p3/mateo.jpg'),
              buildProfileImage('https://i.ibb.co/vD9kZkr/abel.jpg'),
              buildProfileImage('https://i.ibb.co/JWLpkZ0/belen.jpg'),
              buildProfileImage('https://i.ibb.co/XxXKvWF/alex.jpg'),
            ],
          ),
        ),

        // Espacio entre las imágenes y el texto descriptivo
        const SizedBox(height: 8),

        // Descripción del equipo
        Text(
          "The team is made up of students who are passionate about technology and software development: Mateo Vílchez, Abel Ortega, Belen Ramos and Alex Ávila.",
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
