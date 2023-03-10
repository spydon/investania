import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/providers/accounts/aie_account_provider.dart';

class AieAccountSum extends Component with HasGameReference, HasComponentRef {
  late TextComponent _textComponent;

  @override
  Future<void> onLoad() async {
    add(
      _textComponent = TextComponent(
        position: Vector2(game.size.x - 4, 4),
        anchor: Anchor.topRight,
      ),
    );

    listen(aieAccountProvider, (oldValue, newValue) {
      _textComponent.text = 'AIE: ${newValue.sum.toInt()} Kr';
    });
  }
}
