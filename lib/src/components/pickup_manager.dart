import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/components/invoice.dart';
import 'package:investania/src/components/paycheck.dart';
import 'package:investania/src/providers/accounts/aie_account_provider.dart';
import 'package:investania/src/providers/date_logic/time_manager.dart';

class PickUpManager extends Component with HasGameReference, HasComponentRef {
  final Vector2 defaultPickUpSpeed = Vector2(0, 200);
  final int maxPickUpsOnScreen = 4;
  final Timer invoiceSpawnTimer = Timer(7, repeat: true);
  final Timer delayedInvoiceSpawnTimer = Timer(3, repeat: true);
  final Timer paycheckSpawnTimer = Timer(5, repeat: true);

  List<Invoice> invoicePool = [];
  List<Invoice> delayedInvoicePool = [];
  List<PayCheck> paycheckPool = [];
  int numberPickUpsOnScreen = 0;

  @override
  Future<void> onLoad() {
    invoiceSpawnTimer.onTick = _invoiceSpawner;
    invoiceSpawnTimer.start();

    delayedInvoiceSpawnTimer.onTick = _delayedInvoiceSpawner;
    delayedInvoiceSpawnTimer.start();

    paycheckSpawnTimer.onTick = _paycheckSpawner;
    paycheckSpawnTimer.start();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (ref.read(timeManagerProvider.notifier).levelIsOver()) {
      ref.read(aieAccountProvider.notifier)
        ..remove(-500 * delayedInvoicePool.length)
        ..setDeductable(-500 * delayedInvoicePool.length);
    }

    super.update(dt);

    if (numberPickUpsOnScreen <= maxPickUpsOnScreen) {
      invoiceSpawnTimer.update(dt);
      delayedInvoiceSpawnTimer.update(dt);
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
        if (!element.pickedUp) {
          delayedInvoicePool.insert(0, element);
        }

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

  void _delayedInvoiceSpawner() {
    if (delayedInvoicePool.isNotEmpty) {
      final invoice = Invoice(defaultPickUpSpeed)
        ..dueDate = delayedInvoicePool.removeAt(0).dueDate;

      add(invoice);
      invoicePool.add(invoice);

      if (invoice.dueDate.isBefore(ref.read(timeManagerProvider))) {
        invoice.tint(const Color(0xaaFF0000));
      }
    }
  }

  void _invoiceSpawner() {
    Invoice invoice;
    if (invoicePool.length < 12) {
      invoicePool.add(
        Invoice(defaultPickUpSpeed)
          ..dueDate =
              ref.read(timeManagerProvider).add(const Duration(days: 30)),
      );

      invoice = invoicePool.last;
    } else {
      invoice = invoicePool.first;
    }

    numberPickUpsOnScreen++;
    add(invoice);
  }

  void _paycheckSpawner() {
    paycheckPool.add(PayCheck(defaultPickUpSpeed));
    numberPickUpsOnScreen++;
    add(paycheckPool.last);
  }
}
