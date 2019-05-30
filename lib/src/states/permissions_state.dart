import 'package:app2/src/states/base_state.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsState extends BaseState {
  PermissionStatus _contacts;
  PermissionStatus get contacts => _contacts;

  PermissionsState() {}

  init() async {
    await _listenForPermissionStatus(PermissionGroup.contacts);
    await _requestPermission(PermissionGroup.contacts);
  }

  contacts_check() async {
    return await _requestPermission(PermissionGroup.contacts);
  }

  contacts_request() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.contacts]);
  }

  openAppSettings() {
    PermissionHandler().openAppSettings().then((bool hasOpened) =>
        print('App Settings opened: ' + hasOpened.toString()));
  }

  Future<void> _requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);
    print(permission);
  }

  void _listenForPermissionStatus(permissionGroup) {
    final Future<PermissionStatus> statusFuture =
        PermissionHandler().checkPermissionStatus(permissionGroup);

    statusFuture.then((PermissionStatus status) {
      _contacts = status;
      notifyListeners();
    });
  }
}
