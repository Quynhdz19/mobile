class Flashcard {
  final String imageUrl;
  final String vocab;
  final String type;
  final String pronoun;
  final String meaning;
  final bool displayText;

  Flashcard(
      {required this.imageUrl,
      required this.vocab,
      required this.type,
      required this.pronoun,
      required this.meaning,
      required this.displayText});
}
