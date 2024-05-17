import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

final logger = Logger();

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc(this._userRepository) : super(SignUpInitial()) {
    on<SignUpAction>((event, emit) async {
      emit(SignUpLoading());
      try {
        MyUser myUser =
            await _userRepository.signUp(event.myUser, event.password);
        await _userRepository.setUserData(myUser);
        emit(SignUpSuccess());
      } catch (err) {
        logger.e('SIGN_UP_BLOC_ERROR: $err');
      }
    });
  }
}
