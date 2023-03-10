import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/components/aie_account_sum.dart';
import 'package:investania/src/components/background.dart';
import 'package:investania/src/components/input.dart';
import 'package:investania/src/components/paycheck_component.dart';
import 'package:investania/src/components/player.dart';
import 'package:investania/src/components/savings_account_sum.dart';
import 'package:investania/src/components/time.dart';
import 'package:investania/src/investania.dart';
import 'package:investania/src/providers/accounts/savings_account_provider.dart';
import 'package:investania/src/providers/date_logic/time_manager.dart';
import 'package:investania/src/providers/selected_investment_option_provider.dart';

class InvestaniaGame extends PositionComponent
    with HasGameReference<Investania>, HasComponentRef {
  late final CameraComponent camera;
  final World world = World();

  @override
  Future<void> onLoad() async {
    camera = CameraComponent(world: world);
    camera.viewfinder.anchor = Anchor.topLeft;
    final player = Player();
    addAll([camera, world]);
    world.addAll([
      Background(),
      Input(player),
      player,
      PayCheckComponent(),
      ScreenHitbox(),
    ]);

    // HUD
    camera.viewport.add(SavingsAccountSum());
    camera.viewport.add(AieAccountSum());
    camera.viewport.add(Time());

    listen(timeManagerProvider, (oldValue, newValue) {
      if (ref.read(timeManagerProvider.notifier).levelIsOver()) {
        final investmentOption = ref.read(selectedInvestmentOptionProvider);
        ref.read(savingsProvider.notifier).updateReturn(investmentOption);
        game.router.pushReplacementNamed('endOfYear');
      }
    });
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = size;
  }
}
