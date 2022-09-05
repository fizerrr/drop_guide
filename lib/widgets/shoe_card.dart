import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:Drop_Guide/data/data.dart';

class ShoeCard extends StatelessWidget {
  final ShoeData shoe;
  const ShoeCard({Key key, this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(0.06*screenWidth),
      //height: 580,
      //width: 0.9*screenWidth,

      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],

        borderRadius: BorderRadius.circular(25),

        image: DecorationImage(
          image: NetworkImage('${shoe.image}',),
          alignment: Alignment.center,
        ),
      ),

      child: Column(
        children: [

          Column(
            children: [

              Row(
                children: [
                  Container(
                    height: 40,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("${shoe.day}",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 40,
                          )),
                    ),
                  ),

                  Container(
                    height: 40,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        " ${shoe.month} ",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  Container(
                      height: 40,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${shoe.year} ",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          )
                      )
                  ),
                ],
              ),

              Row(
                children: [
                  Container(
                    child: Text(
                      "${shoe.application}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                      ),
                    )
                  )
                ]
              ),

              Row(
                children: [
                  Container(
                    child: Text(
                      "17:00 ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                      ),
                    )
                  ),
                  Container(
                    child: Text(
                      "(${shoe.draw})",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontSize: 12,
                      ),
                    )
                  )
                ]
              )
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 380, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        "${shoe.name}",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "Retail: ${shoe.retail} PLN",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      )),
                  Container(
                      child: Text(
                    "Resell :${shoe.resell} - 1500 PLN",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
