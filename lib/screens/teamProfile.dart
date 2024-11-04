import 'package:audio_classification/services/database_helper.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

import 'package:audio_classification/models/test_basketball_model.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/game_card.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/widgets/filterButton.dart';

class TeamProfile extends StatefulWidget {
  @override
  _TeamProfileState createState() => _TeamProfileState();
}

class _TeamProfileState extends State<TeamProfile> {
  //to capture user input, access it easily, and manage it
  final TextEditingController _teamNameController = TextEditingController();
  // Instance of DatabaseHelper to interact with the database
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  // List to store the team objects fetched from the database
  List<Team> _teams = [];

  @override
  void initState() {
    super.initState(); // Call the parent class's initState
    _fetchTeams(); // Fetch the teams from the database when the state is initialized
  }

  // Asynchronous function to fetch teams from the database
  Future<void> _fetchTeams() async {
    try {
      // Call the getTeams method to retrieve the list of teams
      List<Team> teams = await _databaseHelper.getTeams();

      // Update the state with the fetched teams
      setState(() {
        _teams = teams; // Assign the fetched teams to the _teams list
      });
    } catch (e) {
      // Print any error that occurs during the fetching process
      print("Error fetching teams: $e");
    }
  }

// for showing a form when user clicks "add new team" button
  void _showAddTeamDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          title: Text(
            'Add New Team',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.lightOrange, // Adjust color to fit your theme
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10), // Add vertical padding
            child: TextField(
              controller: _teamNameController,
              decoration: InputDecoration(
                hintText: 'Enter team name',
                hintStyle:
                    TextStyle(color: Colors.grey[600]), // Hint text color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Rounded borders for the text field
                  borderSide:
                      BorderSide(color: AppColors.lightOrange), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors.lightOrange), // Focused border color
                ),
              ),
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
                  color: AppColors.lightOrange, // Button color
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                String teamName = _teamNameController.text.trim();

                if (teamName.isNotEmpty) {
                  // Create Team object without teamID
                  Team newTeam = Team(teamName: teamName);

                  // Insert team into database
                  await _databaseHelper.insertTeam(newTeam);

                  // Clear controllers and close dialog
                  _teamNameController.clear();
                  Navigator.pop(context);
                  _fetchTeams();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GeneralScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main header for team profile
            Header(
              title: 'TEAM PROFILE',
              alignment: HeaderAlignment.header,
              textType: TextType.header,
            ),
            SizedBox(height: 12),
            Button(
              text: 'Add New Team',
              onPress: _showAddTeamDialog, // Show dialog on press
            ),

            // Subheader for filter section
            Header(
              title: 'Filter:',
              alignment: HeaderAlignment.sectionTitle,
              textType: TextType.section,
            ),
            SizedBox(height: 10),

            // Filter buttons
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                filterButton(title: 'School Year'),
                filterButton(title: 'First Semester'),
                filterButton(title: 'Game Name'),
              ],
            ),
            SizedBox(height: 20),

            // List of teams
            Expanded(
              // Use Expanded to allow the ListView to fill available space
              child: ListView.builder(
                itemCount: _teams.length, // Use _teams list here
                itemBuilder: (context, index) {
                  final team = _teams[index]; // Fetch from _teams list

                  return Column(
                    children: [
                      GameCard(
                        team: team,
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            '/screens/teamPlayerProfile',
                            arguments: team,
                          );
                        },
                      ),
                      SizedBox(height: 5),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
