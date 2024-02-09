import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../vm/vm.dart';
import 'config/params.dart';
import 'util/view_skeleton.dart';
import '../../_/vm/vm.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewAllowItemParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => GetBuilder<NewAllowItemVM>(
        tag: widget.tag,
        autoRemove: false,
        builder: (vmNewAllowItem) => Row(
          children: [
            Row(
              children: [
                Icon(FontAwesomeIcons.check)
                    .iconSize(15)
                    .padding(top: 2)
                    .opacity(vmNew.ItemAllows[widget.params.id] ? 0.9 : 0.1),
                Gap(15),
                Text(
                  widget.params.label,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ).fontWeight(FontWeight.w200).opacity(0.7).expanded(),
              ],
            ).height(48).backgroundColor(Colors.transparent).gestures(onTap: () {
              vmNew.itemClick(widget.params.id);
              widget.params.onTap.call();
            }).expanded(),
            IconButton(
                onPressed: () {
                  widget.params.detailPageOnTap.call();
                },
                icon: Icon(Icons.navigate_next))
                .opacity(0.3)
                .backgroundColor(Colors.transparent),
          ],
        ).paddingDirectional(bottom: 5).backgroundColor(Colors.transparent),
      ),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewAllowItemView(
      tag: "someTag",
      params: NewAllowItemParams(
        id: 0,
        label: "some label",
        onTap: () {},
        detailPageOnTap: () {},
      ),
    ),
  ));
}
