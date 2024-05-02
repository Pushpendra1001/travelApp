import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPhone = false;
  bool isEditingAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Profile",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
              _buildTextField(
                'Name',
                nameController,
                Icons.person,
                isEditingName,
              ),
              _buildTextField(
                'Email',
                emailController,
                Icons.email,
                isEditingEmail,
              ),
              _buildTextField(
                'Phone',
                phoneController,
                Icons.phone,
                isEditingPhone,
              ),
              _buildTextField(
                'Address',
                addressController,
                Icons.location_city,
                isEditingAddress,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: ClipRRect(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  fixedSize: const Size(150, 50),
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16)))),
                              onPressed: () {
                                isEditingName = true;
                                isEditingAddress = true;
                                isEditingEmail = true;
                                isEditingPhone = true;

                                setState(() {});
                              },
                              child: const Text(
                                "Edit Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: ClipRRect(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  fixedSize: const Size(150, 50),
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16)))),
                              onPressed: () {
                                isEditingAddress = false;
                                isEditingEmail = false;
                                isEditingName = false;
                                isEditingPhone = false;
                                setState(() {});
                              },
                              child: const Text(
                                "Save Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon,
    bool isEditing,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                enabled: isEditing,
                decoration: InputDecoration(
                  labelText: label,
                  prefixIcon: Icon(icon),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editName() {
    setState(() {
      isEditingName = true;
    });
  }

  void _saveName() {
    setState(() {
      isEditingName = false;
    });
  }

  void _editEmail() {
    setState(() {
      isEditingEmail = true;
    });
  }

  void _saveEmail() {
    setState(() {
      isEditingEmail = false;
    });
  }

  void _editPhone() {
    setState(() {
      isEditingPhone = true;
    });
  }

  void _savePhone() {
    setState(() {
      isEditingPhone = false;
    });
  }

  void _editDob() {
    setState(() {
      isEditingAddress = true;
    });
  }

  void _saveDob() {
    setState(() {
      isEditingAddress = false;
    });
  }
}
