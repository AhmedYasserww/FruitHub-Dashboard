
import 'package:ecommerce_app_dashboard/core/utils/app_color.dart';
import 'package:ecommerce_app_dashboard/core/utils/app_text_styles.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onTermsAccepted});
  final ValueChanged<bool> onTermsAccepted;
  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomCheckBox(
          onCheckBoxPressed: (value){
            isTermsAccepted=value;
            widget.onTermsAccepted(value);
            setState(() {});

          },
          isChecked:isTermsAccepted,
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Text("Is Featured item ?",style: AppTextStyles.bold16.copyWith(color: AppColors.primaryColor),)
        ),
      ],
    );
  }
}
