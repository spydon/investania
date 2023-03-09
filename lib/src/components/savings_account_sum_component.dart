import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/providers/savings_account_provider.dart';

class SavingsAccountSum extends Component with HasComponentRef {
  late TextComponent _textComponent;

  @override
  Future<void> onLoad() async {
    add(
      _textComponent = TextComponent(
        text: 'Sparkonto: 0',
        position: Vector2.zero(),
      ),
    );

    listen(savingsProviderProvider, (oldValue, newValue) {
      _textComponent.text = 'Sparkonto: ${newValue.sum}';
    });
  }
}
