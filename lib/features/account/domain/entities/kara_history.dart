class KaraHistory {
  const KaraHistory({
    required this.id,
    required this.type,
    required this.message,
    required this.montant,
    required this.isIncome,
    required this.date,
  });

  const KaraHistory.empty({
    this.id = -1,
    this.type = '',
    this.message = '',
    this.montant = '',
    this.isIncome = false,
    this.date = '',
  });

  final int id;
  final String type;
  final String message;
  final String montant;
  final bool isIncome;
  final String date;
}
