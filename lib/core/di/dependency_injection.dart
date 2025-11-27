import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/datasources/home_remote_data_source.dart';
import '../../data/datasources/recipe_remote_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../data/repositories/recipe_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../../domain/usecases/get_home_data.dart';
import '../../domain/usecases/get_recipe_detail.dart';

void initDependencies() {
  Get.lazyPut<http.Client>(() => http.Client());

  Get.lazyPut<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: Get.find()),
  );
  Get.lazyPut<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(client: Get.find()),
  );

  Get.lazyPut<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: Get.find()),
  );
  Get.lazyPut<RecipeRepository>(
    () => RecipeRepositoryImpl(remoteDataSource: Get.find()),
  );

  Get.lazyPut<GetHomeDataUseCase>(
    () => GetHomeDataUseCase(Get.find()),
  );
  Get.lazyPut<GetRecipeDetailUseCase>(
    () => GetRecipeDetailUseCase(Get.find()),
  );
}
