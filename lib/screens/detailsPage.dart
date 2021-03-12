
import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grigora/constants/colorConstants.dart';
import 'package:grigora/model/featuredmodel.dart';
import 'package:grigora/provider/restaurantState.dart';
import 'package:grigora/reusables/restaurantNearYou.dart';
import 'package:grigora/reusables/vertical.dart';
import 'package:grigora/screens/homePage.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details>  with AfterLayoutMixin<Details>{
  String _dropDownValue;
DetailsModel detailsModel;
  RestaurantState restaurantState;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    restaurantState = Provider.of<RestaurantState>(context);

   return Scaffold(
      body: Container(

        child: CustomScrollView(
            slivers:[
     isLoading ?  _beforeDataLoaded() : AppBar(detailsModel: detailsModel,),


              SliverList(
                  delegate: SliverChildListDelegate(
                      [

                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                            width: 200,
                            margin: EdgeInsets.only( top: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text.rich(
                                  TextSpan(text: 'Featured ', style: TextStyle(fontWeight: FontWeight.w500, color: kborderColor, fontSize: 15),
                                      children: <TextSpan>[
                                        TextSpan(text: 'items ', style: TextStyle( fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15 )),


                                      ]
                                  ),



                                ),
                                SizedBox(height: 5,),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                      ]
                  )
              ),

              isLoading ?  _beforeDataLoaded() :            SliverList(
                  delegate: SliverChildListDelegate(
                      [

                        CategoriesEvents(
                          restaurant: detailsModel.featureModel,
                        ),

                      ]
                  )
              ),



              SliverList(
                  delegate: SliverChildListDelegate(
                      [

                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                            width: 200,
                            margin: EdgeInsets.only( top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text.rich(
                                  TextSpan(text: 'Daily Meals & Diets ', style: TextStyle(fontWeight: FontWeight.w500,  fontSize: 15),
                                      children: <TextSpan>[
//                                        TextSpan(text: 'items ', style: TextStyle( fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15 )),


                                      ]
                                  ),



                                ),
                                SizedBox(height: 5,),
                                Text("Daily meals & Diets", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                      ]
                  )
              ),
        restaurantState.restaurantModel.isEmpty? _beforeDataEmpty()  :       SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                sliver: RestaurantNearYou(
                  resturant: restaurantState.restaurantModel,
                ),
              ),

            ]



        ),
      ),
    );;
  }

  @override
  void afterFirstLayout(BuildContext context) {
  getDetails();
  }

  Widget _beforeDataLoaded() {
    return new SliverFillRemaining(
      child:  new Container(
        child: new Center(
          child: new CupertinoActivityIndicator(

          ),
        ),
      ),
    );
  }

  Widget _beforeDataEmpty() {
    return new SliverFillRemaining(
      child:  new Container(
        child: new Center(
          child: Text("Cant fetch data"),
        ),
      ),
    );
  }

  getDetails()async{
    setState(() {
      isLoading = true;
    });
    var result = await  restaurantState.getDetails();
    print(result);
    setState(() {
      isLoading = false;
    });
    if(result["error"] == false){
      setState(() {
        detailsModel = result["details"];
      });
    }

  }
}



