import 'package:flutter/material.dart';
import 'package:flutter_project/feaures/about_us/presentation/components/about_us_header.dart';
import 'package:flutter_project/feaures/about_us/presentation/components/about_us_section.dart';
import 'package:flutter_project/feaures/about_us/presentation/components/team_profile_section.dart';
import 'package:flutter_project/feaures/about_us/presentation/components/privacy_policy_section.dart';
import 'package:flutter_project/feaures/about_us/presentation/components/terms_and_condition_section.dart';
import 'package:flutter_project/feaures/about_us/presentation/components/consent_section.dart';
class AboutUsScreen extends StatefulWidget {
const AboutUsScreen({super.key});

  @override
  AboutUsScreenState createState() => AboutUsScreenState();
}

class AboutUsScreenState extends State<AboutUsScreen> {
  bool showDialog = false;

  @override
  Widget build(BuildContext context) {
  String workSansFontFamily = 'WorkSans';  // Usamos el nombre de la fuente directamente

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Altura ajustada si es necesario
        child: AboutUsHeader(), // Utilizamos el header personalizado
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección About Us
            AboutUsSection(fontFamily: workSansFontFamily),

            const SizedBox(height: 16),

            // Sección Team Profile
            TeamProfileSection(fontFamily: workSansFontFamily),

            const SizedBox(height: 16),

            // Sección Terms and Conditions
            TermsAndConditionSection(fontFamily: workSansFontFamily),

            const SizedBox(height: 16),

            // Sección Privacy Policy
            PrivacyPolicySection(fontFamily: workSansFontFamily),
            const SizedBox(height: 16),
            // Sección Consent
            ConsentSection(
              fontFamily: workSansFontFamily,
            ),
          ],
        ),
      ),
    );
  }
}
