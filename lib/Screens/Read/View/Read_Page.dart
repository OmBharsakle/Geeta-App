import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/GeetaProvider.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                color: Colors.yellow.shade200,
                borderRadius: BorderRadius.circular(15),
                border: Border(bottom: BorderSide(color: Colors.yellow.shade400,width: 10))
              ),
              alignment: Alignment.center,
              child: Container(
                width: 350,
                child: Text(
                  (homeProvider.language == 'sanskrit')
                      ? homeProvider.geetaList[homeProvider.openAdhyayStoreIndex].languages.sanskrit[homeProvider.openSlokStoreIndex]
                      : (homeProvider.language == 'english')
                      ? homeProvider.geetaList[homeProvider.openAdhyayStoreIndex].languages.english[homeProvider.openSlokStoreIndex]
                      : (homeProvider.language == 'hindi')
                      ? homeProvider.geetaList[homeProvider.openAdhyayStoreIndex].languages.hindi[homeProvider.openSlokStoreIndex]
                      : (homeProvider.language == 'gujarati')
                      ? homeProvider.geetaList[homeProvider.openAdhyayStoreIndex].languages.gujarati[homeProvider.openSlokStoreIndex]
                      : '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 100,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

