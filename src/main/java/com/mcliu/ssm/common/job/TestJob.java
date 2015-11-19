package com.mcliu.ssm.common.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.StatefulJob;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.aspire.webbas.core.util.SpringContextHolder;

/**
 * 定时任务测试类
 */
public class TestJob implements StatefulJob {

    private static final Logger LOG = LoggerFactory.getLogger(TestJob.class);

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        LOG.debug("TestJob 启动开始..............................");
        try {
            LOG.debug("TestJob 业务逻辑开始...");
            testJobBusiness();
            LOG.debug("TestJob 业务逻辑结束...");
        } catch (Exception e) {
            LOG.error("TestJob 发生异常 ：" + e.getMessage(), e);
        }
    }

    public void testJobBusiness() {
//      FlowOrderInfoExtService fllowOrderInfoService = SpringContextHolder.getBean("flowOrderInfoExtService");
        System.out.println("-------【主业务方法】【测试定时任务】-------");
    }

}
