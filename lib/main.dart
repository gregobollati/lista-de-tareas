import 'package:flutter/material.dart';
void main() => runApp(new FluApp());
class FluApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Lista de Tareas',
        home: new TodoList()
    );
  }
}
class TodoList extends StatefulWidget {
  createState() => new TodoListState();
}
class TodoListState extends State<TodoList> {
  List<String> _tItems = [];
  void _addItem(String zxc) {
    if(zxc.length > 0) {
      setState(() => _tItems.add(zxc));
    }
  }
  void _removeItem(int qwe) {
    setState(() => _tItems.removeAt(qwe));
  }
  void _rremoveItem(int qwe) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Quieres eliminar la tarea?'),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('Cancelar'),
                    onPressed: () => Navigator.of(context).pop()
                ),
                new FlatButton(
                    child: new Text('Eliminar'),
                    onPressed: () {
                      _removeItem(qwe);
                      Navigator.of(context).pop();
                    }
                )
              ]
          );
        }
    );
  }
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (asd, qwe) {
        if(qwe < _tItems.length) {
          return _buildTodoItem(_tItems[qwe], qwe);
        }
      },
    );
  }
  Widget _buildTodoItem(String tText, int qwe) {
    return new ListTile(
        title: new Text(tText),
        onTap: () => _rremoveItem(qwe)
    );
  }
  Widget build(BuildContext asd) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Lista de Tareas')
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTarea,
          tooltip: 'asd',
          child: new Icon(Icons.add)
      ),
    );
  }
  void _addTarea() {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (asd) {
              return new Scaffold(
                  appBar: new AppBar(
                      title: new Text('Ingresa una tarea')
                  ),
                  body: new TextField(
                    autofocus: true,
                    onSubmitted: (val) {
                      _addItem(val);
                      Navigator.pop(asd);
                    },
                  )
              );
            }
        )
    );
  }
}