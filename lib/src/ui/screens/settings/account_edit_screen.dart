import 'package:app2/src/locale.dart';
import 'package:app2/src/states/auth_state.dart';
import 'package:app2/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditFiledScreen extends StatelessWidget {
  Function onSubmit;
  Function onCancel;
  List<Widget> _feilds;
  String _title;
  String _errors;
  String _message;
  String _note;

  get title => _title;
  get getfeilds => _feilds;
  get note => _note;

  @override
  Widget build(BuildContext context) {
    // build feilds list which required context object
    // getfeilds(context);
    return DefalutLayout(
      title: Text("${this.title(context)}"),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...this.getfeilds(context).map((f) {
            return Container(
              child: f,
              padding: EdgeInsets.only(bottom: 10),
            );
          }),
          // note
          Container(
            // ? noice text start with space
            child: Text('   ${this.note}'),
          ),
          // Actions
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BtnWidget(
                child: Text(AppLocalizations.of(context).btnSave),
                color: Colors.green,
                onPressed: () => this.onSubmit(context),
              ),
              SizedBox(width: 30),
              BtnWidget(
                child: Text(
                  AppLocalizations.of(context).btnCancel,
                  style: TextStyle(color: Colors.black38),
                ),
                color: Colors.transparent,
                onPressed: this.onCancel != null
                    ? this.onCancel
                    : () => Navigator.pop(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EmailEditScreen extends EditFiledScreen {
  @override
  get getfeilds => (BuildContext context) {
        var auth = Provider.of<AuthState>(context);
        return [
          EmailField(
            attr: "email",
            label: AppLocalizations.of(context).email,
            value: auth.authUser.email,
            onChanged: (val) => print(val),
            error: "werwerwee wefwef",
          )
        ];
      };
  get title =>
      (BuildContext context) => '${AppLocalizations.of(context).email}';

  String get message => "Message abount someting";
  String get note => "Note about someting";

  get onSubmit => (BuildContext context) {
        print("Hey");
      };
}
