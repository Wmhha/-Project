package com.mhha.zhihuida.scoring;

import com.mhha.zhihuida.model.entity.App;
import com.mhha.zhihuida.model.entity.UserAnswer;

import java.util.List;

/**
 * 评分策略
 *
 * @author <a href="https://github.com/Wmhha">Wmhha</a>
 */
public interface ScoringStrategy {

    /**
     * 执行评分
     *
     * @param choices
     * @param app
     * @return
     * @throws Exception
     */
    UserAnswer doScore(List<String> choices, App app) throws Exception;
}