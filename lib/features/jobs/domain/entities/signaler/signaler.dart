import 'package:kianja/features/jobs/domain/entities/motif/motif.dart';

class Signaler {
  const Signaler({
    required this.id,
    required this.type,
    required this.contenuId,
    required this.motif,
    this.commentaire,
    required this.createdAt,
  });

  const Signaler.empty({
    this.id = -1,
    this.type = '',
    this.contenuId = -1,
    this.motif = const Motif.empty(),
    this.commentaire,
    this.createdAt = '',
  });

  final int id;
  final String type;
  final int contenuId;
  final Motif motif;
  final String? commentaire;
  final String createdAt;
}
