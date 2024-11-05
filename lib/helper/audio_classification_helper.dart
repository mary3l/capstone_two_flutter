/*
 * Copyright 2023 The TensorFlow Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *             http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class AudioClassificationHelper {
  AudioClassificationHelper(_modelPath, _labelsPath, _modelSize) {
    this._modelPath = _modelPath;
    this._labelsPath = _labelsPath;
    this._modelSize = _modelSize;
  }

  String _modelPath = '';
  String _labelsPath = '';
  int _modelSize = 0;
  late Interpreter _interpreter;
  late final List<String> _labels;
  late Tensor _inputTensor;
  late Tensor _outputTensor;

  Future<void> _loadModel() async {
    final options = InterpreterOptions();
    // Load model from assets
    _interpreter = await Interpreter.fromAsset(_modelPath, options: options);

    _inputTensor = _interpreter.getInputTensors().first;
    log(_inputTensor.shape.toString());
    _outputTensor = _interpreter.getOutputTensors().first;
    log(_outputTensor.shape.toString());
    log('Interpreter loaded successfully');
  }

  // Load labels from assets
  Future<void> _loadLabels() async {
    final labelTxt = await rootBundle.loadString(_labelsPath);
    _labels = labelTxt.split('\n');
  }

  Future<void> initHelper() async {
    await _loadLabels();
    await _loadModel();
  }

  Future<Map<String, double>> inferenceWithOverlap(Float32List input) async {
    const int expectedLength = 44100; // Expected input length
    int modelOutputSize = _modelSize; // Size of your model output
    var classification = <String, double>{};
    var speechOutput =
        List<double>.filled(modelOutputSize, 0).reshape([1, modelOutputSize]);
    // Validate input length

    // Define overlap size (e.g., 22050 samples)
    int overlapSize = expectedLength ~/ 2; // 22050

    for (int i = 0; i <= input.length - expectedLength; i += overlapSize) {
      // Extract chunk of 44100 samples
      Float32List chunk = input.sublist(i, i + expectedLength);
      try {
        _interpreter.run(chunk.reshape([1, expectedLength]), speechOutput);
        print(speechOutput);

        // Handle the output based on the output structure of the model
        for (var i = 0; i < speechOutput[0].length; i++) {
          if (i < _labels.length) {
            classification[_labels[i]] = speechOutput[0][i];
          } else {
            print('Warning: No label for index $i');
          }
        }
        return classification;
      } catch (e) {
        print('Error during inference: $e');
      }
    }
    return classification;
  }

  void closeInterpreter() {
    _interpreter.close();
  }
}
