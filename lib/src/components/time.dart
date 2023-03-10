import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/providers/date_logic/time_manager.dart';

class Time extends Component with HasGameReference, HasComponentRef {
  late TextComponent _textComponent;

  @override
  Future<void> onLoad() async {
    add(
      _textComponent = TextComponent(
        position: Vector2(game.size.x / 2, 4),
        anchor: Anchor.topCenter,
      ),
    );
  }

  @override
  void onMount() {
    listen(timeManagerProvider, (oldValue, newValue) {
      _textComponent.text =
          '${newValue.year}/${_twoDigits(newValue.month)}/${_twoDigits(newValue.day)}';
    });
  }

  static String _twoDigits(int n) {
    if (n >= 10) {
      return '$n';
    }
    return '0$n';
  }

  @override
  void updateTree(double dt) {
    ref.read(timeManagerProvider.notifier).increment(dt);
  }
}
