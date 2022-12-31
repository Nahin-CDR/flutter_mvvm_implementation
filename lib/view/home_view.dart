import 'package:clean_code/resources/color.dart';
import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:clean_code/view_model/home_view_model.dart';
import 'package:clean_code/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  UserViewModel userPreference = UserViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewViewModel.fetchMoviesListApi();

  }

  @override
  Widget build(BuildContext context) {
    //final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:const Text("Home",style: TextStyle(color: Colors.black54),),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.todos);
            },
            child:Container(
              margin:const EdgeInsets.all(10),
              child:const Icon(Icons.list,color: Colors.black54,),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.photos);
            },
            child:Container(
              margin:const EdgeInsets.all(10),
              child:const Icon(Icons.photo_camera_outlined,color: Colors.black54,),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.comments);
            },
            child:Container(
              margin:const EdgeInsets.all(10),
              child:const Icon(Icons.comment,color: Colors.black54,),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.album);
            },
            child:Container(
              margin:const EdgeInsets.all(10),
              child:const Icon(Icons.all_inbox,color: Colors.black54,),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.userList);
            },
            child:Container(
              margin:const EdgeInsets.all(10),
              child:const Icon(Icons.supervised_user_circle_rounded,color: Colors.black54,),
            ),
          ),
          InkWell(
            onTap: () {
              userPreference.remove().then((value) => Navigator.pushNamed(context, RoutesName.login));
              Navigator.pop(context);
            },
            child:Container(
              margin:const EdgeInsets.all(10),
              child:const Icon(Icons.logout,color: Colors.black54
            ),
          ),
        )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create:(BuildContext context)=> homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context,value,_){
            switch(value.moviesList.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primaryColor),
                );
              case Status.error:
              // TODO: Handle this case.
                return const Text(
                    "Error", style: TextStyle(color: Colors.red, fontSize: 30));
              case Status.completed:
              // TODO: Handle this case.
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onLongPress: (){
                          final String message = value.moviesList.data!.movies![index].storyline.toString();
                          // Utils.toastMessage(message);
                          Utils.flushBarErrorMessage(message: "storyLine : $message",context:  context,duration: 10);
                        },
                        onTap: (){
                          final String message = value.moviesList.data!.movies![index].releaseDate.toString();
                         // Utils.toastMessage(message);
                          Utils.flushBarErrorMessage(message:  "release Date : $message",context:context,duration:3);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(.1),
                                  spreadRadius: 4,
                                  blurRadius: 2,
                                  offset: const Offset(0, 1), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 150,
                          margin:const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin:const EdgeInsets.only(left: 30),
                                    child: Image.network(value.moviesList.data!.movies![index].posterurl.toString(),
                                      height: 100,
                                      errorBuilder: (context, url, error) =>const Icon(
                                          Icons.error,size: 50,
                                          color: Colors.deepOrange
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:const EdgeInsets.only(left: 20),
                                        child: Text(value.moviesList.data!.movies![index].title.toString(),
                                            style:const TextStyle(color: AppColors.primaryColor)
                                        ),
                                      ),
                                      Container(
                                        margin:const EdgeInsets.only(left: 20),
                                        child: Text("Genres : ${value.moviesList.data!.movies![index].genres.toString()}",
                                            style:const TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 10
                                            )
                                        ),
                                      ),
                                      Container(
                                          margin:const EdgeInsets.only(left: 20,top: 10),
                                          width: MediaQuery.of(context).size.width/2,
                                          child: Text("Actors : ${value.moviesList.data!.movies![index].actors.toString()}",
                                            style:const TextStyle(
                                                fontSize: 10,
                                                color: Colors.blueGrey
                                            ),
                                          )
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                      );
                    }
                );
              default :
                return const Text("default");
            }
          },
        ),
      ),
    );
  }
}

