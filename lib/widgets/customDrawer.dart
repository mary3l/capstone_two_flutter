import 'package:capstone_two_one/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    fontFamily: 'Jersey10'),
              ),
            ),
          ),
          // ListTile for Start Recording
          ListTile(
            leading: Icon(Icons.mic,
                color: AppColors.white), // Icon for Start Recording
            title: Text(
              'Start Recording',
              style: TextStyle(color: AppColors.white), // Text color
            ),
            onTap: () {
              Navigator.pushNamed(context, '/screens/startRecording');
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
        ],
      ),
    );
  }
}
