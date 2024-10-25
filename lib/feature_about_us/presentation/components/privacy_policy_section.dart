import 'package:flutter/material.dart';

class PrivacyPolicySection extends StatelessWidget {
  final String fontFamily;

  const PrivacyPolicySection({super.key, required this.fontFamily,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        const SizedBox(height: 16), // Espacio entre el borde superior y el contenido

        // Título
        Text(
          "Privacy policy",
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
          height: 300, // Ajusta la altura
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Ajuste de padding
          child: Scrollbar(
            thumbVisibility: true, // Visibilidad del scrollbar
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              child: Text(
                """

Last updated September 28, 2024


This Privacy Notice for Temporaly Inc ("we," "us," or "our"), describes how and why we might access, collect, store, use, and/or share ("process") your personal information when you use our services ("Services"), including when you:
Download and use our mobile application (Temporaly), or any other application of ours that links to this Privacy Notice
Use Temporaly. Temporaly is designed for students across all educational levels—ranging from school to undergraduate and postgraduate—offering advanced tools to protect their information. Our goal is to provide tailored security solutions for each group’s specific needs, ensuring that everyone can confidently and easily safeguard their data. The application offers temporary email services, allowing users to select from three plans with different time limits (10, 30, or 60 minutes). Users can log in with their temporary email, and once the email expires, a sidebar will display the history of inbox activities.
Engage with us in other related ways, including any sales, marketing, or events
Questions or concerns? Reading this Privacy Notice will help you understand your privacy rights and choices. We are responsible for making decisions about how your personal information is processed. If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at Temporaly@upc.edu.pe.


SUMMARY OF KEY POINTS

This summary provides key points from our Privacy Notice, but you can find out more details about any of these topics by clicking the link following each key point or by using our table of contents below to find the section you are looking for.

What personal information do we process? When you visit, use, or navigate our Services, we may process personal information depending on how you interact with us and the Services, the choices you make, and the products and features you use. Learn more about personal information you disclose to us.

Do we process any sensitive personal information? Some of the information may be considered "special" or "sensitive" in certain jurisdictions, for example your racial or ethnic origins, sexual orientation, and religious beliefs. We may process sensitive personal information when necessary with your consent or as otherwise permitted by applicable law. Learn more about sensitive information we process.

Do we collect any information from third parties? We do not collect any information from third parties.

How do we process your information? We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent. We process your information only when we have a valid legal reason to do so. Learn more about how we process your information.

In what situations and with which parties do we share personal information? We may share information in specific situations and with specific third parties. Learn more about when and with whom we share your personal information.

How do we keep your information safe? We have adequate organizational and technical processes and procedures in place to protect your personal information. However, no electronic transmission over the internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorized third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Learn more about how we keep your information safe.

What are your rights? Depending on where you are located geographically, the applicable privacy law may mean you have certain rights regarding your personal information. Learn more about your privacy rights.

How do you exercise your rights? The easiest way to exercise your rights is by submitting a data subject access request, or by contacting us. We will consider and act upon any request in accordance with applicable data protection laws.

Want to learn more about what we do with any information we collect? Review the Privacy Notice in full.
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