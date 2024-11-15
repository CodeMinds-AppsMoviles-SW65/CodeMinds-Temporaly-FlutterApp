class TermsConsent {
  final String id; // Identificador único
  final bool accepted; // Si se aceptaron los términos
  final DateTime acceptedDate; // Fecha de aceptación

  TermsConsent({
    required this.id,
    required this.accepted,
    required this.acceptedDate,
  });
}
