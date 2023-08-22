// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizQuestion {
  final String questionText;
  final List<String> answers;
  const QuizQuestion(
    this.questionText,
    this.answers,
  );

  List<String> getShuffled() {
    final schuffledList = List<String>.of(answers);
    schuffledList.shuffle();
    return schuffledList;
  }
}
