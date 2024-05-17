part of 'authentication_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  unknown,
}

class AuthenticationState extends Equatable {
  final AuthStatus status;
  final MyUser? myUser;

  const AuthenticationState._({
    this.status = AuthStatus.unknown,
    this.myUser,
  });

  const AuthenticationState.unknown() : this._();
  const AuthenticationState.authenticated(MyUser user)
      : this._(status: AuthStatus.authenticated, myUser: user);
  const AuthenticationState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object?> get props => [status, myUser];
}
