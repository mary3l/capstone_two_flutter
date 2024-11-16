import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/services/database_helper.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:audio_classification/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/recording_button.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Import GameCard widget
import 'package:audio_classification/models/test_basketball_model.dart'; // Import Team and Game model

class Dashboard extends StatefulWidget {
  // Constructor requires startYear and endYear to be passed
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int? startYear;
  int? endYear;
  // Sample Game and Team Data
  final List<Game> games = [
    Game(
      gameID: 1,
      gameTitle: 'Championship Game',
      date: DateTime.now(),
      teamID: 1,
    ),
    Game(
      gameID: 2,
      gameTitle: 'Friendly Match',
      date: DateTime.now(),
      teamID: 2,
    ),
    Game(
      gameID: 3,
      gameTitle: 'Season Opener',
      date: DateTime.now(),
      teamID: 3,
    ),
  ];

  final List<Team> teams = [
    Team(teamID: 1, teamName: 'Team A'),
    Team(teamID: 2, teamName: 'Team B'),
    Team(teamID: 3, teamName: 'Team C')
  ];

  //to capture user input, access it easily, and manage it
  // final TextEditingController _gameTitleController = TextEditingController();
  // final TextEditingController _dateController = TextEditingController();
  // final TextEditingController _semesterController = TextEditingController();
  // final TextEditingController _teamIDController = TextEditingController();
  // Instance of DatabaseHelper to interact with the database
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  // List to store the game objects fetched from the database
  List<Game> _games = [];

  @override
  void initState() {
    super.initState(); // Call the parent class's initState
    _fetchGames(); // Fetch the games from the database when the state is initialized
  }

  // Asynchronous function to fetch games from the database
  Future<void> _fetchGames() async {
    try {
      // Call the getgames method to retrieve the list of games
      List<Game> games = await _databaseHelper.getGames();

      // Print each season's details
      for (var game in games) {
        game.printDetails();
      }

      // Update the state with the fetched games
      setState(() {
        _games = games; // Assign the fetched games to the _games list
      });
    } catch (e) {
      // Print any error that occurs during the fetching process
      print("Error fetching games: $e");
    }
  }

  void _showAddGameDialog() {
    final TextEditingController _gameTitleController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();
    final TextEditingController _semesterController = TextEditingController();
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
                      setState(() {
                        selectedDate = picked; // Update the selected date
                        _dateController.text = "${picked.toLocal()}"
                            .split(' ')[0]; // Set the date in the TextField
                      });
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
                    setState(() {
                      selectedSemester =
                          newValue; // Update the selected semester
                      _semesterController.text =
                          newValue ?? ""; // Set the semester in the TextField
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Semester',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightOrange),
                    ),
                  ),
                ),
                // Uncomment the following to include Team ID field
                // TextField(
                //   controller: _teamIDController,
                //   decoration: InputDecoration(
                //     labelText: 'Team ID',
                //     labelStyle: TextStyle(color: AppColors.lightOrange),
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: AppColors.lightOrange),
                //     ),
                //   ),
                //   keyboardType: TextInputType.number,
                // ),
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
                // int teamID = int.tryParse(_teamIDController.text.trim()) ?? 0;

                if (gameTitle.isNotEmpty &&
                    dateText.isNotEmpty &&
                    selectedSemester != null) {
                  try {
                    // Parse the dateText as a DateTime object
                    DateTime date =
                        DateTime.parse(dateText); // Ensure valid date

                    // Create Game object without gameID
                    Game newGame = Game(
                      gameTitle: gameTitle,
                      date: date, // Use the selected date
                      semester: selectedSemester, // Use the selected semester
                      // teamID: teamID,
                    );

                    // Insert game into database
                    await _databaseHelper.insertGame(newGame);

                    // Clear controllers after successful addition
                    _gameTitleController.clear();
                    _dateController.clear();
                    _semesterController.clear();
                    // _teamIDController.clear();

                    // Close dialog
                    Navigator.pop(context);

                    // Fetch and update games list if necessary
                    _fetchGames();

                    // Once data has been succesfully inputted
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

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    int? startYear = args?['startYear'];
    int? endYear = args?['endYear'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GeneralScreenPadding(
        child: SingleChildScrollView(
          // Wrap the Column in a SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Header(
                title: "DASHBOARD",
                alignment: HeaderAlignment.header,
                textType: TextType.header,
              ),
              Label(
                text:
                    'Season Year: ${startYear ?? "N/A"} - ${endYear ?? "N/A"}',
                alignment: LabelAlignment.header,
              ),
              SizedBox(height: 20), // Space below the header

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/screens/startRecording');
                  },
                  child: Button(
                    icon: Icon(Icons.mic, color: Colors.white),
                    text: 'Start Recording',
                    onPress: _showAddGameDialog,
                    // () {
                    //   Navigator.pushNamed(context, '/screens/startRecording');
                    // },
                  ),
                ),
              ),
              SizedBox(height: 30), // Space below the RecordingButton

              const Header(
                title: "Games History",
                alignment: HeaderAlignment.sectionTitle,
                textType: TextType.section,
              ),
              SizedBox(height: 10), // Space below the Games History header

              // Use ListView.builder for dynamic rendering of games
              ListView.builder(
                shrinkWrap:
                    true, // Allows ListView to work inside SingleChildScrollView
                physics: NeverScrollableScrollPhysics(),
                itemCount: _games.length, // Use _games instead of games
                itemBuilder: (context, index) {
                  final game = _games[index];
                  return Column(
                    children: [
                      GameCard(
                        game: game,
                        listTeams: teams, // Pass teams list as needed
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            '/screens/teamStatistics',
                            arguments: game,
                          );
                        },
                      ),
                      SizedBox(height: 5),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
