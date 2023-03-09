import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/components/invoice.dart';
import 'package:investania/src/components/paycheck.dart';

class PickUpManager extends Component with HasGameReference, HasComponentRef {
  final Vector2 defaultPickUpSpeed = Vector2(0, 50);
  final int maxPickUpsOnScreen = 4;
  final Timer invoiceSpawnTimer = Timer(7, repeat: true);
  final Timer paycheckSpawnTimer = Timer(5, repeat: true);

  List<Invoice> invoicePool = [];
  List<PayCheck> paycheckPool = [];
  int numberPickUpsOnScreen = 0;

  @override
  Future<void> onLoad() {
    invoiceSpawnTimer.onTick = _invoiceSpawner;
    invoiceSpawnTimer.start();

    paycheckSpawnTimer.onTick = _paycheckSpawner;
    paycheckSpawnTimer.start();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (numberPickUpsOnScreen <= maxPickUpsOnScreen) {
      invoiceSpawnTimer.update(dt);
      paycheckSpawnTimer.update(dt);
    }
    checkForRemovedPickUps();
  }

  void onNewLevel() {
    paycheckSpawnTimer.reset();
    invoiceSpawnTimer.reset();
  }

  void onLevelStop() {
    paycheckSpawnTimer.stop();
    invoiceSpawnTimer.stop();
    numberPickUpsOnScreen = 0;
    invoicePool = [];
    paycheckPool = [];
  }

  void checkForRemovedPickUps() {
    if (invoicePool.isEmpty || paycheckPool.isEmpty) {
      return;
    }

    invoicePool.removeWhere((element) {
      if (element.isRemoved) {
        numberPickUpsOnScreen--;
        return true;
      }
      return false;
    });

    paycheckPool.removeWhere((element) {
      if (element.isRemoved) {
        numberPickUpsOnScreen--;
        return true;
      }
      return false;
    });
  }

  void _invoiceSpawner() {
    invoicePool.add(Invoice(defaultPickUpSpeed));
    numberPickUpsOnScreen++;
    add(invoicePool.last);
  }

  void _paycheckSpawner() {
    paycheckPool.add(PayCheck(defaultPickUpSpeed));
    numberPickUpsOnScreen++;
    add(paycheckPool.last);
  }
}
