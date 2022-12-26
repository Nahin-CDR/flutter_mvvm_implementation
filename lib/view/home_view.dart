import 'package:clean_code/resources/color.dart';
import 'package:clean_code/utils/routes/routes_name.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewViewModel.fetchMoviesListApi();

  }

  @override
  Widget build(BuildContext context) {


    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text("Home"),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
          userPreference.remove().then((value) => Navigator.pushNamed(context, RoutesName.login));
        },
        child:Container(
          margin:const EdgeInsets.all(10),
          child:const Icon(Icons.logout,color: Colors.white,),
        ),
      )]),
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
                      return Card(
                        child: ListTile(
                          title: Text(value.moviesList.data!.movies![index].title.toString(),
                            style: TextStyle(
                              color: AppColors.primaryColor.withOpacity(.8),
                              fontSize: 16,
                            ),
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

