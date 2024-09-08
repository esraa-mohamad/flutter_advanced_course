
import 'package:freezed_annotation/freezed_annotation.dart';
part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name:"data")
  List<SpecializationDate?> ? specializationData;

  SpecializationResponseModel({
    this.specializationData ,
});

  factory SpecializationResponseModel.fromJson(Map<String , dynamic> json)=> _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationDate {
  int? id ;
  String ? name ;
  @JsonKey(name: "doctors")
  List<Doctors?>? doctorsList ;

  SpecializationDate({
    this.id ,
    this.name ,
    this.doctorsList,
});
  factory SpecializationDate.fromJson(Map<String , dynamic> json)=> _$SpecializationDateFromJson(json);

}

@JsonSerializable()
class Doctors {
  int? id ;
  String ? name ;
  String ? email;
  String ? phone;
  String ? photo;
  String ? gender;
  @JsonKey(name: 'appoint_price')
  int ? price;
  String degree;

  Doctors({
    required this.degree ,
    this.id ,
    this.name ,
    this.email ,
    this.phone ,
    this.photo ,
    this.gender ,
    this.price
});

  factory Doctors.fromJson(Map<String , dynamic> json)=> _$DoctorsFromJson(json);

}