import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  late final StreamSubscription<MyUser?> _userSubscription;

  AuthenticationBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    _authStatusController.add(AuthStatus.unknown);

    _userSubscription = _userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });

    on<AuthenticationUserChanged>((event, emit) {
      if (event.myUser != null) {
        emit(AuthenticationState.authenticated(event.myUser!));
        _authStatusController.add(AuthStatus.authenticated);
      } else {
        emit(const AuthenticationState.unauthenticated());
        _authStatusController.add(AuthStatus.unauthenticated);
      }
    });
  }

  final StreamController<AuthStatus> _authStatusController = StreamController<AuthStatus>();
  Stream<AuthStatus> get authStatus => _authStatusController.stream;
  UserRepository get userRepository => _userRepository;
  StreamSubscription<MyUser?> get userSubscription => _userSubscription;

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
