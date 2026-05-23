import 'package:flutter/material.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_job_offer_item_list.dart';

class MyPostJobOfferScreen extends StatelessWidget {
  const MyPostJobOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: Constants.paddingSmall),
      itemCount: 15,
      itemBuilder: (context, index) {
        return MyPostJobOfferItemList(
          trainingCenter: TrainingCenter(
            id: index,
            name: 'Training Center $index',
            description: 'Description for Training Center $index',
            imageUrl: '',
            images: [],
            user: const User.empty(),
            createdAt: '',
          ),
        );
      },
    );
  }
}
