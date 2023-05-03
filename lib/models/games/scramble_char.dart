class ScrambleChar{
  ScrambleChar({
    required this.currentValue,
    required this.currentIndex,
    required this.correctValue,
    required this.hintShow,
    required this.isReload
  });
  String currentValue;
  int currentIndex;
  String correctValue;
  bool hintShow = false;
  bool isReload = false;

  getCurrentValue() {
    if (this.correctValue != '') {
      return this.currentValue;
    } else if (this.hintShow) {
      return this.correctValue;
    }
  }

  void clearValue() {
    this.currentIndex = -1;
    this.currentValue = '';
  }
}