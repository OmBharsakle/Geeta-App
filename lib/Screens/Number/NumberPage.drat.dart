import 'package:flutter/material.dart';
import 'package:geeta_app/Screens/Read/View/Read_Page.dart';
import 'package:provider/provider.dart';
import '../../../Provider/GeetaProvider.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    HomeProvider homeProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text('अध्याय :- ${homeProvider.openAdhyayStoreIndex+1} ',style: TextStyle(fontWeight: FontWeight.w600),),
        actions: [

          PopupMenuButton(
            icon: Icon(Icons.translate_rounded),
            color: Colors.white,
            shadowColor: Colors.black,
            surfaceTintColor: Colors.white,
            elevation: 10,
            onSelected: (value) async {
              homeProviderFalse.changeLanguages(value);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'english',
                child: ListTile(
                  // leading: Icon(Icons.delete),
                  title: Text('English',style: TextStyle(color: Colors.black),),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'hindi',
                child: ListTile(
                  // leading: Icon(Icons.visibility_off_outlined),
                  title: Text('Hindi',style: TextStyle(color: Colors.black),),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'gujarati',
                child: ListTile(
                  // leading: Icon(Icons.select_all),
                  title: Text('Gujarati',style: TextStyle(color: Colors.black),),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'sanskrit',
                child: ListTile(
                  // leading: Icon(Icons.select_all),
                  title: Text('Sanskrit',style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
          ),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.bookmark_add_outlined)),
          SizedBox(width: 5,),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, childAspectRatio: 9/10,
        ),
        itemCount: homeProvider.geetaList[homeProvider.openAdhyayStoreIndex].languages.sanskrit.length, // Total number of items
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(4.0),
            color: Colors.grey[100 * ((index % 9)+0)],
            child: InkWell(
              onTap: () {
                homeProviderFalse.openSlok(index);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReadPage(),));
              },
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),    );
  }
}

