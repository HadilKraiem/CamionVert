import 'package:flutter/material.dart';
import 'package:ecoconnect/common/widgets/custom_rounded_containder.dart';
import 'package:ecoconnect/utilities/constants/colors.dart';
import 'package:ecoconnect/utilities/constants/images_texts.dart';
import 'package:ecoconnect/utilities/constants/sizes.dart';

class CustomBottleProgressReport extends StatelessWidget {
  const CustomBottleProgressReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      elevation: 1.5,
      width: double.infinity,
      padding: const EdgeInsets.all(CSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bottles recycled:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: CSizes.md),
                Text(
                  '4 / 100 items',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: CSizes.md),
                const LinearProgressIndicator(
                  color: CColors.primary,
                  value: 0.1,
                  minHeight: 6,
                )
              ],
            ),
          ),
          const Expanded(
            child: Image(
              image: AssetImage(CImages.petbottles),
              height: 65,
              width: 65,
            ),
          )
        ],
      ),
    );
  }
}
