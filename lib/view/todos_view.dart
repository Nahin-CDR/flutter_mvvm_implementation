import 'package:clean_code/resources/color.dart';
import 'package:clean_code/view_model/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';



class TodosView extends StatefulWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {

  TodosViewViewModel todosViewViewModel = TodosViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todosViewViewModel.fetchAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black54
        ),
        backgroundColor: Colors.white,
        title: const Text("Todos View",style: TextStyle(color: Colors.black54)),
      ),
      body: ChangeNotifierProvider<TodosViewViewModel>(
        create: (BuildContext context)=>todosViewViewModel,
        child: Consumer<TodosViewViewModel>(
          builder: (context,value,_){
            switch(value.todos.status){
              case Status.loading:
                return const Center(child: CircularProgressIndicator(color:AppColors.primaryColor,strokeWidth: 1,));
              case Status.completed:
                return ListView.builder(
                    itemBuilder:(context,index){
                      bool isCompleted = value.todos.data!.data[index].completed;
                      String title = value.todos.data!.data[index].title.toString();
                      dynamic id = value.todos.data!.data[index].id;
                      return Container(
                        padding:const EdgeInsets.only(left: 10,bottom: 15,top: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color:isCompleted?Colors.green.withOpacity(0.4):Colors.deepOrange.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:const Offset(0, 3),
                              ),
                            ]
                        ),
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(id.toString(),style:const TextStyle(color: Colors.blueGrey)),
                                Container(
                                  margin:const EdgeInsets.only(bottom: 10,left: 5,top: 8),
                                  child:  isCompleted?const Icon(Icons.done_all,color: Colors.green):const Icon(Icons.access_alarms_sharp,color: Colors.deepOrange),
                                ),
                              ],
                            ) ,
                            Text(title,style:const TextStyle(color: Colors.blueGrey)),

                          ],
                        ),
                      );
                    });
              default:
                return Text("default");
            }
          },
        ),
      ),
    );
  }
}
