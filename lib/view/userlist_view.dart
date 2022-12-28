

import 'package:clean_code/resources/color.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../view_model/userlist_view_model.dart';



class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {

  UserListViewModel userViewModel = UserListViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userViewModel.fetchUserListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userListPreference = Provider.of<UserListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black54
        ),
        backgroundColor: Colors.white,
        title: const Text("User List",style: TextStyle(color: Colors.black54),),
      ),
      body: ChangeNotifierProvider<UserListViewModel>(
        create: (BuildContext context)=>userViewModel,
        child: Consumer<UserListViewModel>(
          builder: (context,value,_){
            switch(value.userListResponse.status){
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
              // TODO: Handle this case.
                return const Text(
                    "Error", style: TextStyle(color: Colors.red, fontSize: 30));
              case Status.completed:
                return ListView.builder(
                    itemCount: value.userListResponse.data?.data?.length,
                    itemBuilder: (context,index){
                    return Container(
                      margin:const EdgeInsets.only(left: 15,right: 15,top: 10),
                      child: ListTile(
                        onTap: (){
                          final String message = "This is ${"${value.userListResponse.data!.data![index].firstName} ${value.userListResponse.data!.data![index].lastName}"}";
                          Utils.toastMessage(message);
                        },
                        contentPadding:const EdgeInsets.all(5),
                        tileColor: Colors.grey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        selectedTileColor: Colors.orange[100],
                        isThreeLine: true,
                        title:  Text(value.userListResponse.data!.data![index].firstName.toString(),
                          style:const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15
                          ),
                        ),
                        leading: Image.network(value.userListResponse.data!.data![index].avatar.toString()),
                        subtitle: Text(value.userListResponse.data!.data![index].email.toString(),
                          style:const TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                    );
                });
              default:
                return const Text("Default");
            }
          },
        ),
      ),
    );
  }
}
