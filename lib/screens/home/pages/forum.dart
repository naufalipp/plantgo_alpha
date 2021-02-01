import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/models/data.dart';

class Forum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var body = Container(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: Data.tanaman.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  color: Color(Data.tanaman[index]
                      .color), //ganti sama color di data nanti!!!
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Hero(
                              tag: Data.tanaman[index].id,
                              child: FadeInImage(
                                image: AssetImage(Data.tanaman[index].image),
                                fit: BoxFit.cover,
                                placeholder: AssetImage(
                                    'assets/images/loading-green.gif'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            Data.tanaman[index].title,
                            style: TextStyle(
                                color: kBlackColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
    return Scaffold(
      body: body,
    );
  }
}
