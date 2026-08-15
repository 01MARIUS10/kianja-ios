class SignalerContenuParams {
  const SignalerContenuParams({
    required this.contenuId,
    required this.type,
    required this.motifId,
    this.commentaire,
  });

  final int contenuId;
  final String type;
  final int motifId;
  final String? commentaire;
}
