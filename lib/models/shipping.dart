import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Shipping extends Equatable {
  final int id;
  final String title;
  final String body;

  const Shipping({this.id, this.title, this.body,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);


  @override
  List<Object> get props => [id, title, body];

  @override
  String toString() => 'Shipping { id: $id }';
}
