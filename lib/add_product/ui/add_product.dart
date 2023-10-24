import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qara/add_product/logic/product_cubit.dart';
import 'package:qara/component/textformfeild.dart';

class AdProduct extends StatelessWidget {
  const AdProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit (),
      child: AddProduct(),
    );
  }
}

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var formkey = GlobalKey<FormState>();

  var searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Center(child: const Text('Add Product')),
          actions: [
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                })
          ]),
      body: Form(
        key: formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 20),
              defaultTFF(
                controller: searchcontroller,
                lable: 'Search',
                prefix: Icons.search,
                prefixClick: () {
                  print('object');
                },
                sufix: Icons.close,
                suffixClick: () {
                  searchcontroller.clear();
                },
                type: TextInputType.name,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'invalid_search';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 50),
              Container(
                height: 40,
                width: 200,
                child: MaterialButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      debugPrint(searchcontroller.text);
                      setState(() {});
                    }

                    ;
                    context.read<AddProductCubit>();
                  },
                  color: Colors.grey.shade700,
                  child: const Center(
                    child: Text(
                      'Add Product',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 40,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.2),
                  color: Colors.grey.shade700,
                ),
                child: Center(
                  child: Text(
                    '  Product:${searchcontroller.text}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
