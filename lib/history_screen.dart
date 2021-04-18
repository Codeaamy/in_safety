import 'package:flutter/material.dart';
import 'package:insafety/constant.dart';
import 'package:insafety/helper_functions.dart';

class HistoryScreen extends StatelessWidget {
  final List historyList;

  const HistoryScreen({Key key, this.historyList}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    var width = HelperFunctions().getWidth(context);
    var height = HelperFunctions().getHeight(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurple,
        title: Text('  History'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.only(left:8.0, right: 8.0),
            child: Card(
              child: Container(
                height: 70,
                width: width - 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('SOS Event',style: kScreensTitleStyle,),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: Text('Latitude: 12.098784 ... Longitude: 18.987648',style: kScreensDescStyle, ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Icon(Icons.send, size: 35,color: darkPurple,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )

      );

  }
}
