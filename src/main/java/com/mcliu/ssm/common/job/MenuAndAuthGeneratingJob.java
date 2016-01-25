package com.mcliu.ssm.common.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.StatefulJob;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.aspire.webbas.core.util.SpringContextHolder;
import com.mcliu.ssm.web.service.MenuAndAuthService;

/**
 * 菜单和权限自动生成JOB
 */
public class MenuAndAuthGeneratingJob implements StatefulJob {
    private static final Logger LOGGER = LoggerFactory.getLogger(MenuAndAuthGeneratingJob.class);

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        LOGGER.debug("菜单和权限自动生成JOB 启动开始..............................");
        MenuAndAuthService menuAndAuthService = SpringContextHolder.getBean("menuAndAuthService");
        try {
            LOGGER.debug("菜单和权限自动生成JOB 业务逻辑开始...");
            menuAndAuthService.insertMenuAndAuth();
            LOGGER.debug("菜单和权限自动生成JOB 业务逻辑结束...");
            LOGGER.debug("菜单和权限自动生成JOB 执行结束..............................");
        } catch (Exception e) {
            LOGGER.error("菜单和权限自动生成JOB 发生异常 ：" + e.getMessage(), e);
        }
    }

}
