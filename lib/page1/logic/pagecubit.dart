import 'package:qara/dio/dio.dart';
import 'package:qara/page1/logic/pagestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/product_module.dart';

class Pagecubit extends Cubit<Pagestate> {
  Pagecubit() : super(Pagestate());
  void getPage() async {
    emit(state.copywith(isloading: true));
    final result = await DioHelper.getData(url: 'products', query: {});

    print(result.data['products']
        .map<ProductModule>((x) => ProductModule.fromMap(x))
        .toList());
emit(state.copywith(isloading: false,products:result.data['products']
        .map<ProductModule>((x) => ProductModule.fromMap(x))
        .toList() ));
    // ProductModule response = ProductModule.fromMap(result.data);
  }
}
