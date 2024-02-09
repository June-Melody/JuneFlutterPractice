import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../component/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(BuildContext context, NewAllowItemParams params,
    {String? tag}) async {
  NewAllowItemVMUtil.registeredVM(params, tag: tag);
  NewAllowItemVM viewModel = NewAllowItemVMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
