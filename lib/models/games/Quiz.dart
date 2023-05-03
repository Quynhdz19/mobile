class Quiz {
  Quiz({
    required this.id,
    required this.question,
    required this.answer_id,
    required this.options,
  });

  final int id, answer_id;
  final String question;
  final List<String> options;

  static Quiz fromJson(Map<String, dynamic> quiz) => Quiz(
    id: quiz["id"],
        question: quiz["question"],
        answer_id: quiz["answer_id"],
        options: quiz["options"],
  );
}
