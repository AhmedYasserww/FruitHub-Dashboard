import 'dart:io';

import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/widgets/isFeaturedCheckBox.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late TextEditingController productNameController;
  late TextEditingController productPriceController;
  late TextEditingController productCodeController;
  late TextEditingController productDescriptionController;
   File  ? fileImage;
   bool isFeatured = false;


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    productNameController = TextEditingController();
    productPriceController = TextEditingController();
    productCodeController = TextEditingController();
    productDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    productCodeController.dispose();
    productDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: productNameController,
                hintText: " product name",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: productPriceController,
                hintText: " Product price",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: productCodeController,
                hintText: "Product code",
                keyboardType: TextInputType.number,
                onChange: (value) {
                  productCodeController.value = productCodeController.value.copyWith(
                    text: value!.toLowerCase(),
                    selection: TextSelection.collapsed(offset: value.length),
                  );
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: productDescriptionController,
                maxLine: 5,
                hintText: " Product description",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              IsFeaturedCheckBox(onTermsAccepted: (value) {
                isFeatured = value;
              }),
              const SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                fileImage= image;
                },
              ),
              const SizedBox(height: 16),
              CustomButton(text: "Submit", onPressed: (){
                if(fileImage != null){
                  if (formKey.currentState!.validate()) {
                    print("Product Name: ${productNameController.text}");
                    print("Product Price: ${productPriceController.text}");
                    print("Product Code: ${productCodeController.text}");
                    print("Product Description: ${productDescriptionController.text}");
                    formKey.currentState!.save();
                    AddProductInputEntity input = AddProductInputEntity(
                      code: productCodeController.text,
                      description: productDescriptionController.text,
                      isFeatured:isFeatured ,
                      image: fileImage!,
                      name: productNameController.text,
                      price: productPriceController.text
                    );
                  }
                  else{
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                }
                else{
                  showError(context);
                }


              }),
             const  SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please select an image"),
      ),
    );

  }
}
