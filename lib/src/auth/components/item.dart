import 'package:get/get.dart';

class Items {
  late String title;
  bool? check;

  Items({required this.title, this.check});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    check = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['check'] = check;
    return data;
  }
}
