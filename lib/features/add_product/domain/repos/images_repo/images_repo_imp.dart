import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/features/add_product/domain/repos/images_repo/images_repo.dart';

class ImagesRepoImp implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
  
}