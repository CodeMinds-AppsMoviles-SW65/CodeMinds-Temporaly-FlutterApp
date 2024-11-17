// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_project/core/logger/core_logger.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_up_response_dto.dart';
import 'package:flutter_project/feaures/auth/data/repository/auth_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      SignUpResponseDto? response = await AuthRepository().signUp(
          (event as RegisterStarted).username, (event).email, (event).password);
      CoreLogger.logger.d('Register started');
      CoreLogger.logger.d("Username: ${(event).username}");
      if (response != null) {
        emit(RegisterSuccess(response));
        CoreLogger.logger.i('Register success');
        CoreLogger.logger.d(response);
      } else {
        emit(RegisterFailure('Register failed'));
        CoreLogger.logger.e('Register failed');
      }
    });
  }
}
