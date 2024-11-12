import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/models/test_basketball_model.dart';
import 'package:audio_classification/services/database_helper.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    // Instance of DatabaseHelper to interact with the database
    final DatabaseHelper _databaseHelper = DatabaseHelper();
    List<Season> _seasons = [];
    List<Game> _games = [];

    @override
    void initState() {
      super.initState(); // Call the parent class's initState

      // _fetchSeasons(); // Fetch the season from the database when the state is initialized
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

    Future<void> _fetchSeasons() async {
      try {
        // Call the getSeasons method to retrieve the list of seasons
        List<Season> seasons = await _databaseHelper.getSeasons();

        // Print each season's details
        for (var season in seasons) {
          season.printDetails();
        }

        // Update the state with the fetched seasons
        setState(() {
          _seasons = seasons; // Assign the fetched seasons to the _seasons list
        });
      } catch (e) {
        // Print any error that occurs during the fetching process
        print("Error fetching seasons: $e");
      }
    }

    // for add new season button
    void _showAddSeasonDialog(BuildContext context) async {
      final TextEditingController startYearController = TextEditingController();
      final TextEditingController endYearController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add New Season'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: startYearController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Start Year'),
                ),
                TextField(
                  controller: endYearController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'End Year'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  int startYear = int.tryParse(startYearController.text) ?? 0;
                  int endYear = int.tryParse(endYearController.text) ?? 0;

                  if (startYear > 0 && endYear > 0 && endYear >= startYear) {
                    Season newSeason = Season(
                      startYear: startYear,
                      endYear: endYear,
                    );

                    int seasonID =
                        await _databaseHelper.insertSeason(newSeason);
                    if (seasonID > 0) {
                      print("Season added with ID: $seasonID");
                      // Optionally, show a success message
                    } else {
                      print("Failed to add season");
                    }

                    Navigator.of(context).pop(); // Close the dialog
                  } else {
                    print('Please enter valid years');
                  }
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    }

    void _showAddGameDialog(BuildContext context) {
      //to capture user input, access it easily, and manage it
      final TextEditingController _gameTitleController =
          TextEditingController();
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

    void _showCreatePlayerDialog(BuildContext context) {
      final TextEditingController _firstNameController =
          TextEditingController();
      final TextEditingController _lastNameController = TextEditingController();
      final TextEditingController _middleNameController =
          TextEditingController();
      final TextEditingController _jerseyNumberController =
          TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            title: Text(
              'Create New Player',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.lightOrange, // Adjust color to fit your theme
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter first name',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.lightOrange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.lightOrange),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter last name',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.lightOrange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.lightOrange),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _middleNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter middle name',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.lightOrange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.lightOrange),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _jerseyNumberController,
                    decoration: InputDecoration(
                      hintText: 'Enter jersey number',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.lightOrange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.lightOrange),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
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
                  String firstName = _firstNameController.text.trim();
                  String lastName = _lastNameController.text.trim();
                  String middleName = _middleNameController.text.trim();
                  int? jerseyNumber =
                      int.tryParse(_jerseyNumberController.text.trim());

                  if (firstName.isNotEmpty &&
                      lastName.isNotEmpty &&
                      jerseyNumber != null) {
                    try {
                      Player newPlayer = Player(
                        playerID:
                            0, // We don't have playerID yet, it will be auto-generated
                        lastName: lastName,
                        firstName: firstName,
                        middleName: middleName,
                        jerseyNumber: jerseyNumber,
                        teamID: null, // TeamID will be assigned later
                      );

                      // Insert the player into the database
                      await _databaseHelper.insertPlayers(newPlayer);

                      // Clear text controllers and close the dialog
                      _firstNameController.clear();
                      _lastNameController.clear();
                      _middleNameController.clear();
                      _jerseyNumberController.clear();

                      Navigator.pop(context);
                    } catch (e) {
                      print("Error adding player: $e");
                    }
                    // Create a Player object without teamID (teamID can be assigned later)
                  }
                },
                child: Text(
                  'Add Player',
                  style: TextStyle(
                    color: AppColors.lightOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

// block for custom drawer
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
          Divider(),
          // ListTile for Add New Season
          ListTile(
            leading: Icon(Icons.new_label,
                color: AppColors.white), // Icon for Team Profile
            title: Text(
              'Add New Season',
              style: TextStyle(color: AppColors.white), // Text color
            ),
            onTap: () {
              _showAddSeasonDialog(context);
            },
          ),
          //Add New Player
          ListTile(
            leading: Icon(Icons.group,
                color: AppColors.white), // Icon for Team Profile
            title: Text(
              'Add New Player',
              style: TextStyle(color: AppColors.white), // Text color
            ),
            onTap: () => _showCreatePlayerDialog(context),
          ),
        ],
      ),
    );
  }
}
