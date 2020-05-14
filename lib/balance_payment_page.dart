import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
//import 'package:url_launcher/url_launcher.dart';

class BalancePaymentPage extends StatefulWidget {
  @override
  _BalancePaymentPageState createState() => _BalancePaymentPageState();
}

class _BalancePaymentPageState extends State<BalancePaymentPage> {
  bool isBalance = false;
  List doctors = [
    {
      'name': 'Dr. Abul Kalam',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Kabir Ali',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Abdul Jolil',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Rahim Uddin',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Abdul Karim',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Abul Kalam Azad',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Shamsuddin',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Abul Hashem',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Jashim Miah',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
    {
      'name': 'Dr. Kadir Siddique',
      'mobile': '017XXXXXXXX',
      'clicked': false,
      'tk': "600"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20, left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Recharge",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                        Container(
                          width: 70,
                          child: Divider(
                            color: Color(0xFF1B8E99),
                          ),
                        )
                      ],
                    )),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.only(top: isBalance ? 0 : 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            isBalance == false
                                ? Container()
                                : Text(
                                    "Balance : ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  ),
                            isBalance == false
                                ? Container()
                                : SizedBox(width: 5),
                            isBalance == false
                                ? Container()
                                : Container(
                                    height: 12,
                                    child: Image.asset('assets/taka.png')),
                            SizedBox(width: 3),
                            isBalance == false
                                ? Container()
                                : Text(
                                    "1085.00",
                                    style: TextStyle(
                                        color: header,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                            isBalance == false
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isBalance = false;
                                      });
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                            isBalance == true
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isBalance = true;
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 0.4, color: Colors.grey),
                                            color: Colors.white),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 14,
                                                child: Image.asset(
                                                    'assets/taka.png')),
                                            SizedBox(width: 5),
                                            Text(
                                              "Check Balance",
                                              style: TextStyle(
                                                  color: header,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 40, left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Make Payment",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                        Container(
                          width: 70,
                          child: Divider(
                            color: Color(0xFF1B8E99),
                          ),
                        )
                      ],
                    )),
                SizedBox(height: 5.0),
                Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Column(
                        children: List.generate(doctors.length, (index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              //color: Colors.grey.withOpacity(0.1),
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(left: 3, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Container(
                                      padding: EdgeInsets.all(0.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: ExactAssetImage(
                                            'assets/person.png'),
                                        minRadius: 22,
                                        maxRadius: 22,
                                        //radius: 68.0,
                                        // child: Image.asset(
                                        //     'assets/person.png',
                                        //     fit: BoxFit.cover,),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 0, right: 20),
                                            child: Text(
                                              "${doctors[index]['name']}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 2, left: 0),
                                                  child: Text(
                                                    "Total payable : ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: header),
                                                  ),
                                                ),
                                                Container(
                                                    height: 12,
                                                    child: Image.asset(
                                                        'assets/taka.png')),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 2, left: 3),
                                                  child: Text(
                                                    "${doctors[index]['tk']}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: header),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.phone,
                                                  size: 13,
                                                  color: Colors.black45,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 2, left: 3),
                                                  child: Text(
                                                    "${doctors[index]['mobile']}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color: Colors.black45),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showDialog();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/bkash.png')),
                                          // border: Border.all(width:5, color:Color(0xffE3106D)),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            index + 1 == 10
                                ? Container()
                                : Divider(color: Colors.grey[300])
                          ],
                        ),
                      );
                    }))),
              ],
            ),
          )),
    );
  }

  Future<Null> _showDialog() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return Container(
                    height: height - 200,
                    width: width - 80,
                    child: Center(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Bkash Payment Process",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16),
                                      ),
                                      Container(
                                        width: 100,
                                        child: Divider(
                                          color: Color(0xFF1B8E99),
                                        ),
                                      )
                                    ],
                                  )),
                              SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/pm.png'))),
                              ),
                              Text(
                                "To make payment go to phone call option",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                left: 0,
                                                right: 5,
                                                top: 20,
                                                bottom: 0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.4),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Text(
                                              "CANCEL",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontFamily: 'BebasNeue',
                                              ),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          //_callPhone("tel:");
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                left: 5,
                                                right: 0,
                                                top: 20,
                                                bottom: 0),
                                            decoration: BoxDecoration(
                                                color: header,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'BebasNeue',
                                              ),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  // _callPhone(phone) async {
  //   if (await canLaunch(phone)) {
  //     await launch(phone);
  //   } else {
  //     print('Could not Call Phone');
  //   }
  // }
}
