part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {
  const SignupInitial();
}

class SignupLoading extends SignupState {
  const SignupLoading();
}

class SignupSuccess extends SignupState {
  const SignupSuccess();
}

class SignupFailure extends SignupState {
  final String message;
  const SignupFailure(this.message);
  @override
  List<Object?> get props => [message];
}
