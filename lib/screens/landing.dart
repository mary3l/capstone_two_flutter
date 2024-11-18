import 'package:audio_classification/prisma/generated_dart_client/model.dart';
import 'package:audio_classification/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/services/service_methods.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<Season> _seasons = [];
  @override
  void initState() {
    super.initState(); // Call the parent class's initState
  }

  final serviceMethod = ServiceMethod();

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
                  serviceMethod.createSeason(startYear, endYear);
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
    // Fetch seasons asynchronously before showing the dialog
    List<Season> seasons =
        await serviceMethod.fetchSeasons(); // Ensure seasons are fetched first

    if (seasons.isEmpty) {
      // Handle empty seasons, if necessary (e.g., show a message)
      print('No seasons available');
    }

    // After fetching, update the _seasons list
    setState(() {
      _seasons = seasons;
    });

    // Show dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                final seasonText =
                    'Season ${season.startYear} - ${season.endYear}';

                return ListTile(
                  title: Text(seasonText),
                  onTap: () {
                    Navigator.of(context).pop(); // Close dialog on selection
                    selectedSeasonID = season.id;
                    startYear = season.startYear;
                    endYear = season.endYear;

                    print("Selected season: $seasonText, ID: ${season.id}");

                    // Navigate to the Dashboard page, passing the selected season ID
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(
                          selectedSeasonID: selectedSeasonID,
                          startYear: startYear,
                          endYear: endYear,
                        ),
                      ),
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
                      const SizedBox(height: 20),
                      Button(
                        icon: Icon(Icons.new_label, color: Colors.white),
                        text: 'Add New Season',
                        onPress: () => _showAddSeasonDialog(context),
                      ),
                      const SizedBox(height: 20),
                      // to see assigned games to season
                      // add new game to season
                      // not yet working
                      Button(
                        text: 'Choose Season',
                        onPress: _showChooseSeasonDialog,
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
