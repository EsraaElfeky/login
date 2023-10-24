import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              
              state.isloading? CircularProgressIndicator():
              
               ListView.separated(
                shrinkWrap: true,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  var product= state.products[index];

                  return Row(
                    children: [
                      Image.network(
                        product.images[0],
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(width: 20),
                       Column(
                        children: [
                           Text(product.title),
                          const SizedBox(height: 20),
                          Text(product.description),
                          const SizedBox(height: 20),
                          Text('price  /${product.price}'), 
                          const SizedBox(height: 20),
                          Text('discountPercentage / ${ product.discountPercentage.toString()}'),
                          const SizedBox(height: 20),
                          Text('rating  /${product.rating.toString()}'),
                          const SizedBox(height: 20),
                          Text('stock  /${product.stock.toString()}'),
                          const SizedBox(height: 20),


                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
