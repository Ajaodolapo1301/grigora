


import 'package:flutter/material.dart';
import 'package:grigora/constants/colorConstants.dart';
import 'package:grigora/screens/detailsPage.dart';

class Restaurant extends StatelessWidget {
  final String name;
//  final String newsDate;
  final  String image;
//  final int id;
//  final BillModel billModel;

  Restaurant(
      {Key key,
        this.name,
//        this.newsDate,
        this.image,
//        this.id,
//        this.billModel

      })
      : super(key: key);

  final TextStyle _titleStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
  final TextStyle _dateStyle =
  TextStyle(fontSize: 10, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
      },
      child: Column(

        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  spreadRadius: 5,
                  color: Color(0xff000000).withOpacity(.05),
                ),
              ],
              borderRadius: BorderRadius.circular(4.0),
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 77,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff62961D),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image)
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              name,

                              style: _titleStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "hdfu",
//                        formatDate(newsDate),
                        style: _dateStyle,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(

                            padding: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            width: 45,

                            child: Row(
                              children: [
                                Icon(Icons.star, size: 14, color: Colors.white,),
                                Text("0.0", style: TextStyle(fontSize: 12,color: Colors.white),)
                              ],
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(

                            decoration: BoxDecoration(
                                color: kborderColor,

                                borderRadius: BorderRadius.circular(360)
                            ),
                            height: 6,
                            width: 6,
                          ),
                          SizedBox(width: 8,),
                          Text(
                            "40Mins",
//                        formatDate(newsDate),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }


//  formatDate(String date) {
//    if (date == null) {
//      return date ?? "";
//    }
//
//    var fmtDate = DateFormat.yMMMd().format(DateTime.parse(date));
//
//    return fmtDate.toString();
//  }
}