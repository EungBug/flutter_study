typedef Word = Map<String, String>;

class Dictionary {
  Word words = {};

  void add({required String term, required String definition}) {
    words[term] = definition;
  }

  String? get(String term) {
    return words[term];
  }

  void delete(String term) {
    words.remove(term);
  }

  void update(String term, String definition) {
    if (words.containsKey(term)) {
      words[term] = definition;
    }
  }

  List<String> showAll() {
    return words.keys.toList();
  }

  int count() {
    return words.length;
  }

  void upsert(String term, String definition) {
    words[term] = definition;
  }

  bool exists(String term) {
    return words.containsKey(term);
  }

  void bulkAdd(List<Word> list) {
    for (var i in list) {
      add(term: i["term"]!, definition: i["definition"]!);
    }
  }

  void bulkDelete(List<String> list) {
    for (var term in list) {
      delete(term);
    }
  }
}

void main() {
  var dictionary = Dictionary();
  dictionary.add(term: '딸기', definition: '겨울 과일');
  dictionary.add(term: '목도리', definition: '목에 두르는 악세서리');
  dictionary.add(term: '치와와', definition: '강아지');

  print(dictionary.get('딸기'));

  dictionary.delete('목도리');
  dictionary.update('치와와', '강아지 종류임!');

  print(dictionary.showAll());

  print(dictionary.count());

  dictionary.upsert('아파트', '비싼 집');
  dictionary.upsert('짱구', '일본 애니메이션 캐릭터');

  print(dictionary.exists('곰'));

  dictionary.bulkAdd([
    {"term": "맥북", "definition": "애플 노트북"},
    {"term": "아이폰", "definition": "애플 스마트폰"}
  ]);
  dictionary.bulkDelete(['아파트', '짱구']);

  print(dictionary.words);
}
