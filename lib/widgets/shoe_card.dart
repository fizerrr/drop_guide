import 'package:flutter/material.dart';
import 'package:drop_guide/data/data.dart';

class ShoeCard extends StatelessWidget {
  final ShoeData shoe;
  const ShoeCard({Key key, this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(0.05*screenWidth),
      height: 0.88*screenWidth,

      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 0.012*screenWidth,
          ),
        ],

        borderRadius: BorderRadius.circular(0.1*screenWidth),

      ),

      child: Column(
        children: [

          Container(
            height: 0.5*screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment(0, 0.3),
                image: NetworkImage('${shoe.image}',),
              )
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              //color: Colors.blue,
              child: Center(
                child: Text(
                  shoe.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 0.064*screenWidth),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis
                ),
              )
            )
          ),

          Expanded(
            flex: 1,
            child: Container(
              //color: Colors.red,
              child: Center(
                child: Text(
                  '${shoe.retail} PLN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 0.05*screenWidth),
                ),
              ),
            )
          ),

        ],
      ),
    );
  }
}
