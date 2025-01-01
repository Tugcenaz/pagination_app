import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination_app/view_model/post_viewmodel.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  static const _pageSize = 20;

  final PagingController<int, Posts> _pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      // Yükleme simülasyonu için gecikme ekle
      await Future.delayed(const Duration(seconds: 2));
      final PostModel? postData = await context
          .read<PostViewModel>()
          .fetchData(skip: pageKey, limit: _pageSize);
      if (postData == null) throw Exception('Post verisi bulunamadı.');
      final postList = postData.posts!;
      final bool isLastPage = (postList.length < _pageSize);

      if (isLastPage) {
        _pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + postList.length;
        _pagingController.appendPage(postList, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Posts>(
          itemBuilder: (BuildContext context, Posts post, int index) =>
              postWidget(post: post),
          newPageProgressIndicatorBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget postWidget({required Posts post}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            post.title ?? '',
            style: const TextTheme().titleMedium,
          ),
          Text(
            post.body ?? '',
            style: const TextTheme().titleMedium,
          ),
          Text(
            post.id.toString() ?? '',
            style: const TextTheme().titleMedium,
          ),
        ],
      ),
    );
  }
}
