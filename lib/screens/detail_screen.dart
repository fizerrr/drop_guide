import 'package:flutter/material.dart';
import 'package:settings_ui/constants/constants.dart';
import 'package:settings_ui/data/data.dart';

class DetailScreen extends StatefulWidget {
  final ShoeData shoeData;
  final String tag;
  DetailScreen({this.shoeData, this.tag});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> _sizeTags = [];
  int _selectedTag = 0;

  @override
  Widget build(BuildContext context) {
    print(context);
    print(widget.shoeData.name);
    print(widget.shoeData.application);
    print(widget.shoeData.description);
    print(widget);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xfff5f5f5),
                      ),
                      child: Hero(
                          tag: "${widget.shoeData.id}",
                          child: Image.network(
                            widget.shoeData.image,
                            height: 200,
                            width: 200,
                          )),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () => Navigator.pop(context),
                      highlightColor: Colors.grey,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
//Here is description
                Text(
                  widget.shoeData.name,
                  style: Theme.of(context).textTheme.headline1,
                ),

                SizedBox(
                  height: 5,
                ),

                Container(
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
                ),
                SizedBox(height: 20),
                Text("Description:",
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(
                  height: 5,
                ),
                Text(widget.shoeData.description,
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
