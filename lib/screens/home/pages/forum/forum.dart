import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:provider/provider.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/forum_service.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/upload_post.dart';

class Forum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      drawer: Drawer(),
      appBar: Provider.of<ForumService>(context, listen: false).appBar(context),
      body:
          Provider.of<ForumService>(context, listen: false).forumBody(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<UploadPost>(context, listen: false)
              .selectPostType(context);
        },
        icon: Icon(Icons.add),
        label: Text("Tanya"),
        backgroundColor: kMainColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
