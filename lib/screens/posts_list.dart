import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';
import '../widgets/post_card.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  late Future<List<Post>> futurePosts;
  List<Post> filteredPosts = [];
  TextEditingController searchController = TextEditingController();
  bool isSearchExpanded = false;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
    searchController.addListener(() {
      filterPosts();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterPosts() async {
    final posts = await futurePosts;
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredPosts = posts
          .where((post) => post.title.toLowerCase().contains(query))
          .toList();
    });
  }

  void toggleSearchBar() {
    setState(() {
      isSearchExpanded = !isSearchExpanded;
      if (!isSearchExpanded) {
        searchController.clear();
        filterPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: toggleSearchBar,
          ),
        ],
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isSearchExpanded ? 70.0 : 0.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: isSearchExpanded
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search posts...',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[400],
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 14.0),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear, color: Colors.black54),
                          onPressed: () {
                            searchController.clear();
                            filterPosts();
                          },
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          Expanded(
            child: FutureBuilder<List<Post>>(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final postsToShow = filteredPosts.isNotEmpty ||
                          searchController.text.isNotEmpty
                      ? filteredPosts
                      : snapshot.data!;
                  return postsToShow.isNotEmpty
                      ? ListView.builder(
                          itemCount: postsToShow.length,
                          itemBuilder: (context, index) {
                            final post = postsToShow[index];
                            // Edit this part to add IconButton to favorite the post
                            return PostCard(post: post);
                          },
                        )
                      : const Center(child: Text('No Posts Found'));
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
