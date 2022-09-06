import 'package:flutter/material.dart';
import 'package:Drop_Guide/data/data.dart';
import 'detail_screen.dart';
import 'package:Drop_Guide/widgets/shoe_card.dart';
import 'package:Drop_Guide/data/logic.dart';



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

                Center(
                  child: Image.asset("assets/images/dg.png", width: 0.32*screenWidth)
                ),

                SizedBox(height: 0.05*screenWidth,),

                _shoeListView(),

              ],
          ),
        ),
      ),
    )
    );
  }


  Widget _shoeListView() {
    if(shoesdata.isEmpty){
      getPostData(shoesdata);
    }
    double screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(

        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: shoesdata.length,

        itemBuilder: (context, index) {
          return Column(
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        shoeData: shoesdata[index],
                      ),
                    ),
                  );
                },

                child: ShoeCard(
                  shoe: shoesdata[index],
                ),
              ),

                SizedBox(
                  height: 0.05*screenWidth,
                )

            ],
          );
        }
    );
  }
}
