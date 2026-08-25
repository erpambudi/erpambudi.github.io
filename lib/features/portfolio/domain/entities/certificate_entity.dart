class CertificateEntity {
  final String id;
  final String title;
  final String issuer;
  final String credentialId;
  final String verificationUrl;
  final String imagePath;
  final String year;

  const CertificateEntity({
    required this.id,
    required this.title,
    required this.issuer,
    required this.credentialId,
    required this.verificationUrl,
    required this.imagePath,
    required this.year,
  });
}
