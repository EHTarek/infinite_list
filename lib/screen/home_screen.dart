import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/api/api_bloc.dart';
import 'package:infinite_list/bloc/api/api_event.dart';
import 'package:infinite_list/bloc/api/api_state.dart';
import 'package:infinite_list/model/data_result_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Title'),
        ),
        body: const MainFragmentContainer());
  }
}

class MainFragmentContainer extends StatefulWidget {
  const MainFragmentContainer({super.key});

  @override
  MainFragmentContainerState createState() => MainFragmentContainerState();
}

class MainFragmentContainerState extends State<MainFragmentContainer> {
  final _size = 10;

  bool _canLoadMore = false;
  int _page = 0;

  final List<DataResultModel> _dataAirline = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<ApiBloc>().add(ApiEventGetAirlineList(page: _page, size: _size));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    context.read<ApiBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiBloc, ApiState>(
      buildWhen: (context, listState) {
        return listState is ApiStateLoaded;
      },
      builder: (context, listState) {
        if (listState is ApiStateInitial) {
          return LoadingView();
        }
        if (listState is ApiStateLoaded) {
          if (_dataAirline.isNotEmpty == true) {
            _dataAirline.removeAt(
                _dataAirline.length - 1); // remove circular progress
          }

          listState.listAirline.data.asMap().forEach((key, value) {
            _dataAirline.add(value);
          });
          // _dataAirline.add(Datum()); // for circular item at the end of list

          _canLoadMore = true;

          return _buildContentView(context, _dataAirline.cast<DataResultModel>());
        }
        if (listState is ApiStateError) {
          return _buildEmptyView();
        }
        return _buildEmptyView();
      },
      listenWhen: (context, state) {
        return state is ApiStateError;
      },
      listener: (context, state) {
        if (state is ApiStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message!),
            ),
          );
        }
      },
    );
  }

  // if list is not exist, show this view
  Widget _buildEmptyView() => Container();

  // if list is still loading, show this view
  Widget LoadingView() => const Center(child: CircularProgressIndicator());

  // if list is exist, show this view
  Widget _buildContentView(BuildContext context, List<DataResultModel>? listAirline) {
    return Column(
      children: [_buildBodyList(listAirline)],
    );
  }

  Widget _buildBodyList(List<DataResultModel>? listAirline) {
    return Flexible(
      flex: 1,
      child: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 0), () {
            setState(() {
              _canLoadMore = true;
              _page = 0;
              _dataAirline.clear();
              context.read<ApiBloc>().add(ApiEventGetAirlineList(page: _page, size: _size));
            });
          });
        },
        child: ListView.separated(
          itemCount: listAirline?.length ?? 0,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            if (listAirline![index].id.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListTile(
                leading: Text(index.toString()),
                title: Text(listAirline[index].name.toString()),
                subtitle: Text(listAirline[index].airline[0].name.toString()),
              );
            }
          },
          controller: _scrollController
            ..addListener(() {
              if (_scrollController.offset >=
                      _scrollController.position.maxScrollExtent &&
                  _canLoadMore) {
                setState(() {
                  _page = _page + 1;
                  _canLoadMore = false;
                  context.read<ApiBloc>().add(ApiEventGetAirlineList(page: _page, size: _size));
                });
              }
            }),
        ),
      ),
    );
  }
}
