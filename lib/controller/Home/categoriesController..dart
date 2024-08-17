import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/CategoriesModel.dart';
import 'package:ecommerce_pro/data/repo/Categories/repoCateg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<ResultState<CategModel>> {
  CategoriesCubit(this.catrepo) : super(const Idle());

  static CategoriesCubit get(context) => BlocProvider.of(context);
  final CategoriesReop catrepo;
  List<Categories>? cat;
  CategModel? categModel;

  void getallCategories() async {
    var data = await catrepo.categoriesReopstry();
    data.when(success: (categModel) {
      cat = categModel.categories!;
      emit(ResultState.success(categModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
