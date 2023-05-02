class MemoryCard {
  MemoryCard({
    required this.id,
    required this.url,
    required this.word
  });

  final int id;
  final String url;
  final String word;

  static MemoryCard fromJson(Map<String, dynamic> card) => MemoryCard(
    id: card["id"],
    url: card["url"],
    word: card["word"]
  );
}
