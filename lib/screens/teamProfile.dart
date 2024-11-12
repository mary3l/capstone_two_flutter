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
  List<Player> _players = [];

// Track selected player IDs
  List<int> _selectedPlayerIDs = [];

  @override
  void initState() {
    super.initState(); // Call the parent class's initState
    _fetchTeams(); // Fetch the teams from the database when the state is initialized
    _fetchPlayers(); // Fetch the players from the database when the state is initialized
  }

  Future<void> _fetchPlayers() async {
    try {
      // Call the getgames method to retrieve the list of games
      List<Player> players = await _databaseHelper.getPlayers();

      // Print each season's details
      for (var player in players) {
        player.printDetails();
      }

      // Update the state with the fetched players
      setState(() {
        _players = players; // Assign the fetched games to the _games list
      });
    } catch (e) {
      // Print any error that occurs during the fetching process
      print("Error fetching games: $e");
    }
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
          content: SingleChildScrollView(
            child: Column(
              children: [
                // Team Name Input
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _teamNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter team name',
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
                ),
                // Player Selection
                Text(
                  'Select Players',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Displaying the player selection checkboxes
                _players.isEmpty
                    ? Text(
                        'No players available') // Show loading while fetching players
                    : Column(
                        children: _players.map((player) {
                          return CheckboxListTile(
                            title:
                                Text('${player.firstName} ${player.lastName}'),
                            value: _selectedPlayerIDs.contains(player.playerID),
                            onChanged: (bool? selected) {
                              setState(() {
                                if (selected == true) {
                                  _selectedPlayerIDs.add(player.playerID);
                                } else {
                                  _selectedPlayerIDs.remove(player.playerID);
                                }
                              });
                            },
                          );
                        }).toList(),
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
