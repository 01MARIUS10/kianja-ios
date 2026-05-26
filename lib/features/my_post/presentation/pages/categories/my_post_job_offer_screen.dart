import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_job_offer_item_list.dart';

class MyPostJobOfferScreen extends StatelessWidget {
  const MyPostJobOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<MyPostBloc>()
            ..add(const MyPostGetAllJobOffersRequested()),
      child: BlocConsumer<MyPostBloc, MyPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MyPostRequestInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MyPostRequestFailure) {
            return ServerFailureScreen(
              onRetry: () {
                BlocProvider.of<MyPostBloc>(
                  context,
                ).add(const MyPostGetAllJobOffersRequested());
              },
              message: state.message,
            );
          } else if (state is MyPostGetAllJobOffersSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.paddingSmall,
              ),
              itemCount: state.jobOffers.length,
              itemBuilder: (context, index) {
                return MyPostJobOfferItemList(jobOffer: state.jobOffers[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: Constants.spacingSmall);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
