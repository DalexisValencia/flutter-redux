import 'package:flutter/material.dart';
import 'package:redux_app_example/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app_example/actions/app_actions.dart';


class UserListWidget extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return StoreConnector<AppState, _ViewModel>(
      //converter: _ViewModel.fromStore,
      converter: (Store store, ){
        return _ViewModel(
          store.state.users,
           (selected) =>  store.dispatch(DeleteItemInList(selected))
          );
      },
      builder: ( BuildContext context, _ViewModel vm){
        //print(vm.users);
        return Container(
         // height: 300,
          decoration: BoxDecoration(
            //color: Colors.blue[50]
          ),
         // padding: EdgeInsets.only(top:20, bottom: 20),
          child: 
               ListView.builder(
                shrinkWrap: true,
                itemCount: vm.users.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: Icon( Icons.supervised_user_circle, size: 40),
                      title: Text("${vm.users[index].name} ${vm.users[index].lastName}"),
                      subtitle: Text("${vm.users[index].password}, ${vm.users[index].age}"),
                      trailing: SizedBox(
                        width: 50,
                        child: Row(
                        children: <Widget>[
                          GestureDetector(
                            child:  Icon(Icons.delete, color: Colors.red[600]),
                            onTap: (){
                              vm.onItemSelected(vm.users[index].name);
                            },
                          ),
                          Icon(Icons.mode_edit, color: Colors.blue,),
                         
                        ],
                      ),
                      ),
                      
                    ),
                  );
                },
              ),
         
        );
      }
    ); 
  }
}

class _ViewModel{
  List users;
  void Function(String itemrid) onItemSelected;
  _ViewModel(
    this.users,
    this.onItemSelected
  );
}

