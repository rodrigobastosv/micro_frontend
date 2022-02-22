abstract class BaseModel {
  BaseModel fromJson(Map<String, dynamic> json);
  Map<String, dynamic> get toJson;
}
