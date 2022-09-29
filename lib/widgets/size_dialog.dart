import 'package:drop_guide/providers/size_provider.dart';
import 'package:flutter/material.dart';
import 'package:drop_guide/data/data.dart';
import 'package:provider/provider.dart';

void sizeDialog(BuildContext context, double screenWidth, Map<String, Size> sizeMap) {

  List<Size> sizeList = [];
  sizeMap.forEach((key, value) => sizeList.add(value)); //converts map to list

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<SetSize>(
        builder: (context, selectedSize, child) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.02*screenWidth)),
            child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              height: 0.8*screenWidth,
              child: ListView.builder( //use gridview
                itemCount: sizeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedSize.size = sizeList[index].size;
                    },
                    child: Center(
                      child: Container(
                        child: Text(
                          sizeList[index].size,
                          style: sizeList[index].size == selectedSize.size
                            ? TextStyle(fontSize: 40, color: Colors.red)
                            : TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  );
                },
              )
            ),
            ),
          );
        },
      );
    }
  );


}
