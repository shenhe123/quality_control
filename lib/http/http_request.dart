import 'package:dio/dio.dart';
import 'package:quality_control/http/http_config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  // 私有方法
  static Future<T> _request<T>(String url, {
    String method = 'get',
    Map<String, dynamic>? params, Interceptor? inter}) async {
    // 1.创建单独配置, 我么也可以设置 headers
    final options = Options(method: method, headers: {});
    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (options) {
          print('请求拦截');
          return options;
        },
        onResponse: (response) {
          print('响应拦截');
          return response;
        },
        onError: (err) {
          print('错误拦截');
          return err;
        }
    );
    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);
    // 2.发送网络请求
    try {
      Response response = await dio.request(
          url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  // get网络请求
  static Future<T> get<T>(String url, {
    Map<String, dynamic>? params, Interceptor? inter}) async {
    return _request(url, method: 'get', params: params, inter: inter);
  }

  // post网络请求
  static Future<T> post<T>(String url, {
    Map<String, dynamic>? params, Interceptor? inter}) async {
    return _request(url, method: 'post', params: params, inter: inter);
  }
}

// HttpRequest.get('http://rest.apizza.net/mock/3bb78bf66bbd102a95221370ba9ddc2f/test', params: {'name': 'wc'}).then((value) {
// print('结果：$value');
// }).catchError((error) {
// print('报错信息：$error');
// });
//
// HttpRequest.post('http://rest.apizza.net/mock/3bb78bf66bbd102a95221370ba9ddc2f/test', params: {'name': 'wc'}).then((value) {
// print('结果：$value');
// }).catchError((error) {
// print('报错信息：$error');
// });