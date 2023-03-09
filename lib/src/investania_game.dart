import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

import 'components/invoice.dart';

class InvestaniaGame extends PositionComponent {
  late final CameraComponent camera;
  final World world = World();

  @override
  Future<void> onLoad() async {
    camera = CameraComponent(world: world);
    addAll([camera, world]);
    world.addAll([
      TextComponent(
        text: 'Investania',
        position: (camera.viewfinder.visibleGameSize ?? Vector2.zero()) / 2,
        anchor: Anchor.center,
      ),
      Invoice(),
    ]);
  }
}
