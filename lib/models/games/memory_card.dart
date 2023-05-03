class MemoryCard {
  MemoryCard({
    required this.id,
    required this.url,
    required this.word,
    required this.displayText,
  });

  final int id;
  final String url;
  final String word;
  bool displayText;

  static MemoryCard fromJson(Map<String, dynamic> card) => MemoryCard(
    id: card["id"],
    url: card["url"],
    word: card["word"],
    displayText: false
  );
}
