
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T>  with _$SignUpState {

  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.signUpLoading() = SignUpLoading;
  const factory SignUpState.signUpSuccess(T data) = SignUpSuccess<T>;
  const factory SignUpState.signUpeError(ApiErrorModel apiErrorModel) = SignUpeError;
}
