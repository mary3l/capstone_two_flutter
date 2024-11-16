import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/models/test_basketball_model.dart';
import 'package:audio_classification/prisma/generated_dart_client/prisma.dart';
import 'package:audio_classification/screens/dashboard.dart';
import 'package:audio_classification/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/helper/prisma.dart';
import 'package:orm/orm.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // Instance of DatabaseHelper to interact with the database
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Season> _seasons = [];
  @override
  void initState() {
    super.initState(); // Call the parent class's initState
    samplePrisma();
    // _fetchSeasons(); // Fetch the season from the database when the state is initialized
  }

  Future<void> samplePrisma() async {
    try {
      final user = await prisma.user.create(
        data: PrismaUnion.$1(UserCreateInput(
          email: "seven@aaaa",
          name: PrismaUnion.$1("Seven123123 Du"),
        )),
      );
      final users = await prisma.user.findMany();
      for (var user in users) {
        print('User ID: ${user.id}');
        print('Name: ${user.name}');
        print('Email: ${user.email}');
        // Add other fields as needed
      }
    } catch (e) {
      print(e);
    } finally {
      //await prisma.$disconnect();
    }
  }

// Asynchronous function to fetch seasons from the database
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

                  int seasonID = await _databaseHelper.insertSeason(newSeason);
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

  void _showChooseSeasonDialog() async {
    // Ensure seasons are fetched before showing the dialog
    await _fetchSeasons();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose a Season'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _seasons.length,
              itemBuilder: (context, index) {
                // Convert season data to string for display
                final season = _seasons[index];
                final seasonText =
                    'Season ${season.startYear} - ${season.endYear}';

                return ListTile(
                  title: Text(seasonText),
                  onTap: () {
                    Navigator.of(context).pop(); // Close dialog on selection
                    // Add any actions you want to take upon selecting a season
                    print("Selected season: $seasonText");
                    // Navigate to the Dashboard and pass the selected season data
                    Navigator.pushNamed(
                      context,
                      '/screens/dashboard',
                      arguments: {
                        'startYear': season.startYear,
                        'endYear': season.endYear,
                      },
                    );
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Ball 1 (top left)
          Positioned(
            top: -70,
            left: -40,
            child: Image.asset(
              'lib/assets/images/ball.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),

          // Ball 2 (middle right)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20 - 50,
            right: -10,
            child: Image.asset(
              'lib/assets/images/ball.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),

          // Ball 3 (middle left)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 - 50,
            left: -110,
            child: Image.asset(
              'lib/assets/images/ball.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 250,
                  height: 250,
                  color: Colors.red,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),

          // Ball 4 (bottom right)
          Positioned(
            bottom: -40,
            right: -45,
            child: Image.asset(
              'lib/assets/images/ball.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),

          // General Screen Padding with Header and Buttons
          GeneralScreenPadding(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Header(
                    title: 'BASKETBALL VOICE RECOGNITION APP',
                    alignment: HeaderAlignment.header,
                    textType: TextType.header,
                  ),
                  const SizedBox(height: 30),

                  // Buttons section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Button(
                      //   icon: Icon(Icons.mic, color: Colors.white),
                      //   text: 'Start Recording',
                      //   onPress: () {
                      //     Navigator.pushNamed(
                      //         context, '/screens/startRecording');
                      //   },
                      // ),
                      const SizedBox(height: 20),
                      Button(
                        icon: Icon(Icons.new_label, color: Colors.white),
                        text: 'Add New Season',
                        onPress: () => _showAddSeasonDialog(context),
                        // () {
                        //   //once pressed show dialog with making new season
                        //   // Navigator.pushNamed(context, '/screens/seasonPage');
                        // },
                      ),
                      const SizedBox(height: 20),
                      // to see assigned games to season
                      // add new game to season
                      // not yet working
                      Button(
                        text: 'Choose Season',
                        onPress: _showChooseSeasonDialog,
                        //  () {
                        //   // once pressed must show a dialog showing the list of seasons
                        //   // then i chosen must be directed to the season with its assigned games
                        //   Navigator.pushNamed(context, '/screens/dashboard');
                        // },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
