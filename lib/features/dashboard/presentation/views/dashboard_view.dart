import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const routeName = "dashboard";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardViewBody(),
    );
  }
}
