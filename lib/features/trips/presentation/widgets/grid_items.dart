import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/utils/responsive_builder.dart';
import 'package:users/features/trips/presentation/cubit/trips_cubit.dart';
import 'package:users/features/trips/presentation/widgets/item_card.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsCubit, TripsState>(
      builder: (context, state) {
        final items = state is TripsLoaded ? state.trips : [];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: ResponsiveBuilder.value(
            context: context,
            initial: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: ResponsiveBuilder.value(
                context: context,
                initial: 1,
                md: 3,
              ),
              mainAxisExtent: 322,
            ),
            lg: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 240,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 322,
            ),
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemCard(item: items[index]);
          },
        );
      },
    );
  }
}
