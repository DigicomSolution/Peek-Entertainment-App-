import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

import '../../model/app/dialog_request_model.dart';
import '../../ui/widgets/basic_dialog.dart';

Future showBasicDialog(DialogRequestModel request,
    {VoidCallback? onMainTap, VoidCallback? onSecondaryTap}) async {
  return OneContext().showDialog(
      builder: (context) => BasicDialog(
            request: request,
            onSecondaryTap: onSecondaryTap != null
                ? () async {
                    onSecondaryTap();
                    Navigator.of(context).pop();
                  }
                : () {
                    Navigator.of(context).pop();
                  },
            onMainTap: onMainTap != null
                ? () async {
                    onMainTap();
                    Navigator.of(context).pop();
                  }
                : () {
                    Navigator.of(context).pop();
                  },
          ));
}
