import 'package:app2/src/app/enums/users_enum.dart';
import 'package:app2/src/locale.dart';
import 'package:app2/src/models/models.dart';
import 'package:app2/src/states/auth_state.dart';
import 'package:app2/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailEditScreen extends FormEditingLayout {
  var data = User();
  User d = User();
  // final GlobalKey<FormFieldState<String>> emailKey =
  //     new GlobalKey<FormFieldState<String>>();
  TextEditingController _emailController;

  @override
  get getfeilds => (BuildContext context) {
        var auth = Provider.of<AuthState>(context);
        _emailController = TextEditingController(text: auth.authUser.email);

        return [
          TextFormField(),
          EmailFormField(
            controller: _emailController,
          ),
        ];
      };
  get title =>
      (BuildContext context) => '${AppLocalizations.of(context).email}';

  String get message => "Message abount someting";
  // String get note => "Note about someting";

  get onSubmit => (BuildContext context) async {
        var auth = Provider.of<AuthState>(context);
        User u = User().rebuild((b) => b..email = _emailController.text);
        this.save();
        if (this.validate()) {
          var b = await auth.update(id: auth.authUser.id, user: u);
          if (b is AuthError) {
            this.setErrors("ERROR not auth");
          }
        }

        print(_emailController.text);
      };
}
