import 'dart:async' show Future;
import 'package:adapty_flutter/adapty_flutter.dart';

class SwimwaveAdapty {
  void Function(AdaptyError)? onSwimwaveAdaptyErrorOccurred;
  void Function(Object)? onSwimwaveUnknownErrorOccurred;

  final swimwaveAdapty = Adapty();

  static final SwimwaveAdapty _swimwaveInstance = SwimwaveAdapty._internal();

  factory SwimwaveAdapty() {
    return _swimwaveInstance;
  }

  SwimwaveAdapty._internal();

  Future<AdaptyProfile?> learCall() async {
    try {
      final kjnsdvsdsdpppqvds = await swimwaveAdapty.getProfile();
      return kjnsdvsdsdpppqvds;
    } on AdaptyError catch (adaptyError) {
      onSwimwaveAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onSwimwaveUnknownErrorOccurred?.call(e);
    }
    return null;
  }

  Future<void> initializeSwimwaveAdapty() async {
    try {
      swimwaveAdapty.setLogLevel(AdaptyLogLevel.verbose);
      swimwaveAdapty.activate();
    } on AdaptyError catch (adaptyError) {
      onSwimwaveAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onSwimwaveUnknownErrorOccurred?.call(e);
    }
  }

  Future<AdaptyPaywall?> swimwaveGetPaywall(
    String swimwavePaywallId,
  ) async {
    try {
      final swimwavekjnsdvsdsdpppqvds = await swimwaveAdapty.getPaywall(
        placementId: swimwavePaywallId,
        loadTimeout: const Duration(seconds: 5),
      );
      return swimwavekjnsdvsdsdpppqvds;
    } on AdaptyError catch (adaptyError) {
      onSwimwaveAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onSwimwaveUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<List<AdaptyPaywallProduct>?>swimwaveGetPaywallProducts(
    AdaptyPaywall swimwavePaywall,
  ) async {
    try {
      final swimwavekjnsdvsdsdpppqvds =
          await swimwaveAdapty.getPaywallProducts(paywall: swimwavePaywall);
      return swimwavekjnsdvsdsdpppqvds;
    } on AdaptyError catch (adaptyError) {
      onSwimwaveAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onSwimwaveUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<AdaptyProfile?> swimwaveMakePurchase(
      AdaptyPaywallProduct swimwaveProduct) async {
    try {
      final swimwavekjnsdvsdsdpppqvds =
          await swimwaveAdapty.makePurchase(product: swimwaveProduct);
      return swimwavekjnsdvsdsdpppqvds;
    } on AdaptyError catch (adaptyError) {
      onSwimwaveAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onSwimwaveUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<AdaptyProfile?> swimwaveRestorePurchases() async {
    try {
      final swimwavekjnsdvsdsdpppqvds = await swimwaveAdapty.restorePurchases();

      return swimwavekjnsdvsdsdpppqvds;
    } on AdaptyError catch (adaptyError) {
      onSwimwaveAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onSwimwaveUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<bool> swimwaveHasPremiumStatus() async {
    try {
      final swimwaveProfile = await swimwaveAdapty.getProfile();
      if (swimwaveProfile.accessLevels['premium']?.isActive ?? false) {
        return true;
      }
    } on AdaptyError catch (adaptyError) {
      onSwimwaveAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onSwimwaveUnknownErrorOccurred?.call(e);
    }

    return false;
  }
}
