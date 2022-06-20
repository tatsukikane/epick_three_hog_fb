import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //フレームワークとFlutterエンジンを結びつける接着剤のような役割をする
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //利用しているプラットフォームを認識して、対応してくれる
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //ここの変数に今後firebaseの色々を代入していく
    // static   クラスのプロパティ/メソッドをインスタンス化せずに使用できるようにしてくれるもの
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //firebase上のusersコレクションへのアクセス
    //finalは定数化
  static final CollectionReference _users = _firestore.collection('users');

  //変数定義 非同期の変数 全て取得
  //final Stream<QuerySnapshot> _userStream = _users.snapshots();

  //whereでnameがたつきのデータのみを取得
  //final Stream<QuerySnapshot> _userStream = _users.where('name', isEqualTo: 'たつき').snapshots();

  //ageが25より小さい値のデータだけを取得
  //final Stream<QuerySnapshot> _userStream = _users.where('age', isLessThan: 25).snapshots();

  //データを新しく登録された順に2つだけ取得
  //final Stream<QuerySnapshot> _userStream = _users.limit(2).snapshots();

  //並び替え  数値の小さい順に上から並べる  文字列だったとしても数値が入っていれば適応可能
  //final Stream<QuerySnapshot> _userStream = _users.orderBy('age').snapshots();

  //並び替え  数値の大きい順に上から並べる  文字列だったとしても数値が入っていれば適応可能
  final Stream<QuerySnapshot> _userStream = _users.orderBy('age', descending: true).snapshots();


  






  //firebaseへのデータ追加処理
  //future<void>は非同期の時
  Future<void> addUser() async{
    //usersへ追加
    //時間のかかる処理には、awaitをつけてあげる
    await _users.add({
      //firebaseのfiledへの追加処理を書いていく
      //filedに定義されていない値も新規で追加可能
      'name': 'tatsuki2',
      'age': 25
    });
    //追加後の処理
    print('userの追加完了');
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //StreamBuilder  新しいイベントが発生するたびに、再ビルドすることができ、常に最新の状態を表示することができる
      body: StreamBuilder(
        stream: _userStream,
        //Builderは、ウェジェットをbuildするウェジェット
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //受け取ったsnapshotがエラーだったら
          if(snapshot.hasError){
            return const Text('エラーが発生しました。');

            //エラーではなくsnapshotがデータを持っているが、要素が空っぽだったら
          } else if(snapshot.hasData && snapshot.data!.docs.isEmpty){
            return const Text('ドキュメントがありません');

            //streamの場合は、doneにはならない waitingになる 読み込み中
          }else if(snapshot.connectionState == ConnectionState.waiting){
            //CircularProgressIndicator 読み込み中のまるのぐるぐるを表示
            return const CircularProgressIndicator();

            //読み込み終了
          } else {
            //list形式で、firebaseからデータを受け取る docsにデータが入っている
            List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
            //ListView スクロール可能なリスト表示
            return ListView(
              //受けっと配列から一つづつ doc に入れて処理していく
              children: docs.map((doc) {
                //map型の data 変数に docの中のデータを代入
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                //dataはオブジェクトになっているので、その中のnameの値をnameに代入
                String name = data['name'];
                int age = data['age'];
                return ListTile(
                  title: Text(name),
                  subtitle: Text(age.toString()),    //数値を文字列に変換

                );
              }).toList(),  //list型に
            );
          }
        },
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: addUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
