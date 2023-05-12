String s = "Person A: Good morning! How are you doing today?  Person B: Good morning! I'm doing pretty well, thank you for asking. How about you?  Person A: I'm doing well too, thanks. What are your plans for the day?  Person B: I have a meeting with my boss in the morning, but other than that, I don't have any plans. How about you?  Person A: I'm going to the gym and then meeting up with some friends for lunch.  Person B: That sounds like a nice day. What gym do you go to?  Person A: I go to the one on Main Street. It's a great gym with a lot of equipment and classes.  Person B: That's awesome. I've been meaning to start going to the gym more often. Do you have any tips for someone who's just starting out?  Person A: Sure! I would recommend starting slow and not overdoing it. It's important to listen to your body and not push yourself too hard at first. Also, find a workout routine that you enjoy, so you're more likely to stick with it.  Person B: That's great advice, thank you. I'll definitely keep that in mind.  Person A: No problem! Well, it was nice talking to you. Have a great day!  Person B: You too! Take care.";

String clearScript(String s) {
  // print(s);
  String result = "";
  final re = RegExp(r'Person');
  List<String> sentences = s.split(re);
  for (var sentence in sentences) {
    result = result + sentence + "\n";
  }
  return result;
}