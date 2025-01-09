import 'package:blocapis/Repository/user_repository.dart';
import 'package:blocapis/blocs/app%20states.dart';

import 'package:blocapis/blocs/app_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try{
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      }catch(e){
       emit(UserErrorState(e.toString()));
      }
     
     
    });
  }
}
