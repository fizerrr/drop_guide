import 'package:flutter/material.dart';
import 'package:drop_guide/data/data.dart';
import 'package:expandable/expandable.dart';
import 'package:drop_guide/widgets/size_dialog.dart';
import 'package:drop_guide/providers/size_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final ShoeData shoeData;
  final String tag;
  DetailScreen({this.shoeData, this.tag});
  
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  Size all = Size(size: 'All', lowestAsk: '90\$');
  Size ten = Size(size: '10US', lowestAsk: '100\$', highestBid: '2', lastSale: 'nd');
  Size nine = Size(size: '9US', lowestAsk: '110\$', highestBid: '2', lastSale: 'nd');
  Map<String,Size> sizesMap = Map();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double startHori;
    sizesMap['All'] = all;
    sizesMap['10US'] = ten;
    sizesMap['9US'] = nine;

    return Scaffold(
      body: SafeArea(
        child: Consumer<SetSize>(
          builder: (context, selectedSize, child) {
          return GestureDetector(
        
            onHorizontalDragStart: (details) {
              startHori = details.globalPosition.dx;
            },
        
            onHorizontalDragUpdate: (details){
              if(details.globalPosition.dx - startHori > 0.1*screenWidth){
                selectedSize.size = 'All';
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
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
        
                        expanded: Text(
                          widget.shoeData.description,
                          style: TextStyle(fontSize: 0.055*screenWidth, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
        
                    SizedBox(height: 0.04*screenWidth),
        
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
        
                    SizedBox(height: 0.04*screenWidth),
        
                    _stockxdata(context, screenWidth, sizesMap),
                    
                    SizedBox(height: 0.06*screenWidth,),
        
                    Row(
                      children: [
        
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Container(
                              width: 0.4*screenWidth,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 0.0035*screenWidth),
                                borderRadius: BorderRadius.all(Radius.circular(0.01*screenWidth))
                              ),
                              
                              child: Padding(
                                padding: EdgeInsets.all(0.01*screenWidth),
                                child: Text(
                                  'StockX',
                                  style: TextStyle(fontSize: 0.06*screenWidth, fontWeight: FontWeight.w500, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
        
                        SizedBox(width: 0.1*screenWidth),
        
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Container(
                              width: 0.4*screenWidth,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 0.0035*screenWidth),
                                borderRadius: BorderRadius.all(Radius.circular(0.01*screenWidth))
                              ),
                              
                              child: Padding(
                                padding: EdgeInsets.all(0.01*screenWidth),
                                child: Text(
                                  widget.shoeData.application,
                                  style: TextStyle(fontSize: 0.06*screenWidth, fontWeight: FontWeight.w500, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
        
                      ],
                    )
        
                  ],
                ),
              ),
            ),
          );
          } 
        ),
      ),
    );
  }

}

Widget _stockxdata(BuildContext context, double screenWidth, Map<String, Size> sizesMap) {

  return Consumer<SetSize>(
    builder: (context, selectedSize, child) {
      return Column(
        children: [
  
          Container(
            width: screenWidth,
            child: Text(
              "StockX live data:",
              style: TextStyle(fontSize: 0.06*screenWidth)
            )
          ),
          
          Row(
            children: [
  
              Expanded(
                child: Text(
                  "Size:",
                  style: TextStyle(
                    fontSize: 0.055 * screenWidth, fontWeight: FontWeight.w300
                  ),
                ),
              ),
  
              GestureDetector(
                onTap: () {
                  sizeDialog(context, screenWidth, sizesMap);
                },
                child: Text(
                  selectedSize.size,
                  style: TextStyle(
                    fontSize: 0.055 * screenWidth,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline
                  ),
                  textAlign: TextAlign.right,
                ),
              )
  
            ],
          ),
  
          Row(
            children: [
              Expanded(
                child: Text(
                  "Last sale:",
                  style: TextStyle(
                      fontSize: 0.055 * screenWidth, fontWeight: FontWeight.w300),
                ),
              ),
              Expanded(
                  child: Text(
                sizesMap[selectedSize.size].lastSale,
                style: TextStyle(
                    fontSize: 0.055 * screenWidth,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline),
                textAlign: TextAlign.right,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Highest bid:",
                  style: TextStyle(
                      fontSize: 0.055 * screenWidth, fontWeight: FontWeight.w300),
                ),
              ),
              Expanded(
                  child: Text(
                sizesMap[selectedSize.size].highestBid,
                style: TextStyle(
                    fontSize: 0.055 * screenWidth,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline),
                textAlign: TextAlign.right,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Lowest ask:",
                  style: TextStyle(
                      fontSize: 0.055 * screenWidth, fontWeight: FontWeight.w300),
                ),
              ),
              Expanded(
                  child: Text(
                sizesMap[selectedSize.size].lowestAsk,
                style: TextStyle(
                    fontSize: 0.055 * screenWidth,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline),
                textAlign: TextAlign.right,
              )),
            ],
          ),
        ],
      );
    }
  );
    
  
}