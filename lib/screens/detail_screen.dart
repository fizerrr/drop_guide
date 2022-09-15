import 'package:flutter/material.dart';
import 'package:drop_guide/data/data.dart';
import 'package:expandable/expandable.dart';

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
    double startHori;

    //print(context);
    //print(widget.shoeData.name);
    //print(widget.shoeData.application);
    //print(widget.shoeData.description);
    //print(widget);

    return Scaffold(
      //backgroundColor: Colors.red,
      body: SafeArea(
        child: GestureDetector(

          onHorizontalDragStart: (details) {
            startHori = details.globalPosition.dx;
          },

          onHorizontalDragUpdate: (details){
            if(details.globalPosition.dx - startHori > 0.1*screenWidth){
              Navigator.pop(context);
            }
          },

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

                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: [

                            SizedBox(height: 10,),

                            Container(
                              child: Text(
                                "24.06.2022\n SNKRS_APP\n 9:00",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 0.05*screenWidth),
                              ),
                              //color: Colors.red,
                              alignment: Alignment.topRight,
                            ),

                          ],
                        )
                      ),

                    ],
                  ),

                  Text(
                      widget.shoeData.name,
                      style: TextStyle(fontSize: 0.1*screenWidth, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 0.03*screenWidth),
                  
                  ExpandableNotifier(
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        useInkWell: false,
                      ),

                      header: Text(
                        "Description:",
                        style: TextStyle(fontSize: 0.06*screenWidth),
                      ),

                      collapsed: Text(
                        //widget.shoeData.description,
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in sapien ut purus venenatis pellentesque. Aenean consectetur eros eu enim tempor sollicitudin. Phasellus nunc orci, interdum non metus at, fringilla porta lectus. Cras sapien elit, imperdiet vel lectus et, pretium venenatis nunc. Nam luctus volutpat egestas. Nulla eu neque vehicula felis auctor mollis vitae in tortor.',
                        style: TextStyle(fontSize: 0.05*screenWidth, fontWeight: FontWeight.w300),
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                      ),

                      expanded: Text(
                        //widget.shoeData.description,
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in sapien ut purus venenatis pellentesque. Aenean consectetur eros eu enim tempor sollicitudin. Phasellus nunc orci, interdum non metus at, fringilla porta lectus. Cras sapien elit, imperdiet vel lectus et, pretium venenatis nunc. Nam luctus volutpat egestas. Nulla eu neque vehicula felis auctor mollis vitae in tortor.',
                        style: TextStyle(fontSize: 0.05*screenWidth, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),

                  SizedBox(height: 0.02*screenWidth),

                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          "Retail:",
                          style: TextStyle(fontSize: 0.06*screenWidth)
                        ),
                      ),

                       Expanded(
                        child: Text(
                          "100 PLN",
                          style: TextStyle(fontSize: 0.06*screenWidth, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.right,
                        )
                      ),
                       
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
