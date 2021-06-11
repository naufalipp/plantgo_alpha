import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:provider/provider.dart';

import 'package:plantgo_alpha/screens/home/pages/mutual_profile/mutual_profile_service.dart';

class MutualProfile extends StatelessWidget {
  final String userUid;
  MutualProfile({@required this.userUid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreen,
      appBar: Provider.of<MutualProfileService>(context, listen: false)
          .appBar(context),
      body: SafeArea(
        child: ListView(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            children: <Widget>[
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userUid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        Provider.of<MutualProfileService>(context,
                                listen: false)
                            .headerProfile(context, snapshot, userUid),
                        Provider.of<MutualProfileService>(context,
                                listen: false)
                            .feedProfile(context, snapshot)
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    );
                  }
                },
              ),
            ]),
      ),
    );
  }
}
