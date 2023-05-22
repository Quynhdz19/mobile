
class ChoiceWork {
  ChoiceWork({
    required this.id,
    required this.question,
    required this.answer_id,
    required this.options,
  });

  final int id;
  final int answer_id;
  final List<String> question;
  final List<String> options;
}
