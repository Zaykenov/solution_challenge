import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:solution_challenge/models/article_data.dart';

class ArticleService {
  static Future<List<Article>> fetchData() async {
    HttpLink link = HttpLink("https://d006-37-99-49-141.ngrok-free.app/query");
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    );

    QueryResult queryResult = await qlClient.query(
      QueryOptions(
        document: gql(
          """query {
          Posts {
            _id
            header
            image
            time_to_read
            text
            categories {
              _id
              name
            }
          }
        }""",
        ),
      ),
    );

    if (queryResult.hasException) {
      throw queryResult.exception!;
    }

    List<Article> articles = [];
    for (var articleData in queryResult.data!['Posts']) {
      List<Category> categories = [];
      for (var categoryData in articleData['categories']) {
        Category category = Category(
          id: categoryData['_id'],
          name: categoryData['name'],
        );
        categories.add(category);
      }

      Article article = Article(
        id: articleData['_id'],
        header: articleData['header'],
        image: articleData['image'],
        time_to_read: articleData['time_to_read'],
        text: articleData['text'],
        categories: categories,
      );

      articles.add(article);
    }
    return articles;
  }
}
