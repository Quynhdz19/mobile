class Quiz {
  Quiz({
    required this.id,
    required this.requirement,
    required this.question,
    required this.answer_id,
    required this.options,
  });

  final int id, answer_id;
  final String requirement;
  final String question;
  final List<String> options;
}
