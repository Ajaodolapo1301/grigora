


//Gender Dialog
import 'package:flutter/material.dart';
import 'package:grigora/constants/colorConstants.dart';

titleDialog(context){


  showDialog(context: context, builder: (context){
    TextStyle s = TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: Colors.grey[800]);
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, ),
      content: SizedBox(
        height: 130,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,)
                    ),
                    labelText: "Demo Text",
                    labelStyle: const TextStyle(color: kborderColor, fontSize: 13),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: kborderColor, width: 0.0),
                    ),
                  )
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(

                color: Colors.grey.shade50,
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.location_on_outlined, ),
                    ),
                    Text("Detect Current Location", style: TextStyle(fontSize: 14),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  });
}