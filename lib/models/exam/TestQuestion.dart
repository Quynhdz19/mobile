class TestQuestion {
  TestQuestion({
    required this.id,
    required this.question,
    required this.status,
    required this.selected_id,
    required this.answer_id,
    required this.options,
  });
  final int id;
  int status, selected_id;
  final int answer_id;
  final String question;
  final List<String> options;
}
