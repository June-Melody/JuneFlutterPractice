import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../config/di.dart';
import '../config/loading.dart';
import '../config/params.dart';
import '../cycle/after_first_layout.dart';
import '../cycle/dispose.dart';
import '../cycle/init_state.dart';



import '../cycle/ready_view.dart';
import '../view.dart';

export '../config/params.dart';

class NewItemColumnButton4View extends StatefulWidget {
  NewItemColumnButton4View({
    super.key,
    this.heroKey,
    this.tag,
    this.readyDone = false,
    required this.params,
  }) {
    dependencyInjection(params, tag);
  }

  final NewItemColumnButton4Params params;
  final Key? heroKey;
  final bool readyDone;
  final String? tag;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<NewItemColumnButton4View>
    with AfterLayoutMixin<NewItemColumnButton4View> {
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
    NewItemColumnButton4ViewAfterFirstLayout(
        context, widget.params, widget.tag);
  }

  @override
  void initState() {
    if (!widget.readyDone) {
      readyPage(widget.params, context);
    } else {
      isReadyView = true;
    }
    NewItemColumnButton4ViewInitState(widget.params, widget.params.context);
    super.initState();
  }

  bool isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    NewItemColumnButton4ViewDispose();
    isDisposed = true;
  }

  mySetState() {
    if (isDisposed == false) {
      setState(() {});
    }
  }

  Future<void> readyPage(
    NewItemColumnButton4Params params,
    BuildContext context,
  ) async {
    if (isReadyView) return; // already executed, exit
    params.context = context;
    await readyView(params, context, widget.tag);

    if (isDisposed == false) {
      setState(() {
        isReadyView = true;
      });
    }
  }
}