import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:investania/src/components/player.dart';
import 'package:investania/src/components/savings_account_sum_component.dart';

class InvestaniaGame extends PositionComponent {
  late final CameraComponent camera;
  final World world = World();

  @override
  Future<void> onLoad() async {
    camera = CameraComponent(world: world);
    camera.viewfinder.anchor = Anchor.topLeft;
    addAll([camera, world]);
    world.add(Player());
    camera.viewport.add(SavingsAccountSumComponent());
  }
}
