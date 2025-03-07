import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFA726),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(top: 50, bottom: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://your-profile-image-url.com'),
                ),
                SizedBox(height: 10),
                Text(
                  'Samir Ghimire',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                buildProfileItem('Name', 'Samir Ghimire'),
                buildProfileItem('Business Name', 'Arthik Sathi'),
                buildProfileItem('Email', 'Samirghimire023@gmail.com'),
                buildProfileItem('Password', '*************', isPassword: true),
                SizedBox(height: 20),
                SwitchListTile(
                  title: Text('Low Stock Alerts'),
                  value: true,
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  title: Text('Due Payment Alerts'),
                  value: true,
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  title: Text('Funds To Receive'),
                  value: true,
                  onChanged: (val) {},
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA726),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  ),
                  onPressed: () {},
                  child: Text('Log Out', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileItem(String title, String value, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
              Text(
                isPassword ? '*************' : value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.edit, color: Colors.grey),
        ],
      ),
    );
  }
}
