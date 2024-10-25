import 'package:flutter/material.dart';

class ConsentSection extends StatefulWidget {
  final String fontFamily;

  const ConsentSection({super.key, required this.fontFamily});

  @override
  ConsentSectionState createState() => ConsentSectionState();
}

class ConsentSectionState extends State<ConsentSection> {
  bool consentAccepted = false;
  bool termsAccepted = false;
  bool privacyPolicyAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        const SizedBox(height: 16),

        // Título
        Text(
          "Consent to Data Processing",
          style: TextStyle(
            fontFamily: widget.fontFamily,
            fontWeight: FontWeight.w600, 
            fontSize: 20,
            color: Colors.black, 
          ),
        ),
        const SizedBox(height: 8),

        // Caja con scroll
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255), 
            borderRadius: BorderRadius.circular(8), 
          ),
          height: 250, 
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding
          child: Scrollbar(
            thumbVisibility: true, 
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              child: Text(
                consentText(),
                style: TextStyle(
                  fontFamily: widget.fontFamily,
                  fontWeight: FontWeight.w500,  
                  fontSize: 16,
                  color: Colors.black87, 
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Casillas de verificación de Términos y Condiciones y Política de Privacidad
        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Checkbox(
              value: termsAccepted,
              checkColor: Colors.white,
              activeColor: const Color(0xFF2979FF), 
              onChanged: consentAccepted
                  ? null 
                  : (bool? value) {
                      setState(() {
                        termsAccepted = value ?? false;
                      });
                  },
            ),
            GestureDetector(
              onTap: () {
                if (!consentAccepted) {
                  setState(() {
                    termsAccepted = !termsAccepted;
                  });
                }
              },
              child: Text(
                "I accept the Terms and Conditions",
                style: TextStyle(
                  fontFamily: widget.fontFamily,
                  fontSize: 16,
                  color: termsAccepted ? Colors.black : Colors.grey, 
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Checkbox(
              value: privacyPolicyAccepted,
              checkColor: Colors.white,
              activeColor: const Color(0xFF2979FF), 
              onChanged: consentAccepted
                  ? null 
                  : (bool? value) {
                      setState(() {
                        privacyPolicyAccepted = value ?? false;
                      });
                  },
            ),
            GestureDetector(
              onTap: () {
                if (!consentAccepted) {
                  setState(() {
                    privacyPolicyAccepted = !privacyPolicyAccepted;
                  });
                }
              },
              child: Text(
                "I accept the Privacy Policy",
                style: TextStyle(
                  fontFamily: widget.fontFamily,
                  fontSize: 16,
                  color: privacyPolicyAccepted ? Colors.black : Colors.grey, 
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        if (!consentAccepted)
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              ElevatedButton(
                onPressed: termsAccepted && privacyPolicyAccepted
                    ? () {
                        setState(() {
                          consentAccepted = true;
                        });
                      }
                    : null, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2979FF), 
                  foregroundColor: Colors.white, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  "Accept",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16), 
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    consentAccepted = false;
                    termsAccepted = false;
                    privacyPolicyAccepted = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, 
                  foregroundColor: Colors.white, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), 
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  "Decline",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

        
        if (consentAccepted)
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Consent accepted",
              style: TextStyle(
                fontSize: 16,
                color:  Color(0xFF2979FF), 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  String consentText() {
    return """
      1. Agreement: By using the Temporaly app, you agree to our Privacy Policy and the way we process your data as outlined. This includes the collection, storage, and use of personal information necessary for providing the app's services.
      
      2. Opt-in for Notifications: Users can opt in to receive notifications about app updates, features, and relevant information. You have the choice to enable or disable these notifications within your app settings.
      
      3. Revoking Consent: If you change your mind at any time, you have the right to withdraw your consent. You can do so by contacting us or changing your settings within the app.
      
      4. Contact Information: For any questions or concerns regarding your data, please contact us.
    """;
  }
}
