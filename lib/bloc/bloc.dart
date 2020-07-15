import 'dart:async';
import 'package:english_words/english_words.dart';
import 'package:flutterblocstreamapp/screens/saved.dart';

class Bloc {
  //bloc pattern 은 sink로 데이터를 보내면 stream으로 return 해주는 방식
  Set<WordPair> saved = Set<WordPair>();

  final _savedController = StreamController<Set<WordPair>>.broadcast();
  //RandomListPage와 SavedListPage에서 Stream을 사용하고 있어 두 Page에 값을 보낼려고 broadcast 사용

//  Stream<Set<WordPair>> savedStream(){
////    return _savedController.stream;
////  }
  get savedStream => _savedController.stream;
  //get을 이용하여 getSavedStream 함수를 간략화

  get addCrrentSaved => _savedController.sink.add(saved);

  addToOrRemoveFromSavedList(WordPair item){
    //Set saved에 단어를 add or remove 함수
    if(saved.contains(item))
      saved.remove(item);
    else
      saved.add(item);
    print(saved.toString());
    _savedController.sink.add(saved);
    //변경된 데이터를 sink로 넣어주고 stream으로 나감
  }

  dispose() {
    //화면삭제시 호출  memory leak 를 없애기 위해
    _savedController.close();
  }
}

var bloc = Bloc();
//생성자
