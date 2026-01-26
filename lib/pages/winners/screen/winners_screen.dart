import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/pages/winners/bloc/winners_bloc.dart';
import 'package:alasfor/pages/winners/bloc/winners_event.dart';
import 'package:alasfor/pages/winners/bloc/winners_state.dart';
import 'package:alasfor/pages/winners/model/winners_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WinnersScreen extends StatefulWidget {
  const WinnersScreen({super.key});

  @override
  State<WinnersScreen> createState() => _WinnersScreenState();
}

class _WinnersScreenState extends State<WinnersScreen> {
  late WinnersBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = WinnersBloc();
    _bloc.add(const GetWinnersEvent());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<WinnersBloc, WinnersState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.isError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(state.errorMessage),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _bloc.add(const GetWinnersEvent()),
                      child: const AppText.body('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }

            if (state.winners.isEmpty) {
              return const Center(
                child: AppText.medium('لا يوجد فائزون حالياً'),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                _bloc.add(const RefreshWinnersEvent());
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.large('الفائزون'),
                    AppText.body("أشخاص حقيقيون يفوزون بجوائز حقيقية "),
                    const SizedBox(height: 50),
                    _buildWinnersList(state.winners),
                    if (state.isLoadingMore)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWinnersList(List<WinnerModel> winners) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: winners.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return _buildWinnerCard(winners[index]);
      },
    );
  }

  Widget _buildWinnerCard(WinnerModel winner) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                AppText.medium(winner.name, textAlign: TextAlign.center),
                const SizedBox(height: 4),
                AppText.body(
                  winner.prize,
                  textAlign: TextAlign.center,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 4),
                AppText.small(
                  winner.date,
                  textAlign: TextAlign.center,
                  color: AppColors.blueBorder,
                ),
              ],
            ),
            Positioned(
              top: -50,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 3),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(
                        winner.imageUrl,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDB913),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.emoji_events_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
