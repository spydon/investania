import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/investania_game.dart';
import 'package:investania/src/screens/about.dart';
import 'package:investania/src/screens/end_of_year.dart';
import 'package:investania/src/screens/high_score_screen.dart';
import 'package:investania/src/screens/menu.dart';
import 'package:investania/src/screens/set_savings_options.dart';

class Investania extends FlameGame
    with HasComponentRef, HasKeyboardHandlerComponents, HasCollisionDetection {
  Investania(WidgetRef ref) {
    HasComponentRef.widgetRef = ref;
  }

  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    FlameAudio.bgm.initialize();
    router = RouterComponent(
      initialRoute: 'menu',
      routes: {
        'menu': OverlayRoute(
          (context, game) {
            FlameAudio.bgm
                .stop()
                .then((value) => FlameAudio.bgm.play('cream.mp3'));
            return Menu(
              context: context,
              router: router,
            );
          },
        ),
        'about': OverlayRoute(
          (context, game) => About(
            router: router,
          ),
        ),
        'game': Route(InvestaniaGame.new, maintainState: false),
        'highscore': OverlayRoute(
          (context, game) => HighScore(game: this),
        ),
        'setSavingsOptions': OverlayRoute(
          (context, game) => SetSavingsOptions(
            context: context,
            router: router,
          ),
        ),
        'endOfYear': OverlayRoute(
          (context, game) {
            FlameAudio.bgm
                .stop()
                .then((value) => FlameAudio.bgm.play('cream.mp3'));
            return EndOfYear(
              context: context,
              router: router,
            );
          },
        ),
      },
    );
    add(router);
  }

  void reset() {
    router.pushOverlay('highscore');
  }
}
