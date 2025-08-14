// //Name  Tenants Locations  Boards  Device  Alert  Users  Roles  Audit

// import 'dart:convert';

// class RoleManagerModel {
//   String? id;
//   String? name;
//   String? tenants;
//   String? locations;
//   String? boards;
//   String? device;
//   String? alert;
//   String? users;
//   String? roles;
//   String? audit;
//   bool? selected;

//   RoleManagerModel({
//     this.id,
//     this.name,
//     this.tenants,
//     this.locations,
//     this.boards,
//     this.device,
//     this.alert,
//     this.users,
//     this.roles,
//     this.audit,
//     this.selected = false,
//   });

//   factory RoleManagerModel.fromRawJson(String str) => RoleManagerModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory RoleManagerModel.fromJson(Map<String, dynamic> json) => RoleManagerModel(
//         id: json.containsKey("id") ? json["id"] : "",
//         name: json.containsKey("name") ? json["name"] : "",
//         tenants: json.containsKey("tenants") ? json["tenants"] : "",
//         locations: json.containsKey("locations") ? json["locations"] : "",
//         boards: json.containsKey("boards") ? json["boards"] : "",
//         device: json.containsKey("device") ? json["device"] : "",
//         alert: json.containsKey("alert") ? json["alert"] : "",
//         users: json.containsKey("users") ? json["users"] : "",
//         roles: json.containsKey("roles") ? json["roles"] : "",
//         audit: json.containsKey("audit") ? json["audit"] : "",
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "tenants": tenants,
//         "locations": locations,
//         "boards": boards,
//         "device": device,
//         "alert": alert,
//         "users": users,
//         "roles": roles,
//         "audit": audit,
//       };

//   RoleManagerModel.copy(
//     RoleManagerModel other,
//   ) : this(
//           id: other.id,
//           name: other.name,
//           tenants: other.tenants,
//           locations: other.locations,
//           boards: other.boards,
//           device: other.device,
//           alert: other.alert,
//           users: other.users,
//           roles: other.roles,
//           audit: other.audit,
//         );

//   RoleManagerModel copyWith({
//     String? id,
//     String? name,
//     String? tenants,
//     String? locations,
//     String? boards,
//     String? device,
//     String? alert,
//     String? users,
//     String? roles,
//     String? audit,
//     bool? selected,
//   }) {
//     return RoleManagerModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       tenants: tenants ?? this.tenants,
//       locations: locations ?? this.locations,
//       boards: boards ?? this.boards,
//       device: device ?? this.device,
//       alert: alert ?? this.alert,
//       users: users ?? this.users,
//       roles: roles ?? this.roles,
//       audit: audit ?? this.audit,
//       selected: selected ?? this.selected,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is RoleManagerModel &&
//         other.id == id &&
//         other.name == name &&
//         other.tenants == tenants &&
//         other.locations == locations &&
//         other.boards == boards &&
//         other.device == device &&
//         other.alert == alert &&
//         other.users == users &&
//         other.roles == roles &&
//         other.audit == audit &&
//         other.selected == selected;
//   }

//   @override
//   String toString() {
//     return jsonEncode(this);
//   }
// }
