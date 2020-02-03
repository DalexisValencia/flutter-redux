import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/actions/app_actions.dart';

AppState appReducer(AppState state, dynamic action ){
  if ( action is AddItemToStore){
      return addItem(state, action);
  }
  if ( action is AddUserToList){
      return addItemToList(state, action);
  }
  if ( action is DeleteItemInList){
      return removeItemToList(state, action);
  }

  return state;
}

AppState addItem(AppState state, AddItemToStore action){
  state.email    = action.email;
  state.username = action.username;
  return state;
}

addItemToList(state, AddUserToList action){
    state.users.add(action.user);
    return state;
}

AppState removeItemToList( AppState state, action){
  print(action.rid);
  return state;
}