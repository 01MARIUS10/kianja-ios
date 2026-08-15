class Motif {
  const Motif({required this.id, required this.libelle});
  const Motif.empty({this.id = -1, this.libelle = ''});

  final int id;
  final String libelle;
}
