import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(String email, String password);
  Future<UserModel> getProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<String> login(String email, String password) async {
    final response = await apiClient.dio.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );

    // Asumsi token dikembalikan di res.data.data.token
    return response.data['data']['token'];
  }

  @override
  Future<UserModel> getProfile() async {
    final response = await apiClient.dio.get(ApiConstants.me);
    final apiResponse = ApiResponse<UserModel>.fromJson(
      response.data,
      (data) => UserModel.fromJson(data['user'] as Map<String, dynamic>),
    );
    return apiResponse.data;
  }
}
