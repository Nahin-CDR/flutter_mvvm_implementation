import 'package:clean_code/repository/product_repository.dart';
import 'package:clean_code/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../resources/color.dart';


class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  ProductViewViewModel productViewViewModel = ProductViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productViewViewModel.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        shadowColor: Colors.blue.withOpacity(.2),
        leading: const BackButton(
            color: Colors.black54
        ),
        backgroundColor: Colors.white,
        title: const Text("Products View",style: TextStyle(color: Colors.black54)),
      ),
      body: ChangeNotifierProvider<ProductViewViewModel>(
        create: (BuildContext context)=>productViewViewModel,
        child: Consumer<ProductViewViewModel>(
          builder: (context,value,_){
            switch(value.products.status){
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 1),
                );
              case Status.completed:
                return Container(
                  padding: EdgeInsets.only(left: 15,right: 15,top: 15),
                  //margin:const EdgeInsets.all(0),
                  child: ListView(
                    children: [
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        itemCount: value.products.data!.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 5,right: 5,top: 5),
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
                            child: Center(
                              child: Image.network(value.products.data!.data[index].image.toString()),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              default:
                return const Text("Default");
            }
          },
        ),
      ),
    );
  }
}
