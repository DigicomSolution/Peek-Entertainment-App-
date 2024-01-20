import 'package:flutter/material.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';

import '../../helpers/constants/colors.dart';
import '../../model/app/dialog_request_model.dart';
import '../../model/enum.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequestModel request;
  final VoidCallback onMainTap;
  final VoidCallback onSecondaryTap;
  const BasicDialog(
      {Key? key,
      required this.request,
      required this.onMainTap,
      required this.onSecondaryTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: _BasicDialogContent(
          request: request,
          onMainTap: onMainTap,
          onSecondaryTap: onSecondaryTap,
        ));
  }
}

class _BasicDialogContent extends StatelessWidget {
  const _BasicDialogContent({
    Key? key,
    required this.request,
    required this.onMainTap,
    required this.onSecondaryTap,
  }) : super(key: key);

  final DialogRequestModel request;
  final VoidCallback onMainTap;
  final VoidCallback onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.normalBlack,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                request.title ?? '',
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium
                    ?.copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                request.description ?? '',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (request.secondaryButtonTitle != null)
                    TextButton(
                      onPressed: () => onSecondaryTap(),
                      child: Text(
                        request.secondaryButtonTitle!,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  TextButton(
                    onPressed: () => onMainTap(),
                    child: Text(request.mainButtonTitle ?? '',
                        style: const TextStyle(
                          color: AppColors.buttonColor,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: -28,
            child: CircleAvatar(
              minRadius: 16,
              maxRadius: 28,
              backgroundColor: _getStatusColor(request.data),
              child: Icon(
                _getStatusIcon(request.data),
                size: 28,
                color: Colors.white,
              ),
            ))
      ],
    );
  }

  Color _getStatusColor(dynamic customData) {
    if (customData is BasicDialogStatus) {
      switch (customData) {
        case BasicDialogStatus.error:
          return AppColors.red;
        case BasicDialogStatus.warning:
          return AppColors.yellow;
        default:
          return AppColors.primary;
      }
    } else {
      return AppColors.primary;
    }
  }

  IconData _getStatusIcon(dynamic regionDialogStatus) {
    if (regionDialogStatus is BasicDialogStatus) {
      switch (regionDialogStatus) {
        case BasicDialogStatus.error:
          return Icons.close;
        case BasicDialogStatus.warning:
          return Icons.warning_amber;
        default:
          return Icons.check;
      }
    } else {
      return Icons.check;
    }
  }
}
