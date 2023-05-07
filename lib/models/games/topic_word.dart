class TopicWords {
  TopicWords({
    required this.id,
    required this.img,
    required this.vocab,
    required this.type,
    required this.pronoun,
    required this.meaning,
  });

  final String id;
  final String img;
  final String vocab;
  final String type;
  final String pronoun;
  final String meaning;

  static TopicWords fromJson(Map<String, dynamic> topicwords) => TopicWords(
    id: topicwords["id"],
    img: topicwords["img"],
    vocab: topicwords["vocab"],
    type: topicwords["type"],
    pronoun: topicwords["pronoun"],
    meaning: topicwords["meaning"],
  );
}