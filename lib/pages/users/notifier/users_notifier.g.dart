// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// -------------------- Users --------------------

@ProviderFor(IndexUsers)
const indexUsersProvider = IndexUsersProvider._();

/// -------------------- Users --------------------
final class IndexUsersProvider extends $NotifierProvider<IndexUsers, int> {
  /// -------------------- Users --------------------
  const IndexUsersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'indexUsersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$indexUsersHash();

  @$internal
  @override
  IndexUsers create() => IndexUsers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$indexUsersHash() => r'c8062545a45c605d7509f6af577aed910a995f12';

/// -------------------- Users --------------------

abstract class _$IndexUsers extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ItemsUserModel)
const itemsUserModelProvider = ItemsUserModelProvider._();

final class ItemsUserModelProvider
    extends $NotifierProvider<ItemsUserModel, List<UserModel>> {
  const ItemsUserModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'itemsUserModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$itemsUserModelHash();

  @$internal
  @override
  ItemsUserModel create() => ItemsUserModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserModel>>(value),
    );
  }
}

String _$itemsUserModelHash() => r'ce820db962d0035db957beff4d474929e9eef92e';

abstract class _$ItemsUserModel extends $Notifier<List<UserModel>> {
  List<UserModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<UserModel>, List<UserModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<UserModel>, List<UserModel>>,
        List<UserModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ItemsUserModelFiltered)
const itemsUserModelFilteredProvider = ItemsUserModelFilteredProvider._();

final class ItemsUserModelFilteredProvider
    extends $NotifierProvider<ItemsUserModelFiltered, List<UserModel>> {
  const ItemsUserModelFilteredProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'itemsUserModelFilteredProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$itemsUserModelFilteredHash();

  @$internal
  @override
  ItemsUserModelFiltered create() => ItemsUserModelFiltered();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserModel>>(value),
    );
  }
}

String _$itemsUserModelFilteredHash() =>
    r'a16f17454da52792a962b85d757ee4527ecac178';

abstract class _$ItemsUserModelFiltered extends $Notifier<List<UserModel>> {
  List<UserModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<UserModel>, List<UserModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<UserModel>, List<UserModel>>,
        List<UserModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(getUsers)
const getUsersProvider = GetUsersProvider._();

final class GetUsersProvider extends $FunctionalProvider<
        AsyncValue<List<UserModel>>, List<UserModel>, FutureOr<List<UserModel>>>
    with $FutureModifier<List<UserModel>>, $FutureProvider<List<UserModel>> {
  const GetUsersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getUsersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUsersHash();

  @$internal
  @override
  $FutureProviderElement<List<UserModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserModel>> create(Ref ref) {
    return getUsers(ref);
  }
}

String _$getUsersHash() => r'417dbda3ef7b644d77f040c260da821f0e5b22b2';

@ProviderFor(AddUser)
const addUserProvider = AddUserProvider._();

final class AddUserProvider
    extends $NotifierProvider<AddUser, AddUserResponseEntity> {
  const AddUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addUserHash();

  @$internal
  @override
  AddUser create() => AddUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddUserResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddUserResponseEntity>(value),
    );
  }
}

String _$addUserHash() => r'f273df6d8b8354fc24586067c074470ccd6a5e6c';

abstract class _$AddUser extends $Notifier<AddUserResponseEntity> {
  AddUserResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddUserResponseEntity, AddUserResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddUserResponseEntity, AddUserResponseEntity>,
        AddUserResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(DeleteUser)
const deleteUserProvider = DeleteUserProvider._();

final class DeleteUserProvider
    extends $NotifierProvider<DeleteUser, DeleteUserResponseEntity> {
  const DeleteUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteUserHash();

  @$internal
  @override
  DeleteUser create() => DeleteUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteUserResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteUserResponseEntity>(value),
    );
  }
}

String _$deleteUserHash() => r'5e875b3c3411227b7e804542f9f27cf2d80181a5';

