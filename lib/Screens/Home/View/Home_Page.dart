import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeta_app/Screens/Read/View/Read_Page.dart';
import 'package:provider/provider.dart';

import '../../../Provider/GeetaProvider.dart';
import '../../Number/NumberPage.drat.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    HomeProvider homeProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('गीता अध्याय',style: TextStyle(fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: () {
            homeProviderFalse.darkMode();
          }, icon: homeProvider.isDark?Icon(CupertinoIcons.moon):Icon(CupertinoIcons.sun_max_fill)),
          // CircleAvatar(
          //   radius: 20,
          // ),
          SizedBox(width: 5,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(homeProvider.geetaList.length, (index) => GestureDetector(
                onTap: () {
                  homeProviderFalse.openAdhyayNumber(index);
                  print(homeProvider.openAdhyayStoreIndex);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NumberPage(),));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(homeProvider.geetaList[index].image),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black,],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Spacer(),
                              Text(homeProvider.geetaList[index].title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Text(homeProvider.geetaList[index].subTitle,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                              SizedBox(height: 8,),
                              Container(
                                width: double.infinity,
                                height: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.redAccent
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('50%',style: TextStyle(color: Colors.white),),
                                  Text('कुल श्लोक :- ${homeProvider.geetaList[index].languages.hindi.length}',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              SizedBox(height: 12,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
      drawer: Drawer(
          child: Column(
            children: [

            ],
          ),
      ),
    );
  }
}
