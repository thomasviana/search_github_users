import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_github_users/presentation/theme/theme.dart';

import 'bloc/search_page_bloc.dart';
import 'components/github_user_list_tile.dart';
import 'components/search_box.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Search'),
        leadingWidth: 42,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset(
            'assets/github_logo.png',
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
          return Column(
            children: [
              SearchBox(
                onChanged: (query) => context
                    .read<SearchPageBloc>()
                    .add(QueryChangedEvent(query.trim())),
                hintText: 'Search by username',
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state is SearchPageInitial)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: SafeArea(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/search.png',
                                  scale: 15.0,
                                ),
                                const SizedBox(height: 20.0),
                                const Text(
                                  '¡Welcome to Github Search! \nUse the search bar above to start \nsearching users by name',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (state is SearchPageError)
                      Center(
                        child: Text(
                            'SERVER ERROR: ${state.exception.statusCode.toString()}'),
                      ),
                    if (state is SearchPageEmptyState)
                      const Center(child: Text('NO RESULTS FOUND')),
                    if (state is SearchPageLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (state is SearchPageLoaded)
                      Expanded(
                        child: ListView.separated(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GuthubUserListTile(
                            user: state.users[index],
                          ),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: state.users.length,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