abstract class _$DeleteUser extends $Notifier<DeleteUserResponseEntity> {
  DeleteUserResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DeleteUserResponseEntity, DeleteUserResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteUserResponseEntity, DeleteUserResponseEntity>,
        DeleteUserResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

/// -------------------- Locations --------------------

@ProviderFor(AddLocation)
const addLocationProvider = AddLocationProvider._();

/// -------------------- Locations --------------------
final class AddLocationProvider
    extends $NotifierProvider<AddLocation, AddLocationResponseEntity> {
  /// -------------------- Locations --------------------
  const AddLocationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addLocationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addLocationHash();

  @$internal
  @override
  AddLocation create() => AddLocation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddLocationResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddLocationResponseEntity>(value),
    );
  }
}

String _$addLocationHash() => r'a8dcbb8718a88123a746708815375e285f0bcfe3';

/// -------------------- Locations --------------------

abstract class _$AddLocation extends $Notifier<AddLocationResponseEntity> {
  AddLocationResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AddLocationResponseEntity, AddLocationResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddLocationResponseEntity, AddLocationResponseEntity>,
        AddLocationResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(DeleteLocation)
const deleteLocationProvider = DeleteLocationProvider._();

final class DeleteLocationProvider
    extends $NotifierProvider<DeleteLocation, DeleteLocationResponseEntity> {
  const DeleteLocationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteLocationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteLocationHash();

  @$internal
  @override
  DeleteLocation create() => DeleteLocation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteLocationResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteLocationResponseEntity>(value),
    );
  }
}

String _$deleteLocationHash() => r'3a1c807d5b6014cd48cff7b605677f20f037db1d';

abstract class _$DeleteLocation
    extends $Notifier<DeleteLocationResponseEntity> {
  DeleteLocationResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<DeleteLocationResponseEntity, DeleteLocationResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteLocationResponseEntity, DeleteLocationResponseEntity>,
        DeleteLocationResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

/// -------------------- Roles --------------------

@ProviderFor(ItemsRoleModel)
const itemsRoleModelProvider = ItemsRoleModelProvider._();

/// -------------------- Roles --------------------
final class ItemsRoleModelProvider
    extends $NotifierProvider<ItemsRoleModel, List<RoleModel>> {
  /// -------------------- Roles --------------------
  const ItemsRoleModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'itemsRoleModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$itemsRoleModelHash();

  @$internal
  @override
  ItemsRoleModel create() => ItemsRoleModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RoleModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RoleModel>>(value),
    );
  }
}

String _$itemsRoleModelHash() => r'f0d4dd2dce6acd66c1b9882ffaea4d2ddc393194';

/// -------------------- Roles --------------------

abstract class _$ItemsRoleModel extends $Notifier<List<RoleModel>> {
  List<RoleModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<RoleModel>, List<RoleModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<RoleModel>, List<RoleModel>>,
        List<RoleModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(getRoles)
const getRolesProvider = GetRolesProvider._();

final class GetRolesProvider extends $FunctionalProvider<
        AsyncValue<List<RoleModel>>, List<RoleModel>, FutureOr<List<RoleModel>>>
    with $FutureModifier<List<RoleModel>>, $FutureProvider<List<RoleModel>> {
  const GetRolesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getRolesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRolesHash();

  @$internal
  @override
  $FutureProviderElement<List<RoleModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<RoleModel>> create(Ref ref) {
    return getRoles(ref);
  }
}

String _$getRolesHash() => r'f456b3f62dda1d0b67a2e04f54535399cc0820d0';

@ProviderFor(AddRole)
const addRoleProvider = AddRoleProvider._();

final class AddRoleProvider
    extends $NotifierProvider<AddRole, AddRoleResponseEntity> {
  const AddRoleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addRoleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addRoleHash();

  @$internal
  @override
  AddRole create() => AddRole();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddRoleResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddRoleResponseEntity>(value),
    );
  }
}

String _$addRoleHash() => r'3c1af18c2076aba065d850aadc737c488e342ff5';

