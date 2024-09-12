import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:play_list_omar_ahmed/core/helper/extensions.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;

  final int? code;

  @JsonKey(name: "data")
  final Map<String, dynamic>? error;

  ApiErrorModel({
    this.message,
    this.code,
    this.error,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Return a string containing all the errors messages
  String getAllStringMessages() {
    if (error.isNullOrEmpty()) {
      return message ?? "Unknown error occurred";
    }

    final errorMessage = error!.entries.map((entry) {
      final value = entry.value;
      return "${value.join(' , ')}";
    }).join('\n');

    return errorMessage;
  }
  // String getAllStringMessages() {
  //   if (error == null || error is List && (error as List).isEmpty) {
  //     return message ?? "Unknown Error occurred";
  //   }
  //
  //   // TODO : explain this new update
  //   if (error is Map<String, dynamic>) {
  //     final errorMessage =
  //     (error as Map<String, dynamic>).entries.map((entry) {
  //       final value = entry.value;
  //       return "${value.join(',')}";
  //     }).join('\n');
  //
  //     return errorMessage;
  //   } else if (error is List) {
  //     return (error as List).join('\n');
  //   }
  //
  //   return message ?? "Unknown Error occurred";
  // }
}
