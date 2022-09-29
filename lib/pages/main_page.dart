import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _launchURL(String url) async {
    final Uri urlink = Uri.parse(url);
    if (!await canLaunchUrl(urlink)) {
      //Null check is vital in this line
      await launchUrl(urlink, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $urlink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/sburst-up.jpg'),
              const SizedBox(height: 15),
              const Text(
                "Welcome on board",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "Lets get you connected...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 56, 42, 255),
                  elevation: 10,
                ),
                onPressed: () {
                  const url = 'https://socialburstup.com/';
                  _launchURL(url);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Click to continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 255, 42, 42),
                  elevation: 10,
                ),
                onPressed: () {
                  showDialog(
                    barrierDismissible:
                        false, // makes the dialogBox fixed without going of on tap of the screen
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirm exit'),
                        actions: [
                          ButtonBar(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  exit(0);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Exit App',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
