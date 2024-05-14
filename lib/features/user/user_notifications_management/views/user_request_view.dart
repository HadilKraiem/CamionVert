import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecoconnect/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:ecoconnect/common/widgets/buttons/custom_text_button.dart';
import 'package:ecoconnect/common/widgets/curved_edges/curved_edge_widget.dart';
import 'package:ecoconnect/features/user/user_notifications_management/views/user_request_notification_view.dart';
import 'package:ecoconnect/utilities/constants/images_texts.dart';
import 'package:ecoconnect/utilities/constants/sizes.dart';
import 'package:ecoconnect/utilities/constants/texts.dart';
import 'widgets/user_pickup_request_form.dart';
import 'widgets/custom_request_title_with_icon.dart';

class UserRequestView extends StatelessWidget {
  const UserRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //section 1
            CustomCurvedEdgeWidget(
              child: Container(
                height: 105,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(CImages.requestBackground),
                  ),
                ),
              ),
            ),

            //section 2
            CustomLayoutWithScrollAndPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomRequestTitleWithIcon(
                        icon: Icons.recycling,
                        title: 'EcoConnect bottles Recycling',
                      ),
                      CustomTextButton(
                        text: "View Requests",
                        onPressed: () => Get.to(
                          () => const UserRequestNotificationsView(),
                        ),
                      )
                    ],
                  ),

                  //
                  const SizedBox(height: CSizes.md),

                  Text(
                    CTexts.recycleInstructions,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  //
                  const SizedBox(height: CSizes.lg),

                  //
                  const UserPickupRequestForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
