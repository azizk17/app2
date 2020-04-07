import 'package:app2/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:app2/src/ui/widgets/phone_input.dart';
import 'package:app2/src/locale.dart';
import 'package:app2/src/states/states.dart';
import 'package:provider/provider.dart';
class PhoneSignin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authState = Provider.of<AuthState>(context);
    Size size = MediaQuery.of(context).size;
    return AuthLayout(
      background: "assets/images/auth-bg.png",
      body: Container(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: size.height / 2.2,
              maxWidth: size.width / 1.13,
              // minHeight: MediaQuery.of(context).size.height / 1,
              // minWidth: MediaQuery.of(context).size.width / 1,
            ),
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(9))),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(AppLocalizations.of(context).enterYourPhoneMsg),
                SizedBox(height: 35),
                PhoneInput(),
                SizedBox(height: 35),
                Text(AppLocalizations.of(context).termsMsg),
                SizedBox(height: 35),
                _submitBtn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitBtn(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).buttonColor,
      child: Text(AppLocalizations.of(context).btnSend),
      onPressed: () => null,
    );
  }
}
