import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequest {
  static final Dio _dio = Dio(_options);
  static final BaseOptions _options = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeOut);

  static Future<T> request<T>(
    String url, {
    String method = 'get',
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    if (url.isEmpty) {
      return Future.error('url不能为空');
    }
    if (!url.startsWith('/')) {
      url = '/' + url;
    }
    final Options options = Options(method: method);
    // 添加拦截器
    Interceptor requestInter = InterceptorsWrapper(
      /**
       * 请求拦截
       * 1.可在请求发出时添加页面loading效果
       * 2.可在请求发出时携带token
       * 3.可在请求发出时对参数进行一些处理
       */
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print('拦截了请求');
        handler.next(options);
      },
      // 响应拦截
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print('拦截了响应');
        handler.next(response);
      },
      // 错误拦截
      onError: (DioError err, ErrorInterceptorHandler handler) {
        print('拦截了错误');
        handler.next(err);
      },
    );

    List<Interceptor> interceptors = [requestInter];

    if (interceptor != null) {
      interceptors.add(interceptor);
    }

    _dio.interceptors.addAll(interceptors);

    try {
      Response response =
          await _dio.request(url, options: options, queryParameters: params);
      return response.data;
    } on DioError catch (err) {
      return Future.error(err);
    }
  }

  static Future<T> get<T>(String url,
      {Map<String, dynamic>? params, Interceptor? interceptor}) {
    return request(url, params: params, interceptor: interceptor);
  }

  static Future<T> post<T>(String url,
      {Map<String, dynamic>? params, Interceptor? interceptor}) {
    return request(url,
        method: 'post', params: params, interceptor: interceptor);
  }
}
