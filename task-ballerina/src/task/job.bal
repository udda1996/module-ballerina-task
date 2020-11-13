// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# A `Job` class is used to execute the ballerina function pointer .
public class Job {

    private function () fun;

    public isolated function init(function () func) {
        self.fun = func;
    }

    public function executeFunctionPointer(function () func) {
        var a = func();
    }

    public function onTrigger() {
        self.executeFunctionPointer(self.fun);
    }
}
