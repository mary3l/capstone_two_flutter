import 'package:audio_classification/screens/startRecording.dart';
import 'package:audio_classification/services/service_methods.dart';
import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:audio_classification/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/widgets/game_card.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';

class Dashboard extends StatefulWidget {
  final int? selectedSeasonID;
  final int? startYear;
  final int? endYear;

  const Dashboard(
      {Key? key, this.selectedSeasonID, this.startYear, this.endYear})
      : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Declare a list of games and teams
  List<Game> _games = [];
  List<Team> _teams = [];
  final serviceMethod = ServiceMethod();

  @override
  void initState() {
    super.initState();
    _fetchGames();
  }

  // Fetch games based on selected seasonID
  Future<void> _fetchGames() async {
    if (widget.selectedSeasonID != null) {
      try {
        final games =
            await serviceMethod.fetchGamesBySeasonID(widget.selectedSeasonID!);
        setState(() {
          _games = games; // Update the _games list with the fetched games
        });
      } catch (e) {
        print("Error fetching games: $e");
      }
    }
  }

  // Function to show a dialog to add a new game
  void _showAddGameDialog(BuildContext context) async {
    // Fetch teams before showing the dialog
    List<Team> teams = await serviceMethod.fetchTeams();

    if (teams.isEmpty) {
      // Handle empty teams, if necessary
      print('No teams available');
    }

    setState(() {
      _teams = teams; // Update the _teams list after fetching
    });

    final TextEditingController _gameTitleController = TextEditingController();
    final TextEditingController _opponentNameController =
        TextEditingController();
    final TextEditingController _dateController = TextEditingController();
    final TextEditingController _semesterController = TextEditingController();
    final TextEditingController _seasonIDController = TextEditingController();
    final TextEditingController _teamIDController = TextEditingController();

    DateTime? selectedDate;
    String? selectedSemester;
    String? selectedTeam;
    _seasonIDController.text = widget.selectedSeasonID.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Add New Game',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.lightOrange,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Selected Season ID: ${widget.selectedSeasonID}'), // Display selected season ID
                // Input fields for the game title, date, semester, season ID, and team ID
                TextField(
                  controller: _gameTitleController,
                  decoration: InputDecoration(
                    labelText: 'Game Title',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                  ),
                ),
                TextField(
                  controller: _opponentNameController,
                  decoration: InputDecoration(
                    labelText: 'Opponent Team Name',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                  ),
                ),
                TextField(
                  readOnly: true,
                  onTap: () async {
                    // Show date picker when the date field is tapped
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                        _dateController.text =
                            "${picked.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                  ),
                ),
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
                      selectedSemester = newValue;
                      _semesterController.text = newValue ?? "";
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Semester',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: selectedTeam,
                  hint: Text('Select Team'),
                  items: _teams.map((Team team) {
                    return DropdownMenuItem<String>(
                      value: team.id.toString(),
                      child: Text(team.name ?? "No Team Name"),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTeam = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Team',
                    labelStyle: TextStyle(color: AppColors.lightOrange),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: TextStyle(color: AppColors.lightOrange)),
            ),
            TextButton(
              onPressed: () async {
                // Get the values entered in the dialog fields
                String gameTitle = _gameTitleController.text.trim();
                String opponentName = _opponentNameController.text.trim();
                String dateText = _dateController.text.trim();
                int seasonID = widget.selectedSeasonID ?? 0;
                int teamID = int.tryParse(selectedTeam ?? "0") ??
                    0; // Pass the selected team ID

                // Validate that all required fields are filled
                if (gameTitle.isNotEmpty &&
                    dateText.isNotEmpty &&
                    opponentName.isNotEmpty &&
                    selectedSemester != null &&
                    seasonID != 0 &&
                    teamID != 0) {
                  try {
                    DateTime date = DateTime.parse(dateText);

                    // Create a new game by calling the service method
                    await serviceMethod.createGame(seasonID, gameTitle, date,
                        selectedSemester!, teamID, opponentName);

                    // Clear the text controllers after the game is added
                    _gameTitleController.clear();
                    _dateController.clear();
                    _semesterController.clear();
                    _seasonIDController.clear();
                    _teamIDController.clear();
                    _opponentNameController.clear();

                    Navigator.pop(context); // Close the dialog

                    // Print the arguments to check before passing them to the next screen
                    print(
                        "Navigating to StartRecording screen with arguments:");
                    print('Game Title: $gameTitle');
                    print('Opponent Name: $opponentName');
                    print('Date: $date');
                    print('Semester: $selectedSemester');
                    print('Team ID: $teamID');
                    print('Season ID: $seasonID');
                    print('Start Year: ${widget.startYear}');
                    print('End Year: ${widget.endYear}');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartRecording(
                          gameTitle: gameTitle,
                          date: date,
                          opponentName: opponentName,
                          semester: selectedSemester ?? "No selected semester",
                          teamID: teamID,
                          seasonID: seasonID,
                          startYear: widget.startYear ?? 0, // Pass start year
                          endYear: widget.endYear ?? 0, // Pass end year
                        ),
                      ),
                    );
                  } catch (e) {
                    print("Error adding game: $e");
                  }
                } else {
                  print("Validation failed: Please fill all the fields.");
                }
              },
              child:
                  Text('Add', style: TextStyle(color: AppColors.lightOrange)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GeneralScreenPadding(
        child: SingleChildScrollView(
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
                    'Season Year: ${widget.startYear ?? "N/A"} - ${widget.endYear ?? "N/A"}',
                alignment: LabelAlignment.header,
              ),
              SizedBox(height: 20),

              Center(
                child: GestureDetector(
                  onTap: () {
                    _showAddGameDialog(context); // Show the dialog
                  },
                  child: Button(
                    icon: Icon(Icons.mic, color: Colors.white),
                    text: 'Start Recording',
                    onPress: () {
                      // Show dialog to add a new game when this button is pressed
                      _showAddGameDialog(context);
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),

              const Header(
                title: "Games History",
                alignment: HeaderAlignment.sectionTitle,
                textType: TextType.section,
              ),
              SizedBox(height: 10),

              // Use ListView.builder to display the games dynamically
              ListView.builder(
                shrinkWrap:
                    true, // Allow ListView to take up only the required space
                physics:
                    NeverScrollableScrollPhysics(), // Disable scrolling here
                itemCount: _games.length, // Number of games to display
                itemBuilder: (context, index) {
                  final game = _games[index];
                  return Column(
                    children: [
                      GameCard(
                        game:
                            game, // Pass the current game to the GameCard widget
                        onPress: () {
                          // Navigate to the team statistics screen when the game card is pressed
                          Navigator.pushNamed(
                            context,
                            '/screens/teamStatistics',
                            arguments: game,
                          );
                        },
                      ),
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
