import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/upload_post.dart';
import 'package:provider/provider.dart';

class ForumService with ChangeNotifier {
  @override
  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: kMainColor.withOpacity(0.6),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(Icons.camera_enhance, color: kWhiteCalm),
            onPressed: () {
              Provider.of<UploadPost>(context, listen: false)
                  .selectPostType(context);
            })
      ],
      title: RichText(
        text: TextSpan(
          text: 'Komunitas ',
          style: TextStyle(
            color: kWhiteCalm,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget forumBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kWhiteCalm, borderRadius: BorderRadius.circular(12.0)),
              child: Text(
                "Topik Terbaru",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
