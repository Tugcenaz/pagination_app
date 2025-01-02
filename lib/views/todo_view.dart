import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:provider/provider.dart';

import '../models/todo_model.dart';
import '../view_model/todoview_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  static const _pageSize = 20;

  final PagingController<int, Todos> _pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      final TodoModel? todoModel = await context
          .read<TodoViewModel>()
          .fetchData(skip: pageKey, limit: _pageSize);
      if (todoModel == null) throw Exception('Post verisi bulunamadı.');
      final todoList = todoModel.todos ?? [];
      final bool isLastPage = (todoList.length < _pageSize);

      if (isLastPage) {
        _pagingController.appendLastPage(todoList);
      } else {
        final nextPageKey = pageKey + todoList.length;
        _pagingController.appendPage(todoList, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Todos>(
          itemBuilder: (context, item, index) => productListWidget(
            todos: item,
          ),
          newPageProgressIndicatorBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget productListWidget({required Todos todos}) {
    return Column(
      children: [
        Text(todos.id.toString()),
        Text(todos.todo!),
      ],
    );
  }
}
