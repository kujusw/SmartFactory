import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/location.dart';
import '../../../http/role.dart';
import '../../../http/user.dart';
import '../../../models/locationresponseentity.dart';
import '../../../models/role_permisiion_model.dart';
import '../../../models/user_manager_model.dart';
import '../../../models/user_role_model.dart';
import '../../login/notifier/login_notifier.dart';
import 'locationaddhttpmanager.dart';
import 'locationdeletehttpmanager.dart';
import 'locationuimanager.dart';
import 'permissionselectuimanager.dart';
import 'roledeletehttpmanager.dart';
import 'roleaddhttpmanager.dart';
import 'roleuimanager.dart';
import 'setpermissionmanager.dart';
// import 'userhttpmanager.dart';
import 'useraddhttpmanager.dart';
import 'userdeletehttpmanager.dart';
import 'usersindexstate.dart';
import 'usersmanager.dart';
import 'useruimanager.dart';

final indexUsersProvider = StateNotifierProvider<UsersIndexState, int>((ref) {
  return UsersIndexState();
});

final itemsUserModelProvider = StateNotifierProvider<UserManager, List<UserModel>>((ref) {
  return UserManager();
});

//过滤后的数据

//过滤后的数据
final itemsUserModelFilteredProvider = StateNotifierProvider<UserUIManager, List<UserModel>>((ref) {
  return UserUIManager();
});

Future<List<UserModel>> getUsers(FutureProviderRef<List<UserModel>> ref) async {
  var users = await UserAPI.getUsers(path: "v1/users", token: ref.read(loginProvider).data?.token);
  ref.read(itemsUserModelFilteredProvider.notifier).setUsers(users.data ?? []);
  return users.data ?? [];
}

final getUsersProvider = FutureProvider<List<UserModel>>((ref) async {
  return getUsers(ref);
});

final addUserProvider = StateNotifierProvider<UserAddHttpManager, AddUserResponseEntity>((ref) {
  return UserAddHttpManager(AddUserResponseEntity(code: 0, message: ""));
});

final deleteUserProvider = StateNotifierProvider<UserDeleteHttpManager, DeleteUserResponseEntity>((ref) {
  return UserDeleteHttpManager(DeleteUserResponseEntity(code: 0, message: ""));
});

final itemsSetPermissionProvider = StateNotifierProvider<SetPermissionManager, List<RolePermissionModel>>((ref) {
  return SetPermissionManager();
});

//过滤后的数据
final itemsLocationModelFilteredProvider = StateNotifierProvider<LocationUIManager, List<LocationModel>>((ref) {
  return LocationUIManager();
});

//原始数据
final itemsLocationModelProvider = StateProvider<List<LocationModel>>((ref) {
  return [];
});

Future<List<LocationModel>> getLocations(FutureProviderRef<List<LocationModel>> ref) async {
  var locations = await LocationAPI.getLocations(path: "v1/locations", token: ref.read(loginProvider).data?.token);
  ref.read(itemsLocationModelFilteredProvider.notifier).setLocations(locations.data ?? []);
  ref.read(itemsLocationModelProvider.notifier).state = locations.data ?? [];
  return locations.data ?? [];
}

final getLocationsProvider = FutureProvider<List<LocationModel>>((ref) async {
  return getLocations(ref);
});

final addLocationProvider = StateNotifierProvider<LocationAddHttpManager, AddLocationResponseEntity>((ref) {
  return LocationAddHttpManager(AddLocationResponseEntity(code: 0, message: ""));
});

final deleteLocationProvider = StateNotifierProvider<LocationDeleteHttpManager, DeleteLocationResponseEntity>((ref) {
  return LocationDeleteHttpManager(DeleteLocationResponseEntity(code: 0, message: ""));
});
//原始数据 用于添加用户时筛选
final itemsRoleModelProvider = StateProvider<List<RoleModel>>((ref) {
  return [];
});
//过滤后的数据 用于表格处理
final itemsRoleModelFilteredProvider = StateNotifierProvider<RoleUIManager, List<RoleModel>>((ref) {
  return RoleUIManager();
});

Future<List<RoleModel>> getRoles(FutureProviderRef<List<RoleModel>> ref) async {
  var users = await RoleAPI.getRoles(path: "v1/roles", token: ref.read(loginProvider).data?.token);
  ref.read(itemsRoleModelFilteredProvider.notifier).setRoles(users.data ?? []);
  ref.read(itemsRoleModelProvider.notifier).state = users.data ?? [];
  return users.data ?? [];
}

