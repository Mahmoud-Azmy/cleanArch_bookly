import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_bloc_builder.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  bool isLoading = false;
  int nextPage = 1;
  void scrollListener() async {
    ScrollPosition scroll = scrollController.position;
    if (scroll.pixels >= 0.7 * scroll.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchNewestBooksCubit>(context).fetchNewestBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: CustomAppBar()),
        Expanded(
          child: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: const [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FeaturedBooksListViewBlocBuilder(),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Newest Books',
                        style: Styles.textStyle18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: NewestBooksListViewBlocBuilder(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
