import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  CameraController? cameraController;

  BarcodeScannerStatus(
      {this.isCameraAvailable = false,
      this.stopScanner = false,
      this.error = "",
      this.barcode = "",
      this.cameraController});
  
  factory BarcodeScannerStatus.available(CameraController controller) => BarcodeScannerStatus(isCameraAvailable: true, cameraController: controller);

  factory BarcodeScannerStatus.error(String message) => BarcodeScannerStatus(error: message, stopScanner: true);

  factory BarcodeScannerStatus.barcode(String code) => BarcodeScannerStatus(barcode: code, stopScanner: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
