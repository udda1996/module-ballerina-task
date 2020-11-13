/*
 *  Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  WSO2 Inc. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */
package org.ballerinalang.stdlib.task.utils;

import io.ballerina.runtime.api.Runtime;
import io.ballerina.runtime.api.values.BObject;
import org.ballerinalang.stdlib.task.objects.ServiceInformation;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

/**
 * Represents a Quartz job related to an appointment.
 */
public class TaskJob implements Job {

    public TaskJob() {
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        if (jobExecutionContext.getMergedJobDataMap().size() > 1) {
            TaskExecutor.executeFunction1((BObject) jobExecutionContext.getMergedJobDataMap().
                    get(TaskConstants.JOB), (Runtime) jobExecutionContext.getMergedJobDataMap().
                    get(TaskConstants.RUNTIME));
        } else {
            TaskExecutor.executeFunction((ServiceInformation) jobExecutionContext.getMergedJobDataMap().
                    get(TaskConstants.JOB));
        }
    }
}
