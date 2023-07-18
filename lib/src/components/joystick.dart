import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'package:investania/src/components/player.dart';

class Joystick extends Component with HasGameReference {
  late final JoystickComponent joystick;
  final Player player;

  Joystick(this.player);

  @override
  Future<void> onLoad() async {
    final image = await game.images.load('joystick.png');
    final sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 6,
      rows: 1,
    );
    add(ScreenHitbox());

    joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: sheet.getSpriteById(1),
        size: Vector2.all(100),
      ),
      background: SpriteComponent(
        sprite: sheet.getSpriteById(0),
        size: Vector2.all(150),
      ),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );

    add(joystick);
  }

  bool isDragging = false;

  final _controllerId = 'joystick';

  @override
  void update(double dt) {
    if (!joystick.delta.isZero()) {
      isDragging = true;
      player.setVelocity(
          _controllerId, Axis.horizontal, joystick.relativeDelta.x);
      player.setVelocity(_controllerId, Axis.vertical, joystick.relativeDelta.y);
    } else if (isDragging) {
      // Stopped dragging, update bool
      isDragging = false;
      player.setVelocity(_controllerId, Axis.horizontal, 0);
      player.setVelocity(_controllerId, Axis.vertical, 0);
    }
  }
}
