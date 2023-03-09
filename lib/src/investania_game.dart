import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:investania/src/components/paycheck_component.dart';

class InvestaniaGame extends PositionComponent {
  late final CameraComponent camera;
  final World world = World();
  final PayCheckComponent payCheck = PayCheckComponent();

  @override
  Future<void> onLoad() async {
    camera = CameraComponent(world: world);

    addAll([camera, world]);
    world.addAll([
      payCheck,
      TextComponent(
        text: 'Investania',
        position: (camera.viewfinder.visibleGameSize ?? Vector2.zero()) / 2,
        anchor: Anchor.center,
      ),
    ]);
  }
}
