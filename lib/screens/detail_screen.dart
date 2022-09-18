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

                            SizedBox(height: 0.025*screenWidth,),

                            Container(
                              child: Text(
                                "${widget.shoeData.display_date("date")}\n ${widget.shoeData.application}\n ${widget.shoeData.display_date("time")}",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 0.05*screenWidth),
                              ),
                              alignment: Alignment.topRight,
                            ),

                          ],
                        )
                      ),

                    ],
                  ),

                  Container(
                    width: screenWidth,
                    child: Text(
                        widget.shoeData.name,
                        style: TextStyle(fontSize: 0.09*screenWidth, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 0.03*screenWidth),
                  
                  ExpandableNotifier(
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        useInkWell: false,
                        tapHeaderToExpand: true,
                      ),

                      header: Text(
                        "Description:",
                        style: TextStyle(fontSize: 0.06*screenWidth),
                      ),

                      collapsed: Text(
                        widget.shoeData.description,
                        style: TextStyle(fontSize: 0.055*screenWidth, fontWeight: FontWeight.w300),
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                      ),

                      expanded: Text(
                        widget.shoeData.description,
                        style: TextStyle(fontSize: 0.055*screenWidth, fontWeight: FontWeight.w300),
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
                          "${widget.shoeData.retail}\$",
                          style: TextStyle(fontSize: 0.06*screenWidth, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.right,
                        )
                      ),
                       
                    ],
                  ),

                  /*Row(
                    children: [

                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text('${widget.shoeData.application}'),
                        )
                      ),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(widget.shoeData.application),
                        )
                      ),

                    ],
                  )*/

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
