import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../component/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(BuildContext context, NewItemParams params,
    {String? tag}) async {
  NewItemVMUtil.registeredVM(params, tag: tag);
  NewItemVM viewModel = NewItemVMUtil.vm(tag: tag);

  viewModel.util.notify();
}
