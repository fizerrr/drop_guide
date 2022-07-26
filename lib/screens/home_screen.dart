import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/data/data.dart';
import 'package:settings_ui/screens/detail_screen.dart';
import 'package:settings_ui/widgets/shoe_card.dart';
import 'package:http/http.dart' as http;




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String hs256() {
    String token;
    final jwt = JWT(
      {'Client': 'flutter',
      'WhyJWT': 'It is a trick!'},

    );
    token = jwt.sign(SecretKey('test'),algorithm: JWTAlgorithm.HS256);

    print('Signed token: $token\n');
    return token;

  }

  bool isLoading = true;
  int i = 0;
  List<ShoeData> shoesdata = [];
  getPostData() async {
    var response = await http.get(Uri.parse('https://apitosnkrs.herokuapp.com/snkrs'), headers: {'x-access-token': hs256()});
    var jsonData = jsonDecode(response.body);
    for (var el in jsonData) {
      ShoeData shoeData = ShoeData(
          id: el["id"],
          name: el["name"].toString(),
          description: el["descryption"].toString(),
          application: el["application"].toString(),
          retail: el["retail"].toString(),
          resell: el["resell"].toString(),
          image: el["image"].toString(),
          url: el["url"].toString(),
          draw: el["draw"].toString(),
          month: el["month"].toString(),
          day: el["day"].toString(),
          year: el["year"].toString(),
          hour: el["hour"].toString(),
      );
      shoesdata.add(shoeData);
      i++;
    }

    if(i >= shoesdata.length && isLoading == true) setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset("assets/images/logo.png", height: 70)
                ),
                SizedBox(height: 22,),
                if(isLoading)
                SizedBox(child: Container(
                  alignment: Alignment.bottomCenter,
                  child: isLoading ? CircularProgressIndicator(color: Colors.black,) : _shoeListView() ),
                ),
                _shoeListView(),
              ],
          ),
        ),
      ),
    )
    );
  }


  Widget _shoeListView() {
    print(hs256());
    getPostData();
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
                  height: 22,
                )
            ],
          );
        }
        );
  }
}
