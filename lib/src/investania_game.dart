import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:investania/src/components/aie_account_sum.dart';
import 'package:investania/src/components/input.dart';
import 'package:investania/src/components/paycheck_component.dart';
import 'package:investania/src/components/player.dart';
import 'package:investania/src/components/savings_account_sum.dart';
import 'package:investania/src/components/time.dart';

class InvestaniaGame extends PositionComponent {
  late final CameraComponent camera;
  final World world = World();

  @override
  Future<void> onLoad() async {
    camera = CameraComponent(world: world);
    camera.viewfinder.anchor = Anchor.topLeft;
    final player = Player();
    addAll([camera, world]);
    world.addAll([
      Input(player),
      player,
      PayCheckComponent(),
      ScreenHitbox(),
    ]);

    // HUD
    camera.viewport.add(SavingsAccountSum());
    camera.viewport.add(AieAccountSum());
    camera.viewport.add(Time());
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = size;
  }
}
