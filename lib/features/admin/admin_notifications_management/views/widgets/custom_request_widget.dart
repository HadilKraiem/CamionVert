import 'package:flutter/material.dart';
import 'package:ecoconnect/common/widgets/custom_activity.dart';
import 'package:ecoconnect/common/widgets/custom_rounded_containder.dart';
import 'package:ecoconnect/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';
import 'package:ecoconnect/features/user/user_notifications_management/model/request_model.dart';
import 'package:ecoconnect/utilities/formatters/input_formatters.dart';

class CustomRequestWidget extends StatelessWidget {
  const CustomRequestWidget({
    super.key,
    required this.request,
  });

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final controller = AdminNotificationsController.instance;
    final style = Theme.of(context).textTheme.bodyMedium;
    return CustomActivity(
      leading: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.status,
            style: style,
          ),
          CustomRoundedContainer(
            backgroundColor: controller.getColorBasedOnStatus(request.status),
            width: 15,
            height: 15,
            radius: 40,
          ),
        ],
      ),
      title: request.address,
      subTitle: request.phoneNumber,
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(request.bottleQuantity, style: style),
          Text(
            CFormatters.formatDate(request.createdAt),
            style: style,
          ),
        ],
      ),
    );
  }
}
