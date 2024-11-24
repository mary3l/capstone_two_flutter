import 'dart:math';

import 'package:audio_classification/screens/playerProfile.dart';
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

class TeamProfile extends StatefulWidget {
  @override
  _TeamProfileState createState() => _TeamProfileState();
}

class _TeamProfileState extends State<TeamProfile> {
  //to capture user input, access it easily, and manage it
  final TextEditingController _teamNameController = TextEditingController();

  final serviceMethod = ServiceMethod();

  List<Team> _teams = [];
  List<Player> _players = [];
  List<Season> _seasons = [];
  int? _selectedSeasonID;
  List<Game> _games = [];

// Track selected player IDs
  List<int> _selectedPlayerIDs = [];

  @override
  void initState() {
    super.initState(); // Call the parent class's initState
    _fetchTeams(); // Fetch teams when the widget initializes
  }

  // Fetch available seasons (called when the button is clicked)
  Future<void> _fetchPlayer() async {
    try {
      List<Player> players = await serviceMethod.fetchPlayers();
      setState(() {
        _players = players;
      });
      if (players.isEmpty) {
        debugPrint('No players available.');
      }
    } catch (e) {
      debugPrint('Error fetching players: $e');
    }
  }

// Fetch available seasons (called when the button is clicked)
  Future<void> _fetchSeasons() async {
    try {
      List<Season> seasons = await serviceMethod.fetchSeasons();
      setState(() {
        _seasons = seasons;
      });
      if (seasons.isEmpty) {
        debugPrint('No seasons available.');
      }
    } catch (e) {
      debugPrint('Error fetching seasons: $e');
    }
  }

  // Fetch teams for the selected season (called after selecting a season)
  Future<void> _fetchTeamsForSeason(int seasonID) async {
    try {
      List<Team> teams = await serviceMethod
          .fetchTeamsForSeason(seasonID); // Now it returns a List<Team>
      setState(() {
        _teams = teams; // Update the state with fetched data
        _selectedSeasonID = seasonID; // Store the selected season ID
      });

      if (teams.isEmpty) {
        debugPrint('No teams for seasonID :$seasonID is available.');
      }
    } catch (e) {
      setState(() {
        // Handle error or state update if necessary
      });
      debugPrint('Error fetching teams for seasonID $seasonID: $e');
    }
  }

  Future<void> _fetchTeamsForSemester(String semester) async {
    try {
      List<Team> teams = await serviceMethod
          .fetchTeamsForSemester(semester); // Fetch teams filtered by semester
      setState(() {
        _teams = teams; // Update the state with filtered teams
      });

      if (teams.isEmpty) {
        debugPrint('No teams available for semester: $semester.');
      }
    } catch (e) {
      debugPrint('Error fetching teams for semester $semester: $e');
    }
  }

  Future<void> _fetchTeams() async {
    try {
      List<Team> teams =
          await serviceMethod.fetchTeams(); // Fetch teams directly
      setState(() {
        _teams = teams; // Update the state with fetched data
      });

      // Check if the fetched teams list is empty
      if (teams.isEmpty) {
        debugPrint('No teams available.');
      }
    } catch (e) {
      // Handle errors
      setState(() {
        // Keep state changes minimal here
      });
      debugPrint('Error fetching teams: $e');
    }
  }

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
                    await serviceMethod.createTeam(
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

  // Show the list of seasons in a dialog when the filter button is clicked
  void _showSeasonFilterDialog() async {
    // Fetch seasons asynchronously before showing the dialog
    List<Season> seasons =
        await serviceMethod.fetchSeasons(); // Ensure seasons are fetched first

    if (seasons.isEmpty) {
      // Handle empty seasons, if necessary (e.g., show a message)
      print('No seasons available');
      return; // Exit the function if no seasons are available
    }

    // After fetching, update the _seasons list
    setState(() {
      _seasons = seasons;
    });

    // Show the dialog with the fetched seasons
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Local variables to store selected season details
        int? selectedSeasonID;
        int? startYear;
        int? endYear;

        return AlertDialog(
          title: Text('Choose a Season'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _seasons.length,
              itemBuilder: (context, index) {
                final season = _seasons[index];
                // Display the season as 'Season StartYear - EndYear'
                final seasonText =
                    'Season ${season.startYear} - ${season.endYear}';

                return ListTile(
                  title: Text(seasonText), // Display the formatted season text
                  onTap: () {
                    // Fetch teams for the selected season
                    _fetchTeamsForSeason(season.id ?? 0);

                    // Close the dialog after selection
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

// Show the semester filter dialog when user clicks the semester button
  void _showSemesterFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Semester'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("First Semester"),
                onTap: () {
                  _fetchTeamsForSemester(
                      "First"); // Filter teams for first semester
                  Navigator.pop(context); // Close the dialog
                },
              ),
              ListTile(
                title: Text("Second Semester"),
                onTap: () {
                  _fetchTeamsForSemester(
                      "Second"); // Filter teams for second semester
                  Navigator.pop(context); // Close the dialog
                },
              ),
            ],
          ),
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
                Button(
                  text: "Season Year",
                  onPress: _showSeasonFilterDialog,
                ),
                Button(
                  text: "Semester",
                  onPress: _showSemesterFilterDialog,
                ),
              ],
            ),
            SizedBox(height: 20),

            // List of teams
            Expanded(
              child: ListView.builder(
                itemCount: _teams.length,
                itemBuilder: (context, index) {
                  final team = _teams[index];

                  final games = team.game;

                  return Column(
                    children: [
                      GameCard(
                        team: team,
                        // season: '${startYear} - ${endYear}',
                        semester: games?.elementAt(0).semester,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayerProfile(
                                team: team,
                                teamName: team.name,
                              ),
                            ),
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
