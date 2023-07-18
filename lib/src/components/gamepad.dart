import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:gamepads/gamepads.dart';
import 'package:investania/src/components/player.dart';

class Gamepad extends Component {
  final Player player;

  Gamepad(this.player);

  @override
  Future<void> onLoad() async {
    Gamepads.events.listen(handleEvent);
  }

  void handleEvent(GamepadEvent event) {
    switch (event) {
      case GamepadEvent() when event.key == 'l.joystick - yAxis':
        player.setVelocity(event.gamepadId, Axis.vertical, -event.value);
      case GamepadEvent() when event.key == 'l.joystick - xAxis':
        player.setVelocity(event.gamepadId, Axis.horizontal, event.value);
    }
  }
}
