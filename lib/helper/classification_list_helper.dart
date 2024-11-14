// KeywordList.dart

class KeywordList {
  // Define the keyword combinations as a list of lists
  final List<List<String>> _keywordCombinations = [
    // Player One
    ["Player One", "Miss"],
    ["Player One", "Made", "1"],
    ["Player One", "Made", "2"],
    ["Player One", "Made", "3"],
    ["Player One", "Rebound", "Offensive"],
    ["Player One", "Rebound", "Defense"],
    ["Player One", "Foul"],
    ["Player One", "Turnover"],
    ["Player One", "Assist"],
    ["Player One", "Steal"],
    ["Player One", "Block"],

    // Player Two
    ["Player Two", "Miss"],
    ["Player Two", "Made", "1"],
    ["Player Two", "Made", "2"],
    ["Player Two", "Made", "3"],
    ["Player Two", "Rebound", "Offensive"],
    ["Player Two", "Rebound", "Defense"],
    ["Player Two", "Foul"],
    ["Player Two", "Turnover"],
    ["Player Two", "Assist"],
    ["Player Two", "Steal"],
    ["Player Two", "Block"],

    // Player Three
    ["Player Three", "Miss"],
    ["Player Three", "Made", "1"],
    ["Player Three", "Made", "2"],
    ["Player Three", "Made", "3"],
    ["Player Three", "Rebound", "Offensive"],
    ["Player Three", "Rebound", "Defense"],
    ["Player Three", "Foul"],
    ["Player Three", "Turnover"],
    ["Player Three", "Assist"],
    ["Player Three", "Steal"],
    ["Player Three", "Block"],

    // Player Four
    ["Player Four", "Miss"],
    ["Player Four", "Made", "1"],
    ["Player Four", "Made", "2"],
    ["Player Four", "Made", "3"],
    ["Player Four", "Rebound", "Offensive"],
    ["Player Four", "Rebound", "Defense"],
    ["Player Four", "Foul"],
    ["Player Four", "Turnover"],
    ["Player Four", "Assist"],
    ["Player Four", "Steal"],
    ["Player Four", "Block"],

    // Player Five
    ["Player Five", "Miss"],
    ["Player Five", "Made", "1"],
    ["Player Five", "Made", "2"],
    ["Player Five", "Made", "3"],
    ["Player Five", "Rebound", "Offensive"],
    ["Player Five", "Rebound", "Defense"],
    ["Player Five", "Foul"],
    ["Player Five", "Turnover"],
    ["Player Five", "Assist"],
    ["Player Five", "Steal"],
    ["Player Five", "Block"],

    // Player Six
    ["Player Six", "Miss"],
    ["Player Six", "Made", "1"],
    ["Player Six", "Made", "2"],
    ["Player Six", "Made", "3"],
    ["Player Six", "Rebound", "Offensive"],
    ["Player Six", "Rebound", "Defense"],
    ["Player Six", "Foul"],
    ["Player Six", "Turnover"],
    ["Player Six", "Assist"],
    ["Player Six", "Steal"],
    ["Player Six", "Block"],

    // Player Seven
    ["Player Seven", "Miss"],
    ["Player Seven", "Made", "1"],
    ["Player Seven", "Made", "2"],
    ["Player Seven", "Made", "3"],
    ["Player Seven", "Rebound", "Offensive"],
    ["Player Seven", "Rebound", "Defense"],
    ["Player Seven", "Foul"],
    ["Player Seven", "Turnover"],
    ["Player Seven", "Assist"],
    ["Player Seven", "Steal"],
    ["Player Seven", "Block"],

    // Player Eight
    ["Player Eight", "Miss"],
    ["Player Eight", "Made", "1"],
    ["Player Eight", "Made", "2"],
    ["Player Eight", "Made", "3"],
    ["Player Eight", "Rebound", "Offensive"],
    ["Player Eight", "Rebound", "Defense"],
    ["Player Eight", "Foul"],
    ["Player Eight", "Turnover"],
    ["Player Eight", "Assist"],
    ["Player Eight", "Steal"],
    ["Player Eight", "Block"],

    // Player Nine
    ["Player Nine", "Miss"],
    ["Player Nine", "Made", "1"],
    ["Player Nine", "Made", "2"],
    ["Player Nine", "Made", "3"],
    ["Player Nine", "Rebound", "Offensive"],
    ["Player Nine", "Rebound", "Defense"],
    ["Player Nine", "Foul"],
    ["Player Nine", "Turnover"],
    ["Player Nine", "Assist"],
    ["Player Nine", "Steal"],
    ["Player Nine", "Block"],

    // Player Ten
    ["Player Ten", "Miss"],
    ["Player Ten", "Made", "1"],
    ["Player Ten", "Made", "2"],
    ["Player Ten", "Made", "3"],
    ["Player Ten", "Rebound", "Offensive"],
    ["Player Ten", "Rebound", "Defense"],
    ["Player Ten", "Foul"],
    ["Player Ten", "Turnover"],
    ["Player Ten", "Assist"],
    ["Player Ten", "Steal"],
    ["Player Ten", "Block"],
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
