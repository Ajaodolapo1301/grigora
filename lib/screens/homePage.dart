import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grigora/constants/colorConstants.dart';
import 'package:grigora/model/restuarants.dart';
import 'package:grigora/provider/restaurantState.dart';

import 'package:grigora/reusables/restaurantNearYou.dart';
import 'package:grigora/reusables/titleDialog.dart';
import 'package:grigora/reusables/vertical.dart';
import 'package:grigora/screens/detailsPage.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with AfterLayoutMixin<MyHomePage>  {
RestaurantState restaurantState;
List<RestaurantModel> restaurantList = [];
final _scaffoldKey = GlobalKey<ScaffoldState>();
bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    restaurantState = Provider.of<RestaurantState>(context);

    return Scaffold(
      key: _scaffoldKey,
        endDrawer: Draw() ,
        body: SafeArea(
          child: Container(

            child: CustomScrollView(
              slivers:[
              SliverAppBar(
                snap: false,
                backgroundColor: Colors.white,
                pinned: true,
                floating: true,

                flexibleSpace: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10),

                  child: Row(

//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
//                    Spacer(),

                      Center(
                        child: RaisedButton(
                          onPressed: (){
                            titleDialog(context);
                          },
                          elevation: 0,
                            disabledColor: Colors.transparent,
                          color: Colors.white,
                          child: Row(
                            children: [

                              Icon(Icons.location_on_outlined),
                              Text(
                                "Wuse 2, Abuja".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),

                              Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey, size: 15,),
                            ],
                          ),
                        ),
                      ),
//                      Spacer(),

                        IconButton(icon:  Icon(Icons.view_headline), onPressed: _openDrawer),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
                primary: true,

              ),


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
                                    TextSpan(text: 'New ', style: TextStyle(fontWeight: FontWeight.w500, color: kborderColor, fontSize: 15),
                                        children: <TextSpan>[
                                          TextSpan(text: 'in Grigora ', style: TextStyle( fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15 )),


                                        ]
                                    ),



                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(

                                          child: Text('Enjoy delicious meals from restaurants and vendors around you', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)),

                                      Container(
                                        child: Row(
                                          children: [
                                            InkWell(child: Text("View all", style: TextStyle(color: Colors.red, fontSize: 12),)),
                                            Icon(Icons.arrow_forward_outlined, size: 10,color: Colors.red ,)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
//                                  Text(loginState.user.name , style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 36),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                        ]
                    )
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                        [

            CategoriesEvents(
                restaurant: restaurantList,
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
                              margin: EdgeInsets.only( top: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  Text.rich(
                                    TextSpan(text: 'Restaurants ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                                        children: <TextSpan>[
                                          TextSpan(text: 'Near ', style: TextStyle(color: kborderColor, fontWeight: FontWeight.w500, fontSize: 15 )),
                                          TextSpan(text: 'You', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15 )
                                          )
                                        ]
                                    ),



                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(

                                          child: Text('Enjoy delicious meals from restaurants and vendors around you', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),)),

                                      Container(
                                        child: Row(
                                          children: [
                                            InkWell(child: Text("View all", style: TextStyle(color: Colors.red, fontSize: 12),)),
                                            Icon(Icons.arrow_forward_outlined, size: 10,color: Colors.red ,)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
//                                  Text(loginState.user.name , style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 36),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                        ]
                    )
                ),
        isLoading ?  _beforeDataLoaded() : restaurantList.isEmpty? _beforeDataEmpty()  :       SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  sliver: RestaurantNearYou(
                  resturant: restaurantList,
                  ),
                ),


              ]



            ),
          ),
        ),
    );
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
        child: Text("No Requests"),
      ),
    ),
  );
}

  @override
  void afterFirstLayout(BuildContext context) {
      getRestaurant();
  }

    getRestaurant()async{
      setState(() {
        isLoading = true;
      });
    var result = await restaurantState.getRestaurants();
      setState(() {
        isLoading = false;
      });
      if(result["error"] == false){
        setState(() {
          restaurantList = result["restaurantList"];
        });
      }else{
        showInSnackBar(result["message"]);
      }


    }
void showInSnackBar(String value) {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  _scaffoldKey.currentState.showSnackBar(new SnackBar(
    content: new Text(value),
    backgroundColor: Colors.redAccent,
    duration: Duration(seconds: 3),
  ));
}




  void _openDrawer() {
_scaffoldKey.currentState.openEndDrawer();
  }



}



class  Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(),
    );
  }
}



