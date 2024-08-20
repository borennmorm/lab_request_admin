import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_request_admin/views/edit_profile.dart';

import 'about_us.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/man.jpg', // Replace with actual profile image URL
              ),
            ),
            const SizedBox(height: 12),
            // User name
            const Text(
              'Morm Borenn',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Edit Profile Option
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green.shade100,
                child: const Icon(Icons.edit, color: Colors.green),
              ),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.to(const EditProfile());
              },
            ),
            const SizedBox(height: 16),
            // About Option
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purple.shade100,
                child: const Icon(Icons.info_outline, color: Colors.purple),
              ),
              title: const Text('About'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.to(const About());
              },
            ),
            const Spacer(),
            // Logout button
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade100,
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'LogOut',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
