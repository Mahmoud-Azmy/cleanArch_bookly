import 'package:bookly/Features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: CustomAppBar()),
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
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
              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: NewestBooksListView(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
