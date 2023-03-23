import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/text_filed_custom.dart';

abstract class BaseListView extends StatefulWidget {
  const BaseListView({Key? key}) : super(key: key);
  Future loadMoreCallBack();
  List<Object> get list;
  Widget itemTemplate(Object? item);

  @override
  State<BaseListView> createState() => _BaseListViewState();
}

class _BaseListViewState extends State<BaseListView> {
  ScrollController scrollController = ScrollController();
  final controllerUserName = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
    //
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadData();
      }
    });
  }

  void loadData() async {
    await widget.loadMoreCallBack();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          TextFiledUserName(
            hintText: "User name",
            controller: controllerUserName,
          ),
          ListView.separated(
            controller: scrollController,
            itemCount: widget.list.length + 1,
            itemBuilder: (context, index) {
              if (index == widget.list.length) {
                return const CupertinoActivityIndicator();
              }
              return widget.itemTemplate(widget.list[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ],
      ),
    );
  }
}

abstract class Base extends StatelessWidget {
  Base({Key? key}) : super(key: key);
  Future loadMoreCallBack();
  List<Object> get list;
  Widget itemTemplate(Object? item);
  final controller = ScrollController();
  bool _isFutureBuilderCalled = true;

  Future<bool> loadData() async {
    await loadMoreCallBack();
    if (list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isFutureBuilderCalled
        ? FutureBuilder<bool>(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _isFutureBuilderCalled = false;
                // Dữ liệu đã được tải, hiển thị ListView.
                return listViewLoadMore();
              } else if (snapshot.hasError) {
                // Xử lý lỗi nếu có.
                return Text('Error: ${snapshot.error}');
              } else {
                // Hiển thị trạng thái đang tải.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        : listViewLoadMore();
  }

  NotificationListener<ScrollNotification> listViewLoadMore() {
    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              controller.position.extentAfter == 0) {
            loadMoreCallBack();
          }
          return false;
        },
        child: ListView.separated(
          controller: controller,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return itemTemplate(list[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}

abstract class BaseListView1 extends StatefulWidget {
  const BaseListView1({Key? key}) : super(key: key);
  Future loadMoreCallBack();
  List<Object> get list;
  Widget itemTemplate(Object? item);
  ScrollController get scrollController;

  @override
  State<BaseListView1> createState() => _BaseListViewState1();
}

class _BaseListViewState1 extends State<BaseListView1> {
  void loadData() async {
    await widget.loadMoreCallBack();
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        loadData();
      }
    });

    return ListView.separated(
      controller: widget.scrollController,
      itemCount: widget.list.length + 1,
      itemBuilder: (context, index) {
        if (index == widget.list.length) {
          return const CupertinoActivityIndicator();
        }
        return widget.itemTemplate(widget.list[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}

abstract class BaseListView2 extends StatelessWidget {
  const BaseListView2({Key? key}) : super(key: key);
  Future loadMoreCallBack();
  List<Object> get list;
  Widget itemTemplate(Object? item);
  ScrollController get scrollController;

  void loadData() async {
    await loadMoreCallBack();
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadData();
      }
    });

    return ListView.separated(
      controller: scrollController,
      itemCount: list.length + 1,
      itemBuilder: (context, index) {
        if (index == list.length) {
          return const CupertinoActivityIndicator();
        }
        return itemTemplate(list[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
