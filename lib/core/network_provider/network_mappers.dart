part of 'networking.dart';

// Handler for the network's request.
abstract class RequestMappable {
  Map<String, dynamic> toJson();
}

// Handler for the network's response.

abstract class Mappable<T> {
  factory Mappable(Mappable type, dynamic data) {

    if (type is ListMappable) {
      return type.fromJsonList(data as List) as Mappable<T>;
    }

    // check if the type is a bool
    if (type is BaseMappable) {
      Map<String, dynamic> mappingData = json.decode(data.toString());
      print("dddddd ${mappingData.toString()}");
      return type.fromJson(mappingData) as Mappable<T>;
    }

    if (type is ObjectMappable) {
      return type.fromJson(data) as Mappable<T>;
      return data as Mappable<T>;
    }

    return type as Mappable<T>;
  }
}

abstract class BaseMappable<T> implements Mappable {
  Mappable fromJson(dynamic json);
  Map<String, dynamic> toJson();
}

abstract class ListMappable<T> implements Mappable {
  Mappable fromJsonList(List<dynamic> json);
}

abstract class ObjectMappable<T> implements Mappable {
  Mappable fromJson(dynamic json);
}


// class BoolResponse<T> extends ObjectMappable<T>{
//   final T? data;
//   BoolResponse(this.data);
//   @override
//   Mappable fromJson(json) {
//     return BoolResponse(json);
//   }
// }

class ObjectResponse extends ObjectMappable{
  final dynamic data;

  Map<String,dynamic> get toMap{
    return json.decode(data.toString());
  }

  ObjectResponse({this.data});

  @override
  Mappable fromJson(json) {
    return ObjectResponse(data: json);
  }

}

