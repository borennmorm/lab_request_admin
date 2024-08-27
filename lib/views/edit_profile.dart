import 'package:flutter/material.dart';

import '../components/my_button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile picture with edit icon
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/man.jpg',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: IconButton(
                onPressed: () {
                  // Handle image change action
                },
                icon: const Icon(
                  Icons.file_upload_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const SizedBox(height: 20),
            // Name TextField
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Password
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Save Button
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  color: Colors.blue,
                  text: 'Save',
                  onPressed: () {
                    // Handle save action
                  },
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
