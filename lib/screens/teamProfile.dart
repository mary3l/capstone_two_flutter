import 'package:audio_classification/services/database_helper.dart';
import 'package:audio_classification/services/service_methods.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/game_card.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/widgets/filterButton.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';
import 'package:audio_classification/services/service_methods.dart';

class TeamProfile extends StatefulWidget {
  @override
  _TeamProfileState createState() => _TeamProfileState();
}

class _TeamProfileState extends State<TeamProfile> {
  //to capture user input, access it easily, and manage it
  final TextEditingController _teamNameController = TextEditingController();

  final ServiceMethod _serviceMethod = ServiceMethod();
  List<Team> _teams = [];
  List<Player> _players = [];

// Track selected player IDs
  List<int> _selectedPlayerIDs = [];

  @override
  void initState() {
    super.initState(); // Call the parent class's initState
  }

  final serviceMethod = ServiceMethod();

// for showing a form when user clicks "add new team" button
  void _showAddTeamDialog() async {
    // Fetch players asynchronously before showing the dialog
    List<Player> players =
        await serviceMethod.fetchPlayers(); // Ensure players are fetched first

    if (players.isEmpty) {
      // Handle empty players, if necessary (e.g., show a message)
      print('No players available');
    }

    // After fetching, update the _players list
    setState(() {
      _players = players;
    });

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Add New Team',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.lightOrange,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
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
                Text(
                  'Select Players',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _players.isEmpty
                    ? Text(
                        'No players available') // Show loading if no players are fetched
                    : Column(
                        children: _players.map((player) {
                          return CheckboxListTile(
                            title:
                                Text('${player.firstName} ${player.lastName}'),
                            value: _selectedPlayerIDs.contains(player.id),
                            onChanged: (bool? selected) {
                              setState(() {
                                if (selected == true && player.id != null) {
                                  _selectedPlayerIDs.add(player.id!);
                                } else {
                                  _selectedPlayerIDs.remove(player.id);
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
                  color: AppColors.lightOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                try {
                  String teamName = _teamNameController.text.trim();

                  if (teamName.isNotEmpty && _selectedPlayerIDs.isNotEmpty) {
                    // Call the service method to create the team with selected players
                    await _serviceMethod.createTeam(
                        teamName, _selectedPlayerIDs);

                    // Print the details of the newly created team (if insertion is successful)
                    print('Team added successfully!');
                    print('Team Name: $teamName');
                    print('Player IDs: ${_selectedPlayerIDs.join(", ")}');

                    // Clear the team name input and close the dialog
                    _teamNameController.clear();
                    Navigator.pop(context);
                  } else {
                    print('Please provide a team name and select players.');
                  }
                } catch (e) {
                  // Handle errors if the team insertion fails
                  print('Error adding team: $e');
                }
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: AppColors.lightOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
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
