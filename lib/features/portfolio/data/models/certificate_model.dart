import 'package:mobile_template/features/portfolio/domain/entities/certificate_entity.dart';

class CertificateModel extends CertificateEntity {
  const CertificateModel({
    required super.id,
    required super.title,
    required super.issuer,
    required super.credentialId,
    required super.verificationUrl,
    required super.imagePath,
    required super.year,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      issuer: json['issuer'] as String? ?? '',
      credentialId: json['credentialId'] as String? ?? '',
      verificationUrl: json['verificationUrl'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      year: json['year'] as String? ?? '',
    );
  }
}
