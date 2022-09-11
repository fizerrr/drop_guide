import 'package:flutter/material.dart';
import 'package:drop_guide/data/data.dart';

class DetailScreen extends StatefulWidget {
  final ShoeData shoeData;
  final String tag;
  DetailScreen({this.shoeData, this.tag});
  
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //List<String> _sizeTags = [];
  //int _selectedTag = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    print(context);
    print(widget.shoeData.name);
    print(widget.shoeData.application);
    print(widget.shoeData.description);
    print(widget);

    return Scaffold(
      //backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.all(0.05*screenWidth),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Stack(
                  children: [

                    Container(
                      child: Image.network(
                        widget.shoeData.image,
                        width: screenWidth,
                      ),
                    ),

                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () => Navigator.pop(context),
                    ),

                  ],
                ),

                Text(
                    widget.shoeData.name,
                    style: TextStyle(fontSize: 0.1*screenWidth, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                ),

                /*Container(  CHWILOWO NIEUZYWANE
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    color: Color(0xfff5f5f5),
                  ),
                  height: 7,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _sizeTags.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          SizedBox(width: 10),
                        ],
                      );
                    },
                  ),
                ),*/

                SizedBox(height: 20),

                Text(
                  "Description:",
                  style: TextStyle(fontSize: 0.06*screenWidth)
                ),

                SizedBox(
                  height: 5,
                ),

                Text(
                  //widget.shoeData.description,
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in sapien ut purus venenatis pellentesque. Aenean consectetur eros eu enim tempor sollicitudin. Phasellus nunc orci, interdum non metus at, fringilla porta lectus. Cras sapien elit, imperdiet vel lectus et, pretium venenatis nunc. Nam luctus volutpat egestas. Nulla eu neque vehicula felis auctor mollis vitae in tortor.',
                  style: TextStyle(fontSize: 0.05*screenWidth, fontWeight: FontWeight.w300),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
