part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

}

class AuthenticationUserChanged extends AuthenticationEvent {
  final MyUser? myUser;

  const AuthenticationUserChanged(this.myUser);

  @override
  List<Object?> get props => [myUser];
}
