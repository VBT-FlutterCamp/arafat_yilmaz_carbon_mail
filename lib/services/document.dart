import 'package:mail_ui/feature/homeScreen/model/todomodel.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Todo?>?> getTodoList() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return todoFromJson(response.body);
    } else {
      return null;
    }
  }
}
