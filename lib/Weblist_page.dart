import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class WebListPage extends StatefulWidget {
  @override
  _WebListPageState createState() => _WebListPageState();
}

class _WebListPageState extends State<WebListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 3, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 0, right: 20),
                                  child: Text(
                                    index % 2 == 0
                                        ? "The Future of Farming"
                                        : "7 Agricultural Inventions You Need In Your Life",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(top: 3),
                                //   alignment: Alignment.centerLeft,
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     children: <Widget>[
                                //       Icon(
                                //         Icons.calendar_today,
                                //         size: 13,
                                //         color: Colors.black45,
                                //       ),
                                //       Container(
                                //         margin:
                                //             EdgeInsets.only(top: 2, left: 3),
                                //         child: Text(
                                //           index % 2 == 0
                                //               ? "23/11/19"
                                //               : "25/11/19",
                                //           style: TextStyle(
                                //               fontWeight: FontWeight.w400,
                                //               fontSize: 12,
                                //               color: Colors.black45),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Icon(Icons.chevron_right,
                              size: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    // _launchURL(index % 2 == 0
                    //     ? "https://www.youtube.com/watch?v=Qmla9NLFBvU"
                    //     : "https://www.youtube.com/watch?v=X-p4P0SQytM");
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.grey[300]);
              },
            )),
          ),
        ],
      ),
    );
  }

  // _launchURL(url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
