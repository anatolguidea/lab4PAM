import '../../domain/entities/recipe_detail.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../datasources/recipe_remote_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<RecipeDetailData> loadDetails() {
    return remoteDataSource.fetchDetails();
  }
}
