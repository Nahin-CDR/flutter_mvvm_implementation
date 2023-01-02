import 'package:clean_code/view_model/photo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../resources/color.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {

  PhotoViewViewModel photoViewViewModel = PhotoViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    photoViewViewModel.fetchPhotoFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black54
        ),
        backgroundColor: Colors.white,
        title: const Text("Photo View",style: TextStyle(color: Colors.black54)),
      ),
      body: ChangeNotifierProvider<PhotoViewViewModel>(
        create: (BuildContext context)=>photoViewViewModel,
        child: Consumer<PhotoViewViewModel>(
          builder: (context,value,_){
            switch(value.photos.status){
              case Status.loading:
                return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
              case Status.error:
                return const Center(child: Text("Error"));
              case Status.completed:
                if(value.photos.data == null){
                  return Center(
                    child: Text("Server didn't serve data :(",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        color: Colors.black87.withOpacity(.6)
                    )),
                  );
                }else{
                  return ListView.builder(
                      itemCount: value.photos.data!.data.length,
                      itemBuilder: (context,index){
                        print(value.photos.data!.data[index].url.toString());
                        return Container(
                          margin:const EdgeInsets.all(15),
                          child: Image.network(
                            value.photos.data!.data[index].url.toString(),
                            errorBuilder: (context, url, error) =>const Icon(
                                Icons.error,size: 50,
                                color: Colors.deepOrange
                            ),
                          ),
                        );
                      });
                }

              default:
                return const Text("Default");
            }
          },
        ),
      ),
    );
  }
}
