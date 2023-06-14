import 'package:mobile_front_end/models/exam/TestQuestion.dart';

class TestComponent {
  TestComponent({
    required this.id,
    required this.requirement,
    required this.questions,
  });
  final int id;
  final String requirement;
  final List<TestQuestion> questions;
}
