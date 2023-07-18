import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:investania/src/components/player.dart';

class Input extends Component {
  Input(this.player);

  final Player player;
  late final KeyboardListenerComponent keyboard;

  final _controllerId = 'keyboard';

  @override
  Future<void> onLoad() async {
    add(
      keyboard = KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.arrowLeft: (keys) {
            player.setVelocity(_controllerId, Axis.horizontal, -1);
            return true;
          },
          LogicalKeyboardKey.arrowRight: (keys) {
            player.setVelocity(_controllerId, Axis.horizontal, 1);
            return true;
          },
          LogicalKeyboardKey.arrowUp: (keys) {
            player.setVelocity(_controllerId, Axis.vertical, -1);
            return true;
          },
          LogicalKeyboardKey.arrowDown: (keys) {
            player.setVelocity(_controllerId, Axis.vertical, 1);
            return true;
          },
        },
        keyUp: {
          LogicalKeyboardKey.arrowLeft: (keys) {
            player.setVelocity(
              _controllerId,
              Axis.horizontal,
              keys.contains(LogicalKeyboardKey.arrowRight) ? 1 : 0,
            );
            return true;
          },
          LogicalKeyboardKey.arrowRight: (keys) {
            player.setVelocity(
              _controllerId,
              Axis.horizontal,
              keys.contains(LogicalKeyboardKey.arrowLeft) ? -1 : 0,
            );
            return true;
          },
          LogicalKeyboardKey.arrowUp: (keys) {
            player.setVelocity(
              _controllerId,
              Axis.vertical,
              keys.contains(LogicalKeyboardKey.arrowDown) ? 1 : 0,
            );
            return true;
          },
          LogicalKeyboardKey.arrowDown: (keys) {
            player.setVelocity(
              _controllerId,
              Axis.vertical,
              keys.contains(LogicalKeyboardKey.arrowUp) ? -1 : 0,
            );
            return true;
          },
        },
      ),
    );
  }
}
