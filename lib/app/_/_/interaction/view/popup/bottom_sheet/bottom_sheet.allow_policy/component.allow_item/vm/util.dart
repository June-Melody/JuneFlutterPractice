import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../component/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewAllowItemVMUtil {
  //vm 등록
  static registeredVM(NewAllowItemParams params, {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewAllowItemUtilVM>(tag: tag)) {
      var _ =
          Get.put(NewAllowItemUtilVM(tag: tag), permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewAllowItemVM>(tag: tag)) {
      var _ = Get.put(NewAllowItemVM(Get.find<NewAllowItemUtilVM>(tag: tag)),
          permanent: permanent ?? true, tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewAllowItemVM vm({String? tag}) {
    return Get.find<NewAllowItemVM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewAllowItemUtilVM>(tag: tag, force: true);
    Get.delete<NewAllowItemVM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewAllowItemUtilVM extends GetxController {
  NewAllowItemUtilVM({this.tag});

  notify() {
    NewAllowItemVM vm = NewAllowItemVMUtil.vm(tag: tag);
    int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;

    if (_lastUpdateTime + 200 < currentTimeMillis) {
      vm.update();
      _lastUpdateTime = currentTimeMillis;
    } else {
      Timer(const Duration(milliseconds: 200), () {
        int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;
        if (_lastUpdateTime + 150 < currentTimeMillis) {
          vm.update();
          _lastUpdateTime = currentTimeMillis;
        }
      });
    }
  }

  final String? tag;
  int _lastUpdateTime = 0;
}
