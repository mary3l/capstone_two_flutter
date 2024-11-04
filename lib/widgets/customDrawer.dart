import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/models/test_basketball_model.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final TextEditingController _gameTitleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  // You might also want to declare your database helper here
  // final DatabaseHelper _databaseHelper = DatabaseHelper(); // Assuming you have a database helper

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black, // Set drawer background color
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Optionally add a Drawer Header with a logo or title
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.darkOrange, // Header background color
            ),
            child: Center(
              child: Text(
                'BASKETBALL VOICE RECOGNITION APP', // Change this to your app's title or logo
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jersey10',
                ),
              ),
            ),
          ),
          // ListTile for adding a new game
          ListTile(
            leading:
                Icon(Icons.mic, color: AppColors.white), // Icon for Add Game
            title: Text(
              'Start Recording',
              style: TextStyle(color: AppColors.white), // Text color
            ),
            onTap: () {
              _showAddGameDialog(context);
            },
          ),
          // ListTile for Start Recording
          // ListTile(
          //   leading: Icon(Icons.mic,
          //       color: AppColors.white), // Icon for Start Recording
          //   title: Text(
          //     'Start Recording',
          //     style: TextStyle(color: AppColors.white), // Text color
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/screens/startRecording');
          //   },
          // ),
          // ListTile for Dashboard
          ListTile(
            leading: Icon(Icons.dashboard,
                color: AppColors.white), // Icon for Dashboard
            title: Text(
              'Dashboard',
              style: TextStyle(color: AppColors.white), // Text color
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/screens/dashboard');
            },
          ),
          // ListTile for Team Profile
          ListTile(
            leading: Icon(Icons.group,
                color: AppColors.white), // Icon for Team Profile
            title: Text(
              'Team Profile',
              style: TextStyle(color: AppColors.white), // Text color
            ),
            onTap: () {
              Navigator.pushNamed(context, '/screens/teamProfile');
            },
          ),
        ],
      ),
    );
  }

  void _showAddGameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime? selectedDate; // Variable to store the selected date
        String? selectedSemester; // Variable to store the selected semester

        return AlertDialog(
          title: Text(
            'Add New Game',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.lightOrange, // Match color styling
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _gameTitleController,
                  decoration: InputDecoration(
                    labelText: 'Game Title',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightOrange),
                    ),
                  ),
                ),
                // Button to pick a date from a calendar
                TextField(
                  readOnly: true, // Prevent manual input
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != selectedDate) {
                      selectedDate = picked; // Update the selected date
                      _dateController.text = "${picked.toLocal()}"
                          .split(' ')[0]; // Set the date in the TextField
                    }
                  },
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightOrange),
                    ),
                  ),
                ),
                // Dropdown for selecting semester
                DropdownButtonFormField<String>(
                  value: selectedSemester,
                  hint: Text('Select Semester'),
                  items: <String>['First', 'Second'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    selectedSemester = newValue; // Update the selected semester
                    _semesterController.text =
                        newValue ?? ""; // Set the semester in the TextField
                  },
                  decoration: InputDecoration(
                    labelText: 'Semester',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightOrange),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close dialog without clearing controllers
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.lightOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                String gameTitle = _gameTitleController.text.trim();
                String dateText = _dateController.text.trim();

                if (gameTitle.isNotEmpty &&
                    dateText.isNotEmpty &&
                    selectedSemester != null) {
                  try {
                    DateTime date =
                        DateTime.parse(dateText); // Ensure valid date

                    // Create Game object (assuming you have a Game class)
                    Game newGame = Game(
                      gameTitle: gameTitle,
                      date: date, // Use the selected date
                      semester: selectedSemester, // Use the selected semester
                    );

                    // Insert game into database (assuming you have a database helper)
                    // await _databaseHelper.insertGame(newGame);

                    // Clear controllers after successful addition
                    _gameTitleController.clear();
                    _dateController.clear();
                    _semesterController.clear();

                    // Close dialog
                    Navigator.pop(context);

                    // Fetch and update games list if necessary
                    // _fetchGames();

                    // Navigate to the start recording screen with arguments
                    Navigator.pushNamed(
                      context,
                      '/screens/startRecording',
                      arguments: {
                        'gameTitle': gameTitle,
                        'date': date,
                        'semester': selectedSemester,
                      },
                    );
                  } catch (e) {
                    print("Error adding game: $e");
                  }
                }
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: AppColors.lightOrange, // Button color
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
