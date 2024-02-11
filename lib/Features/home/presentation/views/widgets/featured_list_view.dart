import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchFeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView,
                    extra: widget.books[index]);
              },
              child: CustomBookImage(
                imageUrl: widget.books[index].image ?? '',
              ),
            ),
          );
        },
      ),
    );
  }
}


// class FeaturedBooksListView extends StatelessWidget {
//   const FeaturedBooksListView({
//     Key? key,
//     required this.bookEntity,
//   }) : super(key: key);

//   final List<BookEntity> bookEntity;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * .3,
//       child: NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification notification) {
//           if (notification is ScrollEndNotification &&
//               notification.metrics.pixels >=
//                   notification.metrics.maxScrollExtent * 0.7) {
//             // Trigger the request when 70% of the ListView is scrolled
//             FetchFeaturedBooksCubit.get(context).fetchFeaturedBooks();
//           }
//           return false;
//         },
//         child: ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: CustomBookImage(
//                 imageUrl: bookEntity[index].image ?? '',
//               ),
//             );
//           },
//           itemCount: bookEntity.length,
//         ),
//       ),
//     );
//   }
// }








// import 'package:bookly/Features/home/domain/entities/book_entity.dart';
// import 'package:flutter/material.dart';

// import 'custom_book_item.dart';

// class FeaturedBooksListView extends StatelessWidget {
//   const FeaturedBooksListView({Key? key, required this.bookEntity})
//       : super(key: key);
//   final List<BookEntity> bookEntity;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * .3,
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: CustomBookImage(
//               imageUrl: bookEntity[index].image ?? '',
//             ),
//           );
//         },
//         itemCount: bookEntity.length,
//       ),
//     );
//   }
// }
