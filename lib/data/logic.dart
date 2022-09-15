import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:drop_guide/data/data.dart';
import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

var url = 'https://apitosnkrs.herokuapp.com/snkrs';


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

Future<List<ShoeData>> getData() async {
   var data = await http.get(Uri.parse(url));
  var jsonData = json.decode(data.body);

  List<ShoeData> shoeList = [];

  for(var el in jsonData){
    ShoeData shoe = ShoeData(
      id: el["id"],
      name: el["name"],
      description: el["description"],
      application: el["application"],
      retail: el["retail"],
      resell: el["resell"],
      image: el["image"],
      url: el["url"],
      draw: el["draw"],
      datetime: DateTime.tryParse(el["datetime"].toString()),
    );
    shoeList.add(shoe);

  }
   print(shoeList[0].display_date("date"));

   print(shoeList[0].display_date("year"));

   print(shoeList[0].display_date("month"));

   print(shoeList[0].display_date("day"));

   print(shoeList[0].display_date("time"));




  return shoeList;
}

