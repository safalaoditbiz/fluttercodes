import 'package:flutter/cupertino.dart';
import 'package:netbeans4/model/list.dart';

import 'package:netbeans4/service/webservice.dart';
import 'package:netbeans4/main.dart';

class CommonListViewModel extends ChangeNotifier {
  List<CommonListViewModel> choices = <CommonListViewModel>[];

  listview user;

  CommonListViewModel({this.user});

  String get name {
    return user.name;
  }

  String get age {
    return user.age;
  }

  Future<List<CommonListViewModel>> getlist() async {
    final results = await Webservice().getlist();
    print(results);
    this.choices =
        results.map((item) => CommonListViewModel(user: item)).toList();
    print("choises.length :::" + this.choices.length.toString());
    return this.choices;
  }
}
