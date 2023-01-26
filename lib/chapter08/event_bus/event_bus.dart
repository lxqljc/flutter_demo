/// User: xiaoquanluo
/// Date: 2023/1/26
/// description: 事件总线

/// 订阅者回调签名
typedef EventCallback = void Function(dynamic args);

class EventBus {
  /// 私有构造函数
  EventBus._interanl();

  /// 保存单例
  static final EventBus _singleton = EventBus._interanl();

  /// 工厂构造函数
  factory EventBus() => _singleton;

  /// 保存事件订阅队列，key：事件名(id) , value 对应事件的订阅队列
  final Map<Object, List<EventCallback>?> _eMap = <Object, List<EventCallback>>{};

  /// 添加订阅者
  void on(String eventName, EventCallback f) {
    _eMap[eventName] ??= <EventCallback>[];
    _eMap[eventName]!.add(f);
  }

  /// 移除订阅者
  void off(String eventName, [EventCallback? f]) {
    List<EventCallback>? list = _eMap[eventName];
    if (list == null) return;
    if (f == null) {
      _eMap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  /// 触发事件后，该事件所有订阅者会被调用
  void emit(String eventName, [arg]) {
    List<EventCallback>? list = _eMap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    // 反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (int i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

//定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
var bus = EventBus();
