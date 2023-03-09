import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:investania/src/components/aie_account_sum.dart';
import 'package:investania/src/components/paycheck_component.dart';
import 'package:investania/src/components/player.dart';
import 'package:investania/src/components/savings_account_sum.dart';

class InvestaniaGame extends PositionComponent {
  late final CameraComponent camera;
  final World world = World();

  @override
  Future<void> onLoad() async {
    camera = CameraComponent(world: world);
    camera.viewfinder.anchor = Anchor.topLeft;
    addAll([camera, world]);
    world.addAll([
      Player(),
      PayCheckComponent(),
    ]);
    camera.viewport.add(SavingsAccountSum());
    camera.viewport.add(AieAccountSum());
  }
}
