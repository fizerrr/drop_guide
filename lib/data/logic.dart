import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:Drop_Guide/data/data.dart';
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


getPostData(List<ShoeData> list) async {
  bool ready = false;
  var response = await http.get(Uri.parse(url), headers: {'x-access-token': hs256()});
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

    list.add(shoeData);

  }
  ready = true;

}

