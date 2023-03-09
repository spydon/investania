import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/providers/accounts/savings_account_provider.dart';

class SavingsAccountSum extends Component with HasComponentRef {
  late TextComponent _textComponent;

  @override
  Future<void> onLoad() async {
    add(
      _textComponent = TextComponent(),
    );

    listen(savingsProviderProvider, (oldValue, newValue) {
      _textComponent.text = 'Sparkonto: ${newValue.sum.toInt()}';
    });
  }
}
