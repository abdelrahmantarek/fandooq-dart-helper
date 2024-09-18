import 'dart:io';
import 'dart:convert';


extension HotelExs on Iterable{

  String toRed(String name){
    return "{$name}" + map((e) => e).join("|") + "{/$name}";
  }

}



void main() async {
  // ربط الخادم للاستماع على المنفذ 4040
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 4040);
  print('Server is running on ws://${server.address.address}:${server.port}');

  await for (HttpRequest request in server) {
    // التحقق مما إذا كان الطلب WebSocket
    if (WebSocketTransformer.isUpgradeRequest(request)) {
      WebSocket socket = await WebSocketTransformer.upgrade(request);
      print('Client connected');

      // الاستماع للطلبات من العميل عبر WebSocket
      socket.listen((message) {
        print('Received request: $message');

        // معالجة الطلب حسب نوعه
        var data = jsonDecode(message);
        if (data['action'] == 'search') {
          // منطق البحث أو أي منطق مخصص آخر
          var response = {
            'status': 'success',
            'message': 'Processing your search...',
            'results': [] // قائمة الفنادق أو البيانات الأخرى
          };
          // إرسال الرد للعميل
          socket.add(jsonEncode(response));
        } else {
          // التعامل مع الطلبات الأخرى
          socket.add(jsonEncode({
            'status': 'error',
            'message': 'Unknown action',
          }));
        }
      }, onDone: () {
        print('Client disconnected');
      });
    } else {
      // إذا لم يكن الطلب WebSocket، نرفضه
      request.response.statusCode = HttpStatus.forbidden;
      await request.response.close();
    }
  }


}
