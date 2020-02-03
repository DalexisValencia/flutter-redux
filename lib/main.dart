import 'package:flutter/material.dart';
import 'package:redux/redux.dart';                              // new
import 'package:flutter_redux/flutter_redux.dart';   

import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/reducers/app_reducer.dart';
import 'package:redux_app_example/containers/form.dart';
import 'package:redux_app_example/containers/user.register.dart';
import 'package:redux_app_example/containers/list.users.dart';
import 'package:redux_app_example/containers/form.user.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget{
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
  );

  @override
  Widget build( BuildContext context){
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData  (
          primarySwatch: Colors.blue
        ),
       // home: HomePage(),
       initialRoute: '/',
       routes: {
         '/': (context) => HomePage(),
         '/UserList': (context) => UserListContent(),
         '/FormUser': (context) => FormUser()
       },
      ),
    );
  }
}
//Lista de usuarios
class UserListContent extends StatelessWidget{
  @override 
  Widget build( BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de usuarios"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Añadir Usuario',
            onPressed: (){
              Navigator.pushNamed(context, '/FormUser');
            },
          )
        ],
      ),
      body:UserListWidget(),
    );
  }
}
//Vista Formulario de ingreso de usuarios
class FormUser extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Usuario"),
      ),
      body: Column(
        children: <Widget>[
           FormUserAdd()
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("App Store"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Drawer header",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Lista de usuarios"),
              onTap: (){
                  Navigator.pushNamed(context, '/UserList');    
              }
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Nuevo Usuario"),
              onTap: (){
                Navigator.pushNamed(context, '/FormUser');
              },
            )
          ],
        ),
      ),
      body: ListView(
          children: <Widget>[
            Text("Ingresa un nuevo Usuario"),
            UpdatedForm(),
            Viewer(),
            SizedBox(height: 20),
          ],
        ),
    );
  }
}
