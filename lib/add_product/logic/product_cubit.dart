import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qara/add_product/data/ProductData.dart';
import 'package:qara/dio/dio.dart';

import 'producr_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductState());
  void addProduct(
    String name,
    
  ) async{
    emit(state.copywith(
      isloading: true,name: name,));
     final result = await DioHelper.postData(
        url: 'products/add',
         data: {'title': name,});
         ProductResponse response = ProductResponse.fromMap(result.data);
         emit(state.copywith(
           isloading: false,
           name: response.name,
         ));
         debugPrint(response.toString());



      
      
      }
      }
      