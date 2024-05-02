// ignore_for_file: unused_import, file_names

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:toast/toast.dart';
import 'package:travelling_app/Common/imagepick.dart';
import 'package:travelling_app/widgets/textFieldInput.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _firstName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _LastName = TextEditingController();
  final _RePassword = TextEditingController();
  Uint8List? _Image;

  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    _Image = img;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(children: [
                  _Image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_Image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1682687982167-d7fb3ed8541d?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8"),
                        ),
                  Positioned(
                      bottom: -1,
                      left: 90,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: () {
                          selectImage();
                        },
                      )),
                  const SizedBox(
                    height: 100,
                  ),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Let's Create a account",
              ),
              const SizedBox(
                height: 50,
              ),
              textFieldInput(
                controller: _firstName,
                hint_text: "First Name",
                obscuretext: false,
              ),
              const SizedBox(
                height: 15,
              ),
              textFieldInput(
                controller: _LastName,
                hint_text: "Last Name",
                obscuretext: false,
              ),
              const SizedBox(
                height: 15,
              ),
              textFieldInput(
                controller: _email,
                hint_text: "Email",
                obscuretext: false,
              ),
              const SizedBox(
                height: 15,
              ),
              textFieldInput(
                controller: _password,
                hint_text: "Password",
                obscuretext: true,
              ),
              const SizedBox(
                height: 15,
              ),
              textFieldInput(
                controller: _RePassword,
                hint_text: "Re-enter Password",
                obscuretext: false,
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width - 80,
                  height: 60,
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ]),
      ),
    );
  }
}