class AppBar extends StatelessWidget {
  final DetailsModel detailsModel;
  AppBar({this.detailsModel});
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      pinned: false,
      floating: true,
      expandedHeight: 410,
      flexibleSpace: Stack(


        children: [


          Positioned.fill(
              child: Image.network(
                detailsModel.restaurant_image,
                fit: BoxFit.cover,
              )),

          Container(

            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.black87
            ),


          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  CircleAvatar(
                    backgroundImage: NetworkImage(detailsModel.restaurant_profile_image),
                    backgroundColor: Colors.red,
                    radius: 40,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Column(
                      children: [
                        Text(detailsModel.restaurant_name ?? "", style: TextStyle(color: Colors.white, fontSize: 30),),
                        SizedBox(height: 10,),
                        Text(detailsModel.cuisines),
                        Row(
                          children: [
                            Icon(Icons.star_border, color: Colors.white,),
                            SizedBox(width: 6,),
                            Text("4.3 (3 Reviews)", style: TextStyle(color: Colors.white, fontSize: 14, )),
                            SizedBox(width: 6,),
                            Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,

                                  borderRadius: BorderRadius.circular(360)
                              ),
                              height: 6,
                              width: 6,
                            ),

                            SizedBox(width: 6,),
                            Text("2.13 KM Away", style: TextStyle(color: Colors.white, fontSize: 14, ))
                          ],
                        ),

                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Open", style: TextStyle(color: Colors.green, fontSize: 14, )),
                            SizedBox(width: 6,),
                            Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,

                                  borderRadius: BorderRadius.circular(360)
                              ),
                              height: 6,
                              width: 6,
                            ),
                            SizedBox(width: 6,),
                            Icon(Icons.warning_amber_rounded, size: 15, color: Colors.white,),

                            InkWell(
                                onTap: ()=> showBVNDialog(context),
                                child: Text("More info".toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 14, )))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(color: Colors.grey,),
                        SizedBox(height: 10,),

                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Min. order",style: TextStyle(color: kborderColor, fontSize: 14, ) ),
                                Text("N200", style: TextStyle(color: Colors.white, fontSize: 14, ))

                              ],
                            ),
                            Column(
                              children: [
                                Text("Prep time",style: TextStyle(color: kborderColor, fontSize: 14, ) ),
                                Text("40 min", style: TextStyle(color: Colors.white, fontSize: 14, ))

                              ],
                            ),
                            Column(
                              children: [
                                Text("Delivery fee",style: TextStyle(color: kborderColor, fontSize: 14, ) ),
                                Text("N250", style: TextStyle(color: Colors.white, fontSize: 14, ))

                              ],
                            )

                          ],
                        ),
                        SizedBox(height: 15,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Expanded(
                              flex: 3,
                              child : Container(
                                height: 30,
//                                          width: 100,
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(40),

                                    color: Colors.white

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, right: 5),
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(child: Text("Pickup time")),


                                      Container(
                                        width: 1,
                                        height: double.maxFinite,
                                        color: Colors.grey,
                                      ),

                              Icon(Icons.keyboard_arrow_down_rounded)

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              flex:3,
                              child: Container(
                                height: 30,
//                                          width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(40),

                                    color: Colors.transparent

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.person, color: Colors.white, size: 14,),

                                      Text("Start group order", style: TextStyle(color: Colors.white, fontSize: 11, ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],

                        ),
                        SizedBox(height: 10,),
                        Text("choose a menu", style: TextStyle(color: kborderColor, fontSize: 14, )),
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(40),

                              color: Colors.transparent

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Expanded(
                                    child: Center(child: Text("All time", style: TextStyle(color: Colors.white, fontSize: 11, )))),

                                Container(

                                    width: 50,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(

                                        elevation: 0,
//                                                    hint: Text(
//                                                      _dropDownValue,
//                                                      style: TextStyle(color: kprimaryGreen),
//                                                    ),
                                        isExpanded: true,
                                        iconSize: 25.0,

                                        icon: Icon(Icons.arrow_drop_down),

                                        style: TextStyle(color: kprimaryGreen),
                                        items: ['Monthly', 'Weekly', 'Daily'].map(
                                              (val) {
                                            return DropdownMenuItem<String>(
                                              value: val,
                                              child: Text(val),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (val) {
//                                        setState(
//                                              () {
//                                            _dropDownValue = val;
//                                          },
//                                        );
                                        },
                                      ),
                                    )

                                ),

                              ],
                            ),
                          ),
                        )




                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }

  void showBVNDialog(context) async {

    String bvn = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:   Colors.white,
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(detailsModel.restaurant_name,style: TextStyle(fontSize: 20), ),
              SizedBox(height: 20,),
                  PopUp(
                    icons: Icons.location_on_outlined,
                    text: "Address",
                    subText: detailsModel.address,
                  ),
                  PopUp(
                    icons: Icons.schedule_sharp,
                    text: "Opening time",
                    subText: detailsModel.opening_time,
                  ),
                  PopUp(
                    icons: Icons.lock_clock,
                    text: "Closing time",
                    subText: detailsModel.closing_time,
                  ),
                  PopUp(
                    icons: Icons.star_outline_sharp,
                    text: "Average rating",
                    subText: "${detailsModel.total_rating.toString()} stars",
                  ),
                ],
              ),
            ),
          );
        });
    print(bvn);
    if (bvn != null && bvn !=  "" ) {

      return;
    }else{
//      Navigator.pop(context);
    }
  }
}


class PopUp extends StatelessWidget {
  final IconData icons;
  final String text;
  final String subText;
  PopUp({this.text, this.icons, this.subText});
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(

            children: [
              Icon(icons, color: kborderColor, ),
              SizedBox(width: 10,),
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text ?? "", style: TextStyle(fontSize: 20,  fontWeight: FontWeight.w600), ),
                  Container(
                      width: 200,
                      child: Text(subText ?? "", style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600),)),
                ],
              )
            ],
          )
        ],

      ),
    )
    ;
  }
}
