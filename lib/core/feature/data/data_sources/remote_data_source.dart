import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';import '../../../../injection_container.dart';
import '../../../app/state/appstate.dart';


import '../../../configurations/app_configuration.dart';
import '../../../constants.dart';
import '../../../exceptions/app_exceptions.dart';
import '../models/params/params_model.dart';

abstract class RemoteDataSource {
  // Client client = Client();
  final baseUrl = AppConfigurations.baseUrl;
  var token;
  String? refreshToken;
  static final _dio = Dio(BaseOptions(
    receiveTimeout: 30000, // 15 seconds
    connectTimeout: 30000,
    sendTimeout: 30000,
  ),);
  static final _tokenDio = Dio(BaseOptions(
    receiveTimeout: 30000, // 15 seconds
    connectTimeout: 30000,
    sendTimeout: 30000,
  ),);

  Map<String, String> headers = {};
  Map<String, String> headersRefrsh = {};

  RemoteDataSource() {
    // add base headers
    headers.addAll(AppConfigurations.baseHeaders);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _tokenDio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  void initHeaders(headers) {
    // token header
    // token = sl<AppStateModel>().userToken;
    // refreshToken = sl<AppStateModel>().refreshToken;
    // print('token :$token');
    // if (token != null) headers.addAll({"Authorization": "Bearer $token"});


    // other headers
    // this.headers.addAll(headers ?? {});

    if (kDebugMode) {
      print(headers);
    }
  }

  checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }
  }

   Map<String, String> authorizeRequest(ParamsModel model,Map<String,String> headers) {
    if (model.authorized && model.isBasicAuth) {
      String basicAuth =
          'Basic ' +
              base64.encode(utf8.encode('${AppConfigurations.RedditId}:'));
      headers.putIfAbsent('authorization', () => basicAuth);
    }
    else if(model.authorized) {
      headers.putIfAbsent(
          'Authorization', () => 'Bearer ${sl<AppStateModel>().authInfo?.accessToken}');
    }
    return headers;
  }

  Future<dynamic> get(ParamsModel model) async {
    var responseJson;

    try {
      initHeaders(headers);
      var headersToSend = <String,String>{};
      headersToSend.addAll(this.headers);
      headersToSend = authorizeRequest(model,headersToSend);
      await checkConnectivity();
      final url = model.baseUrl ?? baseUrl;
      if (kDebugMode) {
        print('get request url:${url + model.url.toString()}');
        print('get request url params:${model.urlParams}');
      }
      final response = await _dio.get(
        url + model.url.toString(),
        options: Options(
          headers: headersToSend,
          responseType: ResponseType.plain,
        ),
        queryParameters: model.urlParams,
      );
      responseJson = _returnResponse(response);
      if (kDebugMode) {
        print('get response: $responseJson');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (e.response == null) throw NoInternetException();
      _returnResponse(e.response!);
    }on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> post(ParamsModel model) async {
    Response response;
    var responseJson;
    try {
      initHeaders(headers);
      await checkConnectivity();
      var headersToSend = <String,String>{};
      headersToSend.addAll(this.headers);
      headersToSend = authorizeRequest(model,headersToSend);
      print('post request body :${json.encode(model.body?.toJson() ?? '')}');

      final url = model.baseUrl ?? baseUrl;
      response = await _dio.post(
        url + model.url.toString(),
        data: FormData.fromMap(model.body?.toJson() ?? {}) ,
        queryParameters: model.urlParams,
        options:
            Options(headers: headersToSend, responseType: ResponseType.plain),
      );
      if (kDebugMode) {
        print('post request completed');
      }

      if (response == null) throw FetchDataException();
//      responseJson = json.decode(response.body.toString());
      responseJson = _returnResponse(response);
      if (kDebugMode) {
        print('post response: $responseJson');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
        print(e.stackTrace);
      }
      if (e.response == null) throw NoInternetException();
      _returnResponse(e.response!);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    final responseJson = response.toString().isEmpty
        ? null
        : json.decode(response.toString());

    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
        if (responseJson['error']['message'] == 'Invalid refresh token.') {
          throw SessionTimedOutException();
        }
        throw InvalidInputException(
          message: responseJson['error']['message'],
          //data: responseJson
        );
      case 409:
        throw InvalidInputException(
          message: responseJson['error']['message'],
          //data: responseJson
        );

      case 401:
      case 403:
        throw UnauthorisedException(data: responseJson,);
      case 404:
        throw NotFoundException(data: responseJson);
      case 500:
        throw ServerErrorException(data: responseJson);
      default:
        throw FetchDataException(
            message: kDebugMode
                ? 'Unknown Error'
                : response.data.toString(),);
    }
  }


  Future performRequest(ParamsModel model) async {
    switch (model.requestType!) {
      case RequestType.get:
        return await get(model);
      case RequestType.post:
        return await post(model);
      case RequestType.put:
        throw UnimplementedError();
      case RequestType.delete:
        throw UnimplementedError();
    }
  }

}
