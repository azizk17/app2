import 'package:app2/src/locale.dart';
import 'package:app2/src/states/states.dart';
import 'package:app2/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app2/src/themes/jeddTheme.dart';

class SettingsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    this._addTolist(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      backgroundColor: greyLight,
      body: Container(
        color: Colors.white,
        child: ListViewSettings(this._addTolist(context)),
      ),
    );
  }

  _addTolist(BuildContext context) {
    return [
      ListVeiwItemModel.section(),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).settings,
        icon: Icons.settings,
        bgColor: Colors.blue,
        onTap: () => Navigator.pushNamed(context, "/settings/app"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).account,
        icon: Icons.person,
        bgColor: Colors.deepPurple,
        onTap: () => Navigator.pushNamed(context, "/settings/account"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).notifications,
        icon: Icons.notifications,
        bgColor: Colors.redAccent,
      ),
      ListVeiwItemModel.section(),
      // section 2
      ListVeiwItemModel(
        title: AppLocalizations.of(context).about,
        icon: Icons.insert_emoticon,
        bgColor: Colors.indigo,
        onTap: () => Navigator.pushNamed(context, "/about"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).termsOfService,
        icon: Icons.description,
        onTap: () => print(this.toString()),
        bgColor: Colors.amberAccent,
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).privacyPolicy,
        icon: Icons.lock_outline,
        bgColor: Colors.teal,
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).contact,
        icon: Icons.phone,
        bgColor: Colors.lightGreen,
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).permissions,
        icon: Icons.perm_device_information,
        bgColor: Colors.brown,
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).share,
        icon: Icons.share,
        bgColor: Colors.pink,
        onTap: () => Navigator.pushNamed(context, "/"),
      ),

      ListVeiwItemModel.section(
          subtitle: AppLocalizations.of(context).termsMsg),
    ];
  }

  _next(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  _list(BuildContext context) {
    return [
      {
        "title": "EMAIL",
        "leading": LeadingIconWidget(
          icon: Icons.phone_in_talk,
        ),
        "trailing": "verfied",
        "onTap": () => print("email")
      },
      {
        "title": "EMAIL",
        "leading": LeadingIconWidget(
          icon: Icons.phone_in_talk,
        ),
        "trailing": "verfied",
        "onTap": () => print("email")
      },
      {
        "section": "Contact",
      },
      {
        "title": "EMAIL",
        "leading": LeadingIconWidget(
          icon: Icons.phone_in_talk,
        ),
        "trailing": "verfied",
        "onTap": () => print("email")
      },
      {
        "title": "EMAIL",
        "leading": LeadingIconWidget(
          icon: Icons.phone_in_talk,
        ),
        "trailing": "verfied",
        "onTap": () => print("email")
      },
    ];
  }

  _build_list(BuildContext context, items) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var section =
            items[index]['section'] != null ? items[index]['section'] : null;
        var leading =
            items[index]['leading'] != null ? items[index]['leading'] : null;
        var title = items[index]['title'] != null ? items[index]['title'] : '';
        var subtitle =
            items[index]['subtitle'] != null ? items[index]['subtitle'] : null;
        var trailing =
            items[index]['trailing'] != null ? items[index]['trailing'] : null;
        var onTap =
            items[index]['onTap'] != null ? items[index]['onTap'] : null;
        if (section != null) {
          return Container(
            decoration: BoxDecoration(color: Color.fromRGBO(236, 240, 241, 2)),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              title: Text(
                section,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.black),
              ),
            ),
          );
        }
        if (section == null) {
          return ListTile(
            title: Text(title),
          );
        }
      },
      separatorBuilder: (context, index) {
        print(index.toString());
        if (index != 0) {
          if (items[index + 1]['section'] != null ||
              items[index]['section'] != null) {
            return Container();
          }
        }

        return Divider(
          height: 1,
          color: Colors.grey,
          indent: 30,
        );
      },
    );
  }

  List<Widget> _list_1(BuildContext context) {
    const _divider = const Divider(
      height: 1,
      color: Colors.grey,
      indent: 70,
    );
    var auth = Provider.of<AuthState>(context);
    return [
      ListTile(
          title: Text("Settings"),
          leading: LeadingIconWidget(
            icon: Icons.search,
            color: Colors.blue,
          )),
      _divider,
      ListTile(
        title: Text("Account"),
        leading: LeadingIconWidget(
          icon: Icons.search,
          color: Colors.lightGreen,
        ),
        onTap: () => print("fff"),
      ),
      _divider,
      Container(
        padding: EdgeInsets.only(bottom: 40),
        color: Colors.grey,
      ),
      ListTile(
          title: Text(AppLocalizations.of(context).termsOfService),
          leading: LeadingIconWidget(
            icon: Icons.assignment,
            color: Colors.indigoAccent,
          )),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnAgree),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
      _divider,
      ListTile(
        title: Text(AppLocalizations.of(context).btnCancel),
        leading: LeadingIconWidget(
          icon: Icons.screen_lock_portrait,
          color: Colors.purpleAccent,
        ),
      ),
    ];
  }

  List<Map<String, dynamic>> _list_2(BuildContext context) {
    var auth = Provider.of<AuthState>(context);
    return [
      {
        "title": "EMAIL",
        "leading": Image.asset("assets/002-gear.png"),
        "subtitle": auth.authUser.email,
        "trailing": "verfied",
        "onTap": () => print("email")
      },
      {
        "title": "pasword",
        "leading": Image.asset("assets/001-lock.png"),
        "onTap": () => print("EREERERERERRER"),
      },
    ];
  }

  List<Map<String, dynamic>> _b_list(BuildContext context) {
    var auth = Provider.of<AuthState>(context);
    return [
      {
        "title": "EMAIL",
        "leading": Image.asset("assets/002-gear.png"),
        "subtitle": auth.authUser.email,
        "trailing": "verfied",
        "onTap": () => print("email")
      },
      {
        "title": "pasword",
        "leading": Image.asset("assets/001-lock.png"),
        "onTap": () => print("EREERERERERRER"),
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {'space': true},
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
    ];
  }

  _listItems(BuildContext context, List<Map<String, dynamic>> list) {
    var items = _b_list(context).toList();

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.separated(
          itemCount: list.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var leading = items[index]['leading'];
            var title = items[index]['title'];
            var subtitle = items[index]['subtitle'];
            var trailing = items[index]['trailing'];
            var onTap = items[index]['onTap'];
            if (items[index]['space']) {
              return SizedBox(
                height: 40,
              );
            }
            return ListTile(
              leading: leading != null ? leading : null,
              title: title != null ? Text(title) : null,
              subtitle: subtitle != null ? Text(subtitle) : null,
              trailing: trailing != null ? Text(trailing) : null,
              onTap: onTap != null ? onTap : null,
              dense: true,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.grey,
            );
          }),
    );
  }
}