abstract class _$AddRole extends $Notifier<AddRoleResponseEntity> {
  AddRoleResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddRoleResponseEntity, AddRoleResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddRoleResponseEntity, AddRoleResponseEntity>,
        AddRoleResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(DeleteRole)
const deleteRoleProvider = DeleteRoleProvider._();

final class DeleteRoleProvider
    extends $NotifierProvider<DeleteRole, DeleteRoleResponseEntity> {
  const DeleteRoleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteRoleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteRoleHash();

  @$internal
  @override
  DeleteRole create() => DeleteRole();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteRoleResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteRoleResponseEntity>(value),
    );
  }
}

String _$deleteRoleHash() => r'6ec6e7a14b2049c6372f987e77c6c6e3a4089f95';

abstract class _$DeleteRole extends $Notifier<DeleteRoleResponseEntity> {
  DeleteRoleResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DeleteRoleResponseEntity, DeleteRoleResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteRoleResponseEntity, DeleteRoleResponseEntity>,
        DeleteRoleResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

/// -------------------- Permissions --------------------

@ProviderFor(PermissionList)
const permissionListProvider = PermissionListProvider._();

/// -------------------- Permissions --------------------
final class PermissionListProvider
    extends $NotifierProvider<PermissionList, List<Permission>> {
  /// -------------------- Permissions --------------------
  const PermissionListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'permissionListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$permissionListHash();

  @$internal
  @override
  PermissionList create() => PermissionList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Permission> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Permission>>(value),
    );
  }
}

String _$permissionListHash() => r'3bcb745e20567a4e92d6b7ec98e1267c1d4aa79d';

/// -------------------- Permissions --------------------

abstract class _$PermissionList extends $Notifier<List<Permission>> {
  List<Permission> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Permission>, List<Permission>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Permission>, List<Permission>>,
        List<Permission>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(getPermissions)
const getPermissionsProvider = GetPermissionsProvider._();

final class GetPermissionsProvider extends $FunctionalProvider<
        AsyncValue<List<PermissionSelect>>,
        List<PermissionSelect>,
        FutureOr<List<PermissionSelect>>>
    with
        $FutureModifier<List<PermissionSelect>>,
        $FutureProvider<List<PermissionSelect>> {
  const GetPermissionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPermissionsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPermissionsHash();

  @$internal
  @override
  $FutureProviderElement<List<PermissionSelect>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<PermissionSelect>> create(Ref ref) {
    return getPermissions(ref);
  }
}

String _$getPermissionsHash() => r'0b01805ea7753383793bd4be89aa3a92801ec771';

/// -------------------- 搜索值 --------------------

@ProviderFor(ValueSearchInLocation)
const valueSearchInLocationProvider = ValueSearchInLocationProvider._();

/// -------------------- 搜索值 --------------------
final class ValueSearchInLocationProvider
    extends $NotifierProvider<ValueSearchInLocation, String> {
  /// -------------------- 搜索值 --------------------
  const ValueSearchInLocationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'valueSearchInLocationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$valueSearchInLocationHash();

  @$internal
  @override
  ValueSearchInLocation create() => ValueSearchInLocation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$valueSearchInLocationHash() =>
    r'e8a51b39cd7fddf24ffbb0e2386d70f88fb72646';

/// -------------------- 搜索值 --------------------

abstract class _$ValueSearchInLocation extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ValueSearchInRole)
const valueSearchInRoleProvider = ValueSearchInRoleProvider._();

final class ValueSearchInRoleProvider
    extends $NotifierProvider<ValueSearchInRole, String> {
  const ValueSearchInRoleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'valueSearchInRoleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$valueSearchInRoleHash();

  @$internal
  @override
  ValueSearchInRole create() => ValueSearchInRole();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$valueSearchInRoleHash() => r'76958c5a6d432e68ef48dcf8f6b5738a10152fc9';

abstract class _$ValueSearchInRole extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ValueSearchInUser)
const valueSearchInUserProvider = ValueSearchInUserProvider._();

final class ValueSearchInUserProvider
    extends $NotifierProvider<ValueSearchInUser, String> {
  const ValueSearchInUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'valueSearchInUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$valueSearchInUserHash();

  @$internal
  @override
  ValueSearchInUser create() => ValueSearchInUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$valueSearchInUserHash() => r'6f278adf8fcc305ef6821359ba32f7a462aa72a3';

abstract class _$ValueSearchInUser extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
