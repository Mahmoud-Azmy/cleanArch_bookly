import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/functions/save_books.dart';
import 'package:bookly/core/utils/api_service.dart';

abstract class HomeRemoteDataSourec {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchRelativeBooks(
      {int pageNumber = 0, String category});
}

class HomeRemoteDataSourecImpl extends HomeRemoteDataSourec {
  ApiService apiService;
  HomeRemoteDataSourecImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=physics&sorting=newest&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchRelativeBooks(
      {int pageNumber = 0, String? category}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:$category&Sorting=relevance&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var element in data['items']) {
      books.add(BookModel.fromJson(element));
    }
    return books;
  }
}
