import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.newestBooksList});
  final List<BookEntity> newestBooksList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return BookListViewItem(
          bookEntity: newestBooksList[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: newestBooksList.length,
    );
  }
}


// import 'package:bookly/Features/home/domain/entities/book_entity.dart';
// import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/fetch_newest_books_cubit.dart';
// import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NewestBooksListView extends StatefulWidget {
//   const NewestBooksListView({Key? key, required this.newestBooksList})
//       : super(key: key);

//   final List<BookEntity> newestBooksList;

//   @override
//   _NewestBooksListViewState createState() => _NewestBooksListViewState();
// }

// class _NewestBooksListViewState extends State<NewestBooksListView> {
//   late final ScrollController scrollController;
//   @override
//   void initState() {
//     super.initState();
//     scrollController = ScrollController();
//     scrollController.addListener(scrollListener);
//   }

//   bool isLoading = false;
//   int nextPage = 1;
//   void scrollListener() async {
//     ScrollPosition scroll = scrollController.position;
//     if (scroll.pixels >= 0.7 * scroll.maxScrollExtent) {
//       if (!isLoading) {
//         isLoading = true;
//         await BlocProvider.of<FetchNewestBooksCubit>(context).fetchNewestBooks(
//           pageNumber: nextPage++,
//         );
//         isLoading = false;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       controller: scrollController,
//       shrinkWrap: true,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       itemBuilder: (context, index) {
//         return BookListViewItem(
//           bookEntity: widget.newestBooksList[index],
//         );
//       },
//       separatorBuilder: (context, index) => const SizedBox(
//         height: 10,
//       ),
//       itemCount: widget.newestBooksList.length,
//     );
//   }
// }
