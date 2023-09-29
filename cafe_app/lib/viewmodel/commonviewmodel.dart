// import 'package:flutter/cupertino.dart';

// import 'package:cafe_app/service/webservice.dart';
// import 'package:cafe_app/model/datamodel.dart';

// class CommonListViewModel extends ChangeNotifier {
//   Future<Map<String, dynamic>> login(String username, String password) async {
//     final result = await Webservice().login(username, password);
//     print(">>>result $result");
//     return result;
//   }

//   Future<Map<String, dynamic>> register(
//     String email,
//     String username,
//     String password,
//   ) async {
//     final result = await Webservice().register(email, username, password);
//     print(">>>result $result");
//     return result;
//   }
// }
// // List<CommonListViewModel> choices = <CommonListViewModel>[];
// //    Datamodel user;

// //   CommonListViewModel({required this.user});

// //   String get name {
// //     return user.name;
// //   }

// //   String get age {
// //     return user.age;
// //   }
// //   Future<List<CommonListViewModel>> getlist() async {
// //     final results = await Webservice().getlist();
// //     print(results);
// //     this.choices =
// //         results.map((item) => CommonListViewModel(user: item)).toList();
// //     print("choises.length :::" + this.choices.length.toString());
// //     return this.choices;
// //   }
// // }
