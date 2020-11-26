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

import ballerina/test;

service object {} stopTimerService = service object {
    resource isolated function get onTrigger() {
    }
};

@test:Config {}
function testSchedulerStop() {
    TimerConfiguration configuration = {
        intervalInMillis: 500,
        initialDelayInMillis: 2000
    };
    Scheduler timer = new (configuration);
    checkpanic timer.attach(stopTimerService);
    checkpanic timer.start();
    var expectedResult =  timer.stop();
    if (expectedResult is error) {
        test:assertFail("Scheduler stop failed");
    }
}