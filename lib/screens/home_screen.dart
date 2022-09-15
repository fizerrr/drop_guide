import 'package:flutter/material.dart';
import 'package:drop_guide/data/data.dart';
import 'detail_screen.dart';
import 'package:drop_guide/widgets/shoe_card.dart';
import 'package:drop_guide/widgets/custom_page_route.dart';
import 'package:drop_guide/data/logic.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<ShoeData> shoesdata = [];

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.all(0.05*screenWidth),

            child: Column(
              children: [

                SizedBox(height: 0.05*screenWidth,),
                
                Center(
                  child: Text('drop_guide', style: TextStyle(fontSize: 0.09*screenWidth,))//Image.asset("assets/images/dglogoproba.png", width: 0.5*screenWidth)
                ),

                SizedBox(height: 0.1*screenWidth,),

                _shoeListView(),

              ],
          ),
        ),
      ),
    )
    );
  }
  Widget _dateView(day,year,datetime,index) {

         String date = day+"."+year;
         if(index == 0 ||  datetime != datetime){
           return Text('${date}');


  }}

  Widget _shoeListView() {

    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot){

        if(snapshot.data == null){
          return Text(
            "loading...",
            style: TextStyle(fontSize: 0.05*screenWidth),
          );
        }
        else{
          return ListView.builder(

            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.length,

            itemBuilder: (context, index){
              return Column(
              children: [

                Container(

                  child: _dateView(
                      snapshot.data[index].datetime.day.toString(),
                      snapshot.data[index].datetime.year.toString(),
                      snapshot.data[index].datetime,
                      index
                  )

                ),

                Container(
                
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: DetailScreen(
                          shoeData: snapshot.data[index],
                        ),
                      ),
                    );
                  },

                  child: ShoeCard(
                    shoe: snapshot.data[index],
                  ),
                ),

                SizedBox(
                  height: 0.05*screenWidth,
                ),

              ],
            );
            },
          );
        }
      }
    );

  }

  Widget DatePlate(int index, String previousDate, String nextDate){

    if(index == 0){
      return Text(nextDate);
    }
    else if(previousDate == nextDate){
      return Text(nextDate);
    }

  }
}
