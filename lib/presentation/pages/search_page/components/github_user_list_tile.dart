import 'package:flutter/material.dart';
import 'package:search_github_users/core/search/domain.dart';
import 'package:search_github_users/presentation/theme/theme.dart';

class GuthubUserListTile extends StatefulWidget {
  final GithubUser user;
  final GestureTapCallback? onTap;

  const GuthubUserListTile({
    Key? key,
    required this.user,
    this.onTap,
  }) : super(key: key);

  @override
  State<GuthubUserListTile> createState() => _GuthubUserListTileState();
}

class _GuthubUserListTileState extends State<GuthubUserListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.user.imageUrl.toString()),
        radius: 25,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.user.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4.0),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            decoration: BoxDecoration(
                color: AppColors.secundaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              '${widget.user.totalRepos.toString()} repositories',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
      onTap: widget.onTap,
    );
  }
}
