import 'package:flutter/material.dart';

import 'package:need_resume/need_resume.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../config/di.dart';
import '../config/loading.dart';
import '../config/params.dart';
import '../cycle/after_first_layout.dart';
import '../cycle/dispose.dart';
import '../cycle/init_state.dart';
import '../cycle/on_ready.dart';
import '../cycle/on_resume.dart';
import '../cycle/on_stop.dart';
import '../cycle/ready_view.dart';
import '../view.dart';

export '../config/params.dart';

class NewMarkdownPolicyViewDoNotPutViewAsWidget extends StatefulWidget {
  NewMarkdownPolicyViewDoNotPutViewAsWidget({
    super.key,
    this.heroKey,
    this.tag,
    this.readyDone = false,
    required this.params,
  }) {
    dependencyInjection(params, tag);
  }

  final NewMarkdownPolicyParams params;
  final Key? heroKey;
  final bool readyDone;
  final String? tag;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState
    extends ResumableState<NewMarkdownPolicyViewDoNotPutViewAsWidget>
    with AfterLayoutMixin<NewMarkdownPolicyViewDoNotPutViewAsWidget> {
  bool isReadyView = false;

  @override
  Widget build(BuildContext context) {
    return (!isReadyView)
        ? LoadingComponent(
            params: widget.params,
            tag: widget.tag,
          )
        : V(
            heroKey: widget.heroKey,
            params: widget.params,
            tag: widget.tag,
          );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    NewMarkdownPolicyViewAfterFirstLayout(context, widget.params, widget.tag);
  }

  @override
  void initState() {
    if (!widget.readyDone) {
      readyPage(widget.params, widget.params.context);
    } else {
      isReadyView = true;
    }
    NewMarkdownPolicyViewInitState(widget.params, widget.params.context);
    super.initState();
  }

  @override
  void onReady() {
    currentPageName = 'NewMarkdownPolicy';
    NewMarkdownPolicyViewOnReady();
  }

  @override
  void onResume() {
    currentPageName = 'NewMarkdownPolicy';
    NewMarkdownPolicyViewOnResume();
  }

  @override
  void onPause() {
    NewMarkdownPolicyViewOnStop();
  }

  bool isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    NewMarkdownPolicyViewDispose();
    isDisposed = true;
  }

  mySetState() {
    if (isDisposed == false) {
      setState(() {});
    }
  }

  Future<void> readyPage(
    NewMarkdownPolicyParams params,
    BuildContext context,
  ) async {
    if (isReadyView) return; // 이미 실행된 경우 종료
    params.context = context;
    await readyView(params, context, widget.tag);

    if (isDisposed == false) {
      setState(() {
        isReadyView = true;
      });
    }
  }
}
