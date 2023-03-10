import 'package:flame/components.dart';
import 'package:flame/src/components/router_component.dart';
import 'package:flutter/services.dart';
import 'package:investania/src/components/player.dart';

class Input extends Component {
  Input(this.player, this.router);

  final Player player;
  final RouterComponent router;
  late final KeyboardListenerComponent keyboard;

  @override
  Future<void> onLoad() async {
    add(
      keyboard = KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.arrowLeft: (keys) {
            player.direction.x = -1;
            return true;
          },
          LogicalKeyboardKey.arrowRight: (keys) {
            player.direction.x = 1;
            return true;
          },
          LogicalKeyboardKey.arrowUp: (keys) {
            player.direction.y = -1;
            return true;
          },
          LogicalKeyboardKey.arrowDown: (keys) {
            player.direction.y = 1;
            return true;
          },
          LogicalKeyboardKey.escape: (keys) {
            router.pushNamed('pause');
            return true;
          },
        },
        keyUp: {
          LogicalKeyboardKey.arrowLeft: (keys) {
            player.direction.x =
                keys.contains(LogicalKeyboardKey.arrowRight) ? 1 : 0;
            return true;
          },
          LogicalKeyboardKey.arrowRight: (keys) {
            player.direction.x =
                keys.contains(LogicalKeyboardKey.arrowLeft) ? -1 : 0;
            return true;
          },
          LogicalKeyboardKey.arrowUp: (keys) {
            player.direction.y =
                keys.contains(LogicalKeyboardKey.arrowDown) ? 1 : 0;
            return true;
          },
          LogicalKeyboardKey.arrowDown: (keys) {
            player.direction.y =
                keys.contains(LogicalKeyboardKey.arrowUp) ? -1 : 0;
            return true;
          },
        },
      ),
    );
  }
}
