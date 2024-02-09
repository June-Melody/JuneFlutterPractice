import '../../vm/util.dart';
import 'params.dart';

dependencyInjection(NewMarkdownTempleteParams params, String? tag) {
  NewMarkdownTempleteVMUtil.registeredVM(params, tag: tag);
}
