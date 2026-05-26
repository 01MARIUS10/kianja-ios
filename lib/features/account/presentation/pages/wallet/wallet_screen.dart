import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/account/presentation/pages/wallet/wallet_content.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AccountBloc>(),
      child: const BaseScreen(
        appBar: TitleHeader(title: 'Kara'),
        child: WalletContent(),
      ),
    );
  }
}
