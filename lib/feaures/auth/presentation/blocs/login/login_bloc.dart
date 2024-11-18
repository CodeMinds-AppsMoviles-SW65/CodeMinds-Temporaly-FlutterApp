import 'package:bloc/bloc.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_in_response_dto.dart';
import 'package:flutter_project/feaures/auth/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      SignInResponseDto? response = await AuthRepository().signIn(
          (event as LoginStarted).email, (event as LoginStarted).password);
      if (response != null) {
        emit(LoginSuccess(response));
        logger.i('Login success');
      } else {
        emit(LoginFailure('Login failed'));
      }
    });
  }
}
