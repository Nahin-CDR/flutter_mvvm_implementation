import 'package:clean_code/resources/color.dart';
import 'package:clean_code/view_model/album_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../utils/utils.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({Key? key}) : super(key: key);

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {

  AlbumViewViewModel albumViewViewModel = AlbumViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    albumViewViewModel.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black54
        ),
        backgroundColor: Colors.white,
        title: const Text("Album",style: TextStyle(color: Colors.black54),),
      ),
      body: ChangeNotifierProvider<AlbumViewViewModel>(
        create: (BuildContext context)=>albumViewViewModel,
        child: Consumer<AlbumViewViewModel>(
          builder: (context,value,_){
            switch(value.albums.status){
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 1),
                );
              case Status.error:
                return const Center(child: Text("Error",style: TextStyle(color: Colors.red)));
              case Status.completed:
                return ListView.builder(
                    itemCount: value.albums.data?.data.length,
                    itemBuilder: (context,index){
                      return Container(
                        margin:const EdgeInsets.all(5),
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onTap: (){
                            Utils.toastMessage("Album no : ${index+1}");
                          },
                          title: Text(value.albums.data!.data[index].title.toString(),
                              style:const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                fontWeight: FontWeight.w400
                              )
                          ),
                          leading: Text(value.albums.data!.data[index].id.toString(),
                              style:const TextStyle(color: Colors.black54,fontSize: 25)),
                          tileColor: Colors.grey.withOpacity(.1),
                          textColor: Colors.blueAccent,
                          iconColor: Colors.blue,
                        ),
                      );
                });
              default:
                return const Text("");
            }
          },
        ),
      )
    );
  }
}
