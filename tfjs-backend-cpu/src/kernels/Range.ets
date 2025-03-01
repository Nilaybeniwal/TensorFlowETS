/**
 * @license
 * Copyright 2020 Google LLC. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * =============================================================================
 */

import {KernelConfig, KernelFunc, Range, RangeAttrs, TensorInfo} from '@ohos/tfjs-core';

import {MathBackendCPU} from '../backend_cpu';
import {rangeImpl} from './Range_impl';

export function range(args: {backend: MathBackendCPU, attrs: RangeAttrs}):
    TensorInfo {
  const {backend, attrs} = args;
  const {start, stop, dtype, step} = attrs;

  const values = rangeImpl(start, stop, step, dtype);
  return backend.makeTensorInfo([values.length], dtype, values);
}

export const rangeConfig: KernelConfig = {
  kernelName: Range,
  backendName: 'cpu',
  kernelFunc: range as {} as KernelFunc
};
