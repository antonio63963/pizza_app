import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

final logger = Logger();

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;
  SignInBloc(this._userRepository) : super(SignInInitial()) {
    on<SignInAction>((event, emit) async {
      emit(SignInLoading());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      } catch (err) {
        logger.e('SIGN_IN_BLOC_ERROR: $err');
        emit(SignInFailure(message: err.toString()));
      }
    });
    on<SignOutAction>((event, emit) async {
      await _userRepository.logOut();
    });
  }
}
