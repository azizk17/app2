import 'package:app2/src/states/states.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:common/common.dart';
// // import 'package:mobt/src/providers/story_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:app2/src/ui/screens/screens.dart';

List<Map<String, dynamic>> _r = <Map<String, dynamic>>[
  // name , screen , auth , guest, roles
  {"name": "/", "screen": HomeScreen(), "auth": false, "roles": []},
  {"name": "/about", "screen": AboutScreen()},
  {"name": "/signin", "screen": SigninScreen(), "guest": true},
  {"name": "/sigup", "screen": SignupScreen(), "guest": true},
  {"name": "/private", "screen": PrivateScreen(), "auth": true},
  // ? last elememnt must be not found route
  {"name": "*", "screen": NotFoundScreen()}
];

/**
 * 
 *  Route generation function 
 * 
 */
Route routes(RouteSettings s) {
  return MaterialPageRoute(builder: (context) {
    return _page(context, s);
  });
}

// get route from routes list
Map<String, dynamic> _getRoute(RouteSettings s) {
  return _r.singleWhere((i) => i['name'] == s.name, orElse: () => _r.last);
}

/**
 * get targeted page
 */
Widget _page(BuildContext context, RouteSettings s) {
  Map<String, dynamic> r = _getRoute(s);
  bool g = _guard(context, r);
  return _guard(context, r) ? r['screen'] : NotAllowed();
}

/**
 *  Guard
 */
bool _guard(BuildContext context, Map<String, dynamic> r) {
  bool isAllowed = true;
  // check for Auth and Roles
  var _p = Provider.of<AuthState>(context);
  // when route has no auth, allow users to visit
  bool _isAuthRequired = r.containsKey("auth") ? r['auth'] : false;
  if (_isAuthRequired && !_p.isLoggendIn) {
    isAllowed = false;
  }
  bool _onlyGuest = r.containsKey("guest") ? r['guest'] : false;
  if (_onlyGuest && _p.isLoggendIn) {
    isAllowed = false;
  }
  return isAllowed;
}

//check if authentication is required
bool _isAllowed(BuildContext context, Map<String, dynamic> r) {}

// TODO: check for users roles
// roles
_hasRoles() {}

// ?support cross pltform desgin and native feels
// _routeTransition(Widget page) {
//   if (Platform.isIOS) {
//     return CupertinoPageRoute(builder: (context) {
//       return page;
//     });
//   } else {
//     return MaterialPageRoute(builder: (context) {
//       return page;
//     });
//   }
// }