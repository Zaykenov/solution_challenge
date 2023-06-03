import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:solution_challenge/models/article_data.dart';

class ArticleService {
  static Future<List<Article>> fetchData() async {
    HttpLink link = HttpLink('https://fb5d-95-47-192-227.ngrok-free.app');
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
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
            creationDate
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
      Article article = Article(
        id: articleData['id'],
        header: articleData['header'],
        categories: Category(
          id: articleData['categories']['id'],
          name: articleData['categories']['name'],
        ),
        image: articleData['image'],
        time_to_read: articleData['time_to_read'],
        creationDate: DateTime.parse(articleData['creationDate']),
      );

      articles.add(article);
    }
    return articles;
  }
}
