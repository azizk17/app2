import 'package:app2/src/locale.dart';
import 'package:app2/src/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      drawer: Drawer(child: _drawerList(context)),
      body: Text(
        "Home",
        textScaleFactor: 4.2,
      ),
    );
  }

  Widget _drawerList(BuildContext context) {
    var authProvider = Provider.of<AuthState>(context);
    final _list = [
      {"text": "Home", "route": "/", "icon": ""},
      {"text": "About", "route": "/about", "icon": ""},
      {"text": "Login", "route": "/signin", "icon": ""},
      {"text": "Register", "route": "/signup", "icon": ""},
      {"text": "Private", "route": "/private", "icon": "", "auth": true}
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Card(
                  child: ListTile(
                    title: Text(
                      AppLocalizations.of(context).appTitle,
                      textScaleFactor: 1.9,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      authProvider.isLoggendIn
                          ? authProvider.authUser.email
                          : "",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    trailing: !authProvider.isLoggendIn
                        ? null
                        : FlatButton(
                            color: Colors.blueAccent,
                            child: Text(
                                '${AppLocalizations.of(context).btnLogout}'),
                            onPressed: () async {
                              
                              await authProvider.signOut();
                            },
                          ),
                    contentPadding: EdgeInsets.only(
                        top: 40, left: 10, bottom: 10, right: 10),
                  ),
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int index) {
              if (_list[index].containsKey("auth") && !authProvider.isLoggendIn) {
                return Container();
              } 
              return _item(context, _list[index]);
            },
          ),
        )
      ],
    );
  }
  Widget _item(BuildContext context, Map list) {
    return ListTile(
                dense: true,
                title: Text(
                  list['text'].toString(),
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
                onTap: () {
                  Navigator.pushNamed(context, list['route']);
                },
              );
  } 
}