import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';
import 'package:audio_classification/services/service_methods.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final serviceMethod = ServiceMethod();

    List<Season> _seasons = [];
    List<Game> _games = [];

    @override
    void initState() {
      super.initState(); // Call the parent class's initState
    }

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
      List<Season> seasons = await serviceMethod
          .fetchSeasons(); // Ensure seasons are fetched first

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

    void _showCreatePlayerDialog(BuildContext context) {
      final TextEditingController _firstNameController =
          TextEditingController();
      final TextEditingController _lastNameController = TextEditingController();
      final TextEditingController _middleNameController =
          TextEditingController();
      final TextEditingController _jersey_numberController =
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
                    controller: _jersey_numberController,
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
                  // Retrieve and trim text field inputs
                  String firstName = _firstNameController.text.trim();
                  String lastName = _lastNameController.text.trim();
                  String middleName = _middleNameController.text.trim();
                  int? jerseyNumber =
                      int.tryParse(_jersey_numberController.text.trim());

                  // Validate that the required fields are filled out correctly
                  if (firstName.isNotEmpty &&
                      lastName.isNotEmpty &&
                      jerseyNumber != null) {
                    try {
                      // Attempt to create the player using the service method
                      await serviceMethod.createPlayer(
                        lastName,
                        firstName,
                        middleName,
                        jerseyNumber,
                      );

                      // Show a success message if the player is created successfully
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Player created successfully')),
                      );

                      Navigator.of(context).pop(); // Close the dialog
                    } catch (e) {
                      // Handle any errors that occur during the API call
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error adding player: $e')),
                      );
                      print(
                          "Error adding player: $e"); // Log the error for debugging purposes
                    }
                  } else {
                    // Validation failed, prompt the user to fill out all required fields
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Please enter valid player details')),
                    );
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
          // ListTile for Dashboard
          ListTile(
            leading: Icon(Icons.dashboard,
                color: AppColors.white), // Icon for Dashboard
            title: Text(
              'Dashboard',
              style: TextStyle(color: AppColors.white), // Text color
            ),
            onTap: _showChooseSeasonDialog,
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
