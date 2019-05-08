import 'package:flutter/material.dart';
import 'dart:ui';
import 'listViewPage.dart';
import 'gridViewPage.dart';
import 'rowPage.dart';
import 'hybridView.dart';

/// 应用程序主入口
//void main() => runApp(new HybridView().widgetForRoute(window.defaultRouteName));
void main() => runApp(new HybridView().widgetForRoute('image_test'));
//void main() => runApp(new HybridView().widgetForRoute('edit-property?{"keyId":"123","trustType":2}'));

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '你好',
        home: Scaffold(
          appBar: AppBar(
            title: Text('hello'),
          ),
          body: Center(
              child: Text(
            '这是第一个,在不退出应用程序的情况下，尝试将下面的primarySwatch更改颜色。然后调用“hot reload”',
            textAlign: TextAlign.end,
          )),
        ));
  }
}

/// 应用程序Application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        /// 这是应用程序的主题。

        /// 尝试用“flutter run”运行您的应用程序。您将看到应用程序有一个蓝色工具栏。然后，
        /// 在不退出应用程序的情况下，尝试将下面的primarySwatch更改颜色。然后调用“hot reload”
        /// (在运行“flutter run”的控制台上按下“r”，或者简单地将更改保存到颤振IDE中的“hot reload”)。
        /// 注意计数器没有重置为零;应用程序没有重新启动。
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: '燕文强'),
    );
  }
}

/// 首页页面
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  /// 这个小部件是应用程序的首页。它是有状态的，这意味着它有一个状态对象(定义如下)，其中包含影响其外观的字段。
  /// 该类是状态的配置。它包含父组件(在本例中是标题)提供的值(在本例中是App小部件)，
  /// 并由状态的构建方法使用。小部件子类中的字段总是标记为“final”。
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 首页一个状态
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    /// 这个对setState的调用告诉flutter框架在这种状态下发生了一些变化，这将导致它重新运行下面的构建方法，
    /// 以便显示更新后的值。如果我们在不调用setState()的情况下更改了_counter，那么构建方法将不会再次被调用，因此不会发生任何事情。
    setState(() {
      _counter++;
    });
  }

  /// 每次调用setState时都会重新运行这个方法，例如上面的_incrementCounter方法。flutter框架经过优化，
  /// 可以快速地重新运行构建方法，这样您就可以重新构建任何需要更新的东西，而不必单独更改小部件的实例。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// 这里，我们从由App.build方法创建的MyHomePage对象中获取值，并使用它设置appbar标题。
        title: Text(widget.title),
      ),

      /// Center是一个布局小部件。它接受一个单独的子元素，并将其放置在父元素的中间。
      body: Center(
        /// Column也是布局小部件。它获取一个子列表并垂直排列它们。默认情况下，它将自己的大小调整为水平适合其子节点的大小，并尝试与父节点一样高。
        child: Column(
          // 调用“debug Paint”(在控制台中按“p”，从Android Studio中的Flutter Inspector中选择“Toggle debug Paint”操作，或者在Visual Studio代码中选择“Toggle debug Paint”命令)，查看每个小部件的线框图。
          // Column具有各种属性来控制其大小和子列的位置。这里我们使用mainAxisAlignment来垂直地将子元素居中;这里的主轴是纵轴，因为列是垂直的(横轴是水平的)。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '你按这个按钮这么多次了:',
            ),
            Text(
              '$_counter 次',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增量',
        child: Icon(Icons.add),
      ), // 这个逗号使自动格式化更适合于构建方法。
    );
  }
}
