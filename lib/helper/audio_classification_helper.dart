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
    log(_labels.toString());
  }

  Future<void> initHelper() async {
    await _loadLabels();
    await _loadModel();
  }

  Future<Map<String, double>> inference(Float32List input) async {
    // Check input length
    print('Input length: ${input.length}');

    // Validate input length
    if (input.length != 44100) {
      print('Error: Expected 44100 samples, but got ${input.length}');
      return {};
    }
    const int expectedLength = 44100; // Expected input length
    int modelOutputSize = _modelSize;
    var speechOutput =
        List<double>.filled(modelOutputSize, 0).reshape([1, modelOutputSize]);

    // Run inference
    try {
      // Run the model
      _interpreter.run(input.reshape([1, expectedLength]), speechOutput);
    } catch (e) {
      print('Error during inference: $e');
      return {};
    }

    // Process output
    var classification = <String, double>{};
    for (var i = 0; i < speechOutput[0].length; i++) {
      if (i < _labels.length) {
        classification[_labels[i]] = speechOutput[0][i];
      } else {
        print('Warning: No label for index $i');
      }
    }

    return classification;
  }

  void closeInterpreter() {
    _interpreter.close();
  }
}
