import 'package:serverpod/serverpod.dart';
import 'package:todo_server/src/generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  Future<List<Todo>> getTodoList(Session session, {int? id}) async {
    return Todo.find(
      session,
      where: (table) => id != null ? table.id.equals(id) : Constant(true),
      orderBy: Todo.t.createdAt,
    );
  }

  Future<bool> addTodo(Session session, Todo todo) async {
    await Todo.insert(session, todo);
    return true;
  }

  Future<bool> deleteTodo(Session session, int id) async {
    await Todo.delete(
      session,
      where: (todo) {
        return todo.id.equals(id);
      },
    );

    return true;
  }

  Future<bool> toggleTodo(Session session, int id) async {
    final todo = await Todo.findById(session, id);
    if (todo != null) {
      await Todo.update(
        session,
        todo..completed = !todo.completed,
      );

      return true;
    } else {
      return false;
    }
  }
}
