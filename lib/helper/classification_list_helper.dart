// KeywordList.dart

class KeywordList {
  // Define the keyword combinations as a list of lists
  final List<List<String>> _keywordCombinations = [
    ["Player", "One", "Made", "3", "5"],
    ["Player", "One", "Made", "3"],
    ["Player", "One", "Made", "1"],
    ["Player", "Two", "Made", "3"],
    ["Player", "Two", "Made", "2"],
    ["Player", "Two", "Made", "1"],
  ];

  // Method to check if a given array matches any keyword combination
  bool matches(List<String> dynamicArray) {
    return _keywordCombinations
        .any((combination) => _listsEqual(combination, dynamicArray));
  }

  // Helper method to compare two lists for equality
  bool _listsEqual(List<String> list1, List<String> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }
}
