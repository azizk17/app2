import 'package:app2/src/locale.dart';
import 'package:app2/src/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:app2/src/ui/widgets/layouts/default_layout.dart';


/**
 * # Form Editing Layout 
 * This layout is used by extend it
 */
class FormEditingLayout extends StatelessWidget {
  Function onSubmit;
  Function onCancel;
  List<Widget> _feilds;
  String _title;
  String _errors;
  String _message;
  String _note;
  dynamic data;

  get title => _title;
  get getfeilds => _feilds;
  get note => _note;
  get errors => _errors;

  void setErrors(String e) {
    _errors = e;
  }

  void save() {
    formKey.currentState.save();
  }

  bool validate() {
    return formKey.currentState.validate();
  }

  void getValue() {}

  static GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // build feilds list which required context object
    // getfeilds(context);
    return DefalutLayout(
      padding: EdgeInsets.only(left: 15, right: 15),
      title: Text("${this.title(context)}"),
      content: new Form(
        key: formKey,
        child: Column(
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
                Btn(
                  child: Text(AppLocalizations.of(context).btnSave),
                  color: Colors.green,
                  onPressed: () => this.onSubmit(context),
                ),
                SizedBox(width: 30),
                Btn(
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
      ),
    );
  }
}
