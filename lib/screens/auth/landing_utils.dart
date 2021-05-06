import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/landing_service.dart';

class LandingUtils with ChangeNotifier {
  final picker = ImagePicker();
  File userAvatar;
  File get getUserAvatar => userAvatar;
  String userAvatarUrl;
  String get getUserAvatarUrl => userAvatarUrl;

  Future pickUserAvatar(BuildContext context, ImageSource source) async {
    final pickedUserAvatar = await picker.getImage(source: source);
    pickedUserAvatar == null
        ? print('Select image')
        : userAvatar = File(pickedUserAvatar.path);
    print(userAvatar.path);

    userAvatar != null
        ? Provider.of<LandingService>(context, listen: false)
            .showUserAvatar(context)
        : print('Image upload error');

    notifyListeners();
  }

  Future selectAvatarOptionsSheet(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: kWhiteColor,
                  ),
                ),
                Center(
                  child: Text('Silahkan upload foto profile',
                      style: GoogleFonts.openSans(
                          color: kWhiteColor,
                          fontStyle: FontStyle.italic,
                          fontSize: 18.0)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        color: Colors.amber,
                        child: Text('Gallery',
                            style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                        onPressed: () {
                          pickUserAvatar(context, ImageSource.gallery)
                              .whenComplete(() {
                            Navigator.pop(context);
                            Provider.of<LandingService>(context, listen: false)
                                .showUserAvatar(context);
                          });
                        }),
                    MaterialButton(
                        color: Colors.amber,
                        child: Text('Camera',
                            style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                        onPressed: () {
                          pickUserAvatar(context, ImageSource.camera)
                              .whenComplete(() {
                            Navigator.pop(context);
                            Provider.of<LandingService>(context, listen: false)
                                .showUserAvatar(context);
                          });
                        })
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(12.0)),
          );
        });
  }
}
