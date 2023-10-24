import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qara/add_product/ui/add_product.dart';
import 'package:qara/login/ui/login.dart';
import 'package:qara/page1/logic/pagecubit.dart';

import '../logic/pagestate.dart';

class Paggg extends StatelessWidget {
  const Paggg({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Pagecubit(),
      child: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
    context.read<Pagecubit>().getPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Pagecubit, Pagestate>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            leading: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.add_box_outlined),
                  iconSize: 20,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProduct(),
                        ));
                  },
                ),
                Text('Add Product')
              ],
            ),
            title: Center(
              child: Text(
                'All Products',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_sharp))
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: state.isloading
                  ? CircularProgressIndicator()
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        var product = state.products[index];

                        return Expanded(
                          child: Row(
                            children: [
                              Image.network(
                                product.images[0],
                                height: 150,
                                width: 150,
                              ),
                              const SizedBox(width: 20),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(106, 245, 245, 245)),
                                child: Column(
                                  children: [
                                    Text(product.title),
                                    const SizedBox(height: 20),
                                    Text(
                                      product.description,
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text('price : ${product.price}'),
                                    const SizedBox(height: 20),
                                    Text(
                                        'discountPercentage : ${product.discountPercentage.toString()}'),
                                    const SizedBox(height: 20),
                                    Text(
                                        'rating : ${product.rating.toString()}'),
                                    const SizedBox(height: 20),
                                    Text('stock : ${product.stock.toString()}'),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
