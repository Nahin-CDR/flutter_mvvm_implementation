
import 'package:clean_code/data/response/status.dart';
import 'package:clean_code/model/comment_model.dart';
import 'package:clean_code/repository/comments_repository.dart';
import 'package:clean_code/resources/color.dart';
import 'package:clean_code/view_model/comment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class CommentView extends StatefulWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {


  CommentViewViewModel commentViewViewModel = CommentViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentViewViewModel.fetchComments();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black54
        ),
        backgroundColor: Colors.white,
        title: const Text("Comments",style: TextStyle(color: Colors.black54)),
      ),
      body: ChangeNotifierProvider<CommentViewViewModel>(
        create: (BuildContext context)=>commentViewViewModel,
        child: Consumer<CommentViewViewModel>(
          builder: (context,value,_){
            switch(value.comments.status){
              case Status.loading:
                return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 1));
              case Status.error:
                return const Center(child: Text("error"));
              case Status.completed:
                return ListView.builder(
                  itemCount: value.comments.data!.data.length,
                    itemBuilder:(context,index){
                      return Container(
                        decoration: BoxDecoration(
                          //color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:const Offset(0, 3),
                              ),
                            ]
                        ),
                        margin:const EdgeInsets.only(left: 15,right: 15,top: 25),
                        child: ListTile(
                          onTap: (){
                            Utils.flushBarErrorMessage(message: value.comments.data!.data[index].body.toString(),
                                context: context, duration: 5);
                          },
                          title:  Text(value.comments.data!.data[index].email.toString()),
                          leading: Container(
                            margin:const EdgeInsets.only(top: 5),
                            child: Text("ID : ${value.comments.data!.data[index].id}"),),
                          tileColor: Colors.white,//.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.blueAccent.withOpacity(.2),
                            ),
                          ),
                        contentPadding:const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                      ),
                      );
                    }
                );
              default:
                return const Text("default");
            }
          },
        ),
      ),
    );
  }
}
