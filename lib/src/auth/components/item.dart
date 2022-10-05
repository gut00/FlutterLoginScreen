// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Items {
  String title;
  bool check;
  Items({
    required this.title,
    required this.check,
  });

  Items copyWith({
    String? title,
    bool? check,
  }) {
    return Items(
      title: title ?? this.title,
      check: check ?? this.check,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'check': check,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      title: map['title'] as String,
      check: map['check'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Items(title: $title, check: $check)';

  @override
  bool operator ==(covariant Items other) {
    if (identical(this, other)) return true;

    return other.title == title && other.check == check;
  }

  @override
  int get hashCode => title.hashCode ^ check.hashCode;

  void removeAt(int index) {}
}