final getRolesProvider = FutureProvider<List<RoleModel>>((ref) async {
  return getRoles(ref);
});

//用于UI的处理
final itemsPermissionSelectProvider = StateNotifierProvider<PermissionSelectUIManager, List<PermissionSelect>>((ref) {
  return PermissionSelectUIManager();
});

final itemsPermissionProvider = StateProvider<List<Permission>>((ref) {
  return [];
});

Future<List<PermissionSelect>> getPermissions(FutureProviderRef<List<PermissionSelect>> ref) async {
  var users = await RoleAPI.getPermissions(path: "v1/roles/permissions", token: ref.read(loginProvider).data?.token);
  ref.read(itemsPermissionProvider.notifier).state = users.data;

  //处理数据
  List<PermissionSelect> permissionsSelect = handlerPermissionToPremissionSelect(users.data);
  ref.read(itemsPermissionSelectProvider.notifier)..setPermissionSelects(permissionsSelect);

  return permissionsSelect;
}

final getPermissionsProvider = FutureProvider<List<PermissionSelect>>((ref) async {
  return getPermissions(ref);
});

List<PermissionSelect> handlerPermissionToPremissionSelect(List<Permission> data) {
  List<PermissionSelect> permissionsSelect = [];
  for (var item in data) {
    //避免module重复
    if (permissionsSelect.where((element) => element.module == item.module).length == 0) {
      permissionsSelect.add(PermissionSelect(module: item.module, read: false, write: false));
    }
  }

  for (var item in permissionsSelect) {
    for (var item2 in data) {
      if (item.module == item2.module) {
        item.write = false;
        item.read = false;
      }
    }
  }
  return permissionsSelect;
}

final addRoleProvider = StateNotifierProvider<RoleAddHttpManager, AddRoleResponseEntity>((ref) {
  return RoleAddHttpManager(AddRoleResponseEntity(code: 0, message: ""));
});

final deleteRoleProvider = StateNotifierProvider<RoleDeleteHttpManager, DeleteRoleResponseEntity>((ref) {
  return RoleDeleteHttpManager(DeleteRoleResponseEntity(code: 0, message: ""));
});

//搜索值
final valueSearchProviderInLocation = StateProvider.autoDispose<String>((ref) => "");
final valueSearchProviderInRole = StateProvider.autoDispose<String>((ref) => "");
final valueSearchProviderInUser = StateProvider.autoDispose<String>((ref) => "");

// void clearAddUserProvider(WidgetRef ref) {
//   LoggerManager().d("clearAddUserProvider");
//   ref.invalidate(locationProvider);
//   ref.invalidate(roleProvider);
//   ref.invalidate(passwordProvider);
//   ref.invalidate(passwordValidProvider);
//   ref.invalidate(emailProvider);
//   ref.invalidate(emailValidProvider);
//   ref.invalidate(nameProvider);
// }

//退出登录后 清空数据
void clearUserProvider(WidgetRef ref) {
  ref.invalidate(itemsUserModelProvider);
  ref.invalidate(itemsUserModelFilteredProvider);
  ref.invalidate(itemsLocationModelFilteredProvider);
  ref.invalidate(itemsLocationModelProvider);
  ref.invalidate(itemsRoleModelProvider);
  ref.invalidate(itemsRoleModelFilteredProvider);
  ref.invalidate(itemsPermissionSelectProvider);
  ref.invalidate(itemsPermissionProvider);
  ref.invalidate(indexUsersProvider);
  ref.invalidate(valueSearchProviderInLocation);
  ref.invalidate(valueSearchProviderInRole);
  ref.invalidate(valueSearchProviderInUser);
  ref.invalidate(getUsersProvider);
  ref.invalidate(getLocationsProvider);
  ref.invalidate(getRolesProvider);
  ref.invalidate(getPermissionsProvider);
  ref.invalidate(addUserProvider);
  ref.invalidate(deleteUserProvider);
  ref.invalidate(addLocationProvider);
  ref.invalidate(deleteLocationProvider);
  ref.invalidate(addRoleProvider);
  ref.invalidate(deleteRoleProvider);
  ref.invalidate(itemsSetPermissionProvider);
}
