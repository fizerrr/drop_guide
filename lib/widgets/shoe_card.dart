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
      height: 0.85*screenWidth,
      color: Color.fromRGBO(245, 245, 245, 1), 

      child: Column(
        children: [

          SizedBox(height: 0.03*screenWidth,),

          Container(
            height: 0.45*screenWidth,
            width: 0.77*screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment(0, 0.3),
                image: NetworkImage('${shoe.image}',),
              )
            ),
          ),

          SizedBox(height: 0.01*screenWidth,),

          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Text(
                  shoe.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 0.075*screenWidth),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis
                ),
              )
            )
          ),

          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Text(
                  "${shoe.retail}\$",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 0.056*screenWidth),
                ),
              ),
            )
          ),

        ],
      ),
    );
  }
}
