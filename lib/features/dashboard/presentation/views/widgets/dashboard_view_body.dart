import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: "Add Data",
            onPressed: (){
Navigator.pushNamed(context, AddProductView.routeName);
          },
          )
        ],
      ),
    );
  }
}
