import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum SnackbarType { error, success }

abstract class FeedbackSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
    SnackbarType? type,
    Color? color,
    Function? onClosedReaction,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              duration: duration,
              behavior: SnackBarBehavior.floating,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      message,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (kIsWeb)
                    InkWell(
                      child: Container(
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      onTap: ScaffoldMessenger.of(context).hideCurrentSnackBar,
                    ),
                ],
              ),
              backgroundColor: color ?? _getColorByType(context, type),
            ),
          )
          .closed
          .then((reaseon) {
        if (onClosedReaction != null) {
          onClosedReaction();
        }
      });
    }
  }

  static void remove(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }

  static Color? _getColorByType(
    BuildContext context,
    SnackbarType? type,
  ) {
    switch (type) {
      case SnackbarType.error:
        return Theme.of(context).errorColor;
      case SnackbarType.success:
        return Theme.of(context).accentColor;
      default:
        return null;
    }
  }
}
