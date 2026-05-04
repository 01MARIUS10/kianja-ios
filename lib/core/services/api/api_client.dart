// import 'package:dio/dio.dart';
// import 'package:kianja/core/services/service_helper.dart';

// /// Contract for models that can deserialize JSON.
// abstract class JsonModel<T> {
//   T fromJson(Map<String, dynamic> json);
// }

// /// Contract for input models that can serialize JSON.
// abstract class JsonInput {
//   Map<String, dynamic> toJson();
// }

// abstract class ApiClient {
//   const ApiClient({required this.dio});

//   final Dio dio;

//   Future<OutputModel> get<OutputModel extends JsonModel<OutputModel>>(
//     String api, {
//     required OutputModel outputModel,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     return requestHandler(() async {
//       final response = await dio.get(api, queryParameters: queryParameters);

//       final result = jsonHandler(response.data);
//       return outputModel.fromJson(result);
//     });
//   }

//   Future<OutputModel> post<OutputModel extends JsonModel<OutputModel>>(
//     String api, {
//     JsonInput? inputModel,
//     required OutputModel outputModel,
//   }) async {
//     return requestHandler(() async {
//       final response = await dio.post(api, data: inputModel?.toJson());

//       final result = jsonHandler(response.data);
//       return outputModel.fromJson(result);
//     });
//   }

//   Future<OutputModel> put<OutputModel extends JsonModel<OutputModel>>(
//     String api, {
//     JsonInput? inputModel,
//     required OutputModel outputModel,
//   }) async {
//     return requestHandler(() async {
//       final response = await dio.put(api, data: inputModel?.toJson());

//       final result = jsonHandler(response.data);
//       return outputModel.fromJson(result);
//     });
//   }

//   Future<void> delete(String api, {JsonInput? inputModel}) async {
//     return requestHandler(() async {
//       await dio.delete(api, data: inputModel?.toJson());
//     });
//   }
// }
