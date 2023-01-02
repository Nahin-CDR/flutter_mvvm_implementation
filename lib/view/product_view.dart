import 'package:clean_code/resources/components/product_view_components/product_container.dart';
import 'package:clean_code/utils/routes/routes_name.dart';
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
              case Status.error:
                return const Center(
                  child: Text("Error Occurred !",style: TextStyle(color: Colors.deepOrange,fontSize: 20),),
                );
              case Status.completed:
                if(value.products.data == null){
                  return  Center(
                    child: Text("Server didn't serve data :(",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        color: Colors.black87.withOpacity(.6)
                    )),
                  );
                }else{
                  return Container(
                    padding:const EdgeInsets.only(left: 15,right: 15,top: 15),
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
                            return InkWell(
                              onTap: (){
                                Navigator.pushNamed(
                                    context,
                                    RoutesName.productDetails,
                                    arguments: ProductArguments(
                                        id: value.products.data!.data[index].id,
                                        title: value.products.data!.data[index].title,
                                        price: value.products.data!.data[index].price,
                                        description: value.products.data!.data[index].description,
                                        category: value.products.data!.data[index].category,
                                        image: value.products.data!.data[index].image,
                                        rating: value.products.data!.data[index].rating
                                    )
                                );
                              },
                              child: productContainer(imgUrl: value.products.data!.data[index].image.toString()),
                            );
                          },
                        )
                      ],
                    ),
                  );
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


class ProductArguments{
  dynamic id;
  dynamic title;
  dynamic price;
  dynamic description;
  dynamic category;
  dynamic image;
  dynamic rating;

  ProductArguments({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating
  });
}