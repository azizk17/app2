import 'package:app2/src/locale.dart';
import 'package:app2/src/states/states.dart';
import 'package:app2/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/**
 *  
 * Given a user the ability to modify his account 
 * 
 */
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefalutLayout(
      padding: EdgeInsets.all(0),
      content: ListViewSettings(
        this._addTolist(context),
        divider: Divider(
          height: 1,
        ),
      ),
    );
  }

  _addTolist(BuildContext context) {
    final auth = Provider.of<AuthState>(context);
    return [
      // ListVeiwItemModel.section(),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).name,
        onTap: () =>
            Navigator.pushNamed(context, "/settings/account/edit-email"),
        sideText: auth.authUser.name,
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).phone,
        onTap: () => Navigator.pushNamed(context, "/settings/app"),
        sideText: auth.authUser.phone,
      ),
      ListVeiwItemModel(
          title: AppLocalizations.of(context).email,
          onTap: () => Navigator.pushNamed(context, "/settings/app"),
          sideText: auth.authUser.email),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).password,
        onTap: () => Navigator.pushNamed(context, "/settings/app"),
        showNextIcon: true,
      ),
    ];
  }
}
