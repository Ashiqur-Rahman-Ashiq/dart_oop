void main() {

  List<String> _names = ['Taqreq', 'Afsana', 'Imtiaz', 'Pulok', 'Robin', 'Samia', 'Rupok'];

  String input = 'sa';

  for(int i = 0; i<_names.length; i++) {
    if(_names[i].toLowerCase().contains(input)) {
      print(_names[i]);
    }
  }

}
