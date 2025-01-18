local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local l_Models_0 = l_Parent_0.Src.Models;
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
local v6 = require(l_Actions_0.Watch.SetVariablesScopeFilteredOut);
local v7 = require(l_Actions_0.Watch.SetVariablesTextFilteredOut);
local v8 = require(l_Actions_0.Watch.SetVariableExpanded);
local v9 = require(l_Actions_0.Watch.AddRootVariables);
local v10 = require(l_Actions_0.Watch.AddChildVariables);
local v11 = require(l_Actions_0.Watch.RemoveDummyVariableFromParent);
local v12 = require(l_Actions_0.Watch.AddChildExpression);
local v13 = require(l_Actions_0.Watch.AddExpression);
local v14 = require(l_Actions_0.Watch.ChangeExpression);
local v15 = require(l_Actions_0.Watch.ExpressionEvaluated);
local v16 = require(l_Actions_0.Watch.ExpressionsEvaluated);
local v17 = require(l_Actions_0.Watch.RemoveExpression);
local v18 = require(l_Actions_0.Watch.SetExpansionTree);
local v19 = require(l_Actions_0.Watch.SetWatchSortState);
local v20 = require(l_Actions_0.Watch.SetExpressionExpanded);
local v21 = require(l_Actions_0.Watch.ClearAllExpressions);
local v22 = require(l_Actions_0.Common.SimPaused);
local v23 = require(l_Actions_0.Common.Resumed);
local v24 = require(l_Actions_0.Common.ClearConnectionData);
local v25 = require(l_Actions_0.Watch.ScopeFilterChange);
local v26 = require(l_Actions_0.Watch.VariablesFilterChange);
local v27 = require(l_Actions_0.Watch.MyWatchesFilterChange);
local v28 = require(l_Actions_0.Watch.SetTab);
local v29 = require(l_Actions_0.Watch.FilterTextChanged);
local _ = require(l_Models_0.DebuggerStateToken);
local _ = require(l_Models_0.Watch.VariableRow);
local _ = require(l_Models_0.Watch.WatchRow);
local v33 = require(l_Models_0.Watch.ScopeEnum);
local v34 = require(l_Models_0.Watch.TableTab);
local v35 = require(l_Models_0.Watch.VariablesColumnEnum);
local v36 = require(l_Models_0.Watch.MyWatchesColumnEnum);
local v37 = require(l_Parent_0.Src.Util.Constants);
local function v40(v38, v39) --[[ Line: 97 ]] --[[ Name: nilCheckFillIn ]]
    assert(v38[v39.debuggerStateToken] ~= nil);
    if v38[v39.debuggerStateToken][v39.threadId] == nil then
        v38[v39.debuggerStateToken][v39.threadId] = {};
    end;
    if v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber] == nil then
        v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber] = {};
    end;
    if v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber].Variables == nil then
        v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber].Variables = {};
    end;
    if v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber].Watches == nil then
        v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber].Watches = {};
    end;
end;
local function _(v41, v42) --[[ Line: 122 ]] --[[ Name: nilCheckBase ]]
    if v41[v42.debuggerStateToken] == nil then
        assert(false);
        return false;
    elseif v41[v42.debuggerStateToken][v42.threadId] == nil then
        assert(false);
        return false;
    elseif v41[v42.debuggerStateToken][v42.threadId][v42.frameNumber] == nil then
        assert(false);
        return false;
    else
        return true;
    end;
end;
local function v48(v44, v45) --[[ Line: 140 ]] --[[ Name: nilCheckVariable ]]
    local l_stepStateBundle_0 = v45.stepStateBundle;
    local v47;
    if v44[l_stepStateBundle_0.debuggerStateToken] == nil then
        assert(false);
        v47 = false;
    elseif v44[l_stepStateBundle_0.debuggerStateToken][l_stepStateBundle_0.threadId] == nil then
        assert(false);
        v47 = false;
    elseif v44[l_stepStateBundle_0.debuggerStateToken][l_stepStateBundle_0.threadId][l_stepStateBundle_0.frameNumber] == nil then
        assert(false);
        v47 = false;
    else
        v47 = true;
    end;
    if v47 == false then
        return false;
    else
        v47 = v44[l_stepStateBundle_0.debuggerStateToken][l_stepStateBundle_0.threadId][l_stepStateBundle_0.frameNumber];
        if v47.Variables == nil then
            assert(false);
            return false;
        elseif v45.path ~= nil and v47.Variables[v45.path] == nil then
            assert(false);
            return false;
        elseif v45.parentPath ~= nil and v47.Variables[v45.parentPath] == nil then
            assert(false);
            return false;
        else
            return true;
        end;
    end;
end;
local function v53(v49, v50, v51) --[[ Line: 170 ]] --[[ Name: nilCheckWatch ]]
    local v52;
    if v49[v50.debuggerStateToken] == nil then
        assert(false);
        v52 = false;
    elseif v49[v50.debuggerStateToken][v50.threadId] == nil then
        assert(false);
        v52 = false;
    elseif v49[v50.debuggerStateToken][v50.threadId][v50.frameNumber] == nil then
        assert(false);
        v52 = false;
    else
        v52 = true;
    end;
    if v52 == false then
        return false;
    else
        v52 = v49[v50.debuggerStateToken][v50.threadId][v50.frameNumber];
        if v52.Watches == nil then
            assert(false);
            return false;
        elseif v51.path ~= nil and v52.Watches[v51.path] == nil then
            assert(false);
            return false;
        elseif v51.parentPath ~= nil and v52.Watches[v51.parentPath] == nil then
            assert(false);
            return false;
        else
            return true;
        end;
    end;
end;
local function _(v54, v55) --[[ Line: 198 ]] --[[ Name: indexOf ]]
    for v56, v57 in pairs(v54) do
        if v57 == v55 then
            return v56;
        end;
    end;
    return nil;
end;
local v59 = {
    stateTokenToRoots = {}, 
    stateTokenToFlattenedTree = {}, 
    currentTab = v34.Variables, 
    listOfEnabledScopes = {
        v33.Local, 
        v33.Upvalue, 
        v33.Global
    }, 
    listOfVariablesColumns = {
        v35.Scope, 
        v35.Value, 
        v35.DataType
    }, 
    listOfMyWatchesColumns = {
        v36.Value, 
        v36.DataType
    }, 
    listOfExpressions = {}, 
    pathToExpansionState = {}, 
    expressionToExpansionState = {}, 
    filterText = "", 
    variablesSortDirection = nil, 
    variablesColumnIndex = nil, 
    watchesSortDirection = nil, 
    watchesColumnIndex = nil
};
return v1.createReducer(v59, {
    [v22.name] = function(v60, v61) --[[ Line: 225 ]]
        -- upvalues: v2 (copy)
        assert((not (v60.stateTokenToRoots[v61.debuggerStateToken] ~= nil) or v60.stateTokenToRoots[v61.debuggerStateToken][v61.threadId] == nil) and (v60.stateTokenToFlattenedTree[v61.debuggerStateToken] == nil or v60.stateTokenToFlattenedTree[v61.debuggerStateToken][v61.threadId] == nil));
        return v2.Dictionary.join(v60, {
            stateTokenToRoots = v2.Dictionary.join(v60.stateTokenToRoots, {
                [v61.debuggerStateToken] = v2.Dictionary.join(v60.stateTokenToRoots[v61.debuggerStateToken] or {}, {
                    [v61.threadId] = {}
                })
            }), 
            stateTokenToFlattenedTree = v2.Dictionary.join(v60.stateTokenToFlattenedTree, {
                [v61.debuggerStateToken] = v2.Dictionary.join(v60.stateTokenToFlattenedTree[v61.debuggerStateToken] or {}, {
                    [v61.threadId] = {}
                })
            })
        });
    end, 
    [v23.name] = function(v62, v63) --[[ Line: 257 ]]
        -- upvalues: l_deepCopy_0 (copy), v2 (copy)
        assert(v62.stateTokenToRoots[v63.debuggerStateToken] ~= nil);
        if v62.stateTokenToRoots[v63.debuggerStateToken][v63.threadId] == nil then
            return v62;
        else
            local v64 = false;
            if v62.stateTokenToFlattenedTree[v63.debuggerStateToken] ~= nil then
                v64 = v62.stateTokenToFlattenedTree[v63.debuggerStateToken][v63.threadId] ~= nil;
            end;
            assert(v64);
            local v65 = l_deepCopy_0(v62.stateTokenToRoots[v63.debuggerStateToken]);
            v65[v63.threadId] = nil;
            v64 = l_deepCopy_0(v62.stateTokenToFlattenedTree[v63.debuggerStateToken]);
            v64[v63.threadId] = nil;
            return v2.Dictionary.join(v62, {
                stateTokenToRoots = v2.Dictionary.join(v62.stateTokenToRoots, {
                    [v63.debuggerStateToken] = v65
                }), 
                stateTokenToFlattenedTree = v2.Dictionary.join(v62.stateTokenToFlattenedTree, {
                    [v63.debuggerStateToken] = v64
                })
            });
        end;
    end, 
    [v24.name] = function(v66, v67) --[[ Line: 286 ]]
        -- upvalues: v2 (copy)
        local v68 = false;
        if v66.stateTokenToRoots[v67.debuggerStateToken] ~= nil then
            v68 = v66.stateTokenToFlattenedTree[v67.debuggerStateToken] ~= nil;
        end;
        local v69 = true;
        for _, _ in pairs(v66.stateTokenToRoots) do
            v69 = false;
        end;
        assert(v68 or v69);
        return v2.Dictionary.join(v66, {
            stateTokenToRoots = v2.Dictionary.join(v66.stateTokenToRoots, {
                [v67.debuggerStateToken] = v2.None
            }), 
            stateTokenToFlattenedTree = v2.Dictionary.join(v66.stateTokenToFlattenedTree, {
                [v67.debuggerStateToken] = v2.None
            })
        });
    end, 
    [v9.name] = function(v72, v73) --[[ Line: 307 ]]
        -- upvalues: l_deepCopy_0 (copy), v40 (copy), v2 (copy)
        local v74 = l_deepCopy_0(v72.stateTokenToRoots);
        v40(v74, v73.stepStateBundle);
        local l_stepStateBundle_1 = v73.stepStateBundle;
        local l_Variables_0 = v74[l_stepStateBundle_1.debuggerStateToken][l_stepStateBundle_1.threadId][l_stepStateBundle_1.frameNumber].Variables;
        for _, v78 in ipairs(v73.tokenizedList) do
            table.insert(l_Variables_0, v78);
        end;
        local v79 = l_deepCopy_0(v72.stateTokenToFlattenedTree);
        v40(v79, v73.stepStateBundle);
        local l_Variables_1 = v79[l_stepStateBundle_1.debuggerStateToken][l_stepStateBundle_1.threadId][l_stepStateBundle_1.frameNumber].Variables;
        for v81, v82 in pairs(v73.newVarsMapping) do
            l_Variables_1[v81] = v82;
        end;
        return v2.Dictionary.join(v72, {
            stateTokenToRoots = v74, 
            stateTokenToFlattenedTree = v79
        });
    end, 
    [v10.name] = function(v83, v84) --[[ Line: 334 ]]
        -- upvalues: l_deepCopy_0 (copy), v48 (copy), v2 (copy)
        local v85 = l_deepCopy_0(v83.stateTokenToFlattenedTree);
        if v48(v85, v84) == false then
            return v83;
        else
            local l_stepStateBundle_2 = v84.stepStateBundle;
            local l_Variables_2 = v85[l_stepStateBundle_2.debuggerStateToken][l_stepStateBundle_2.threadId][l_stepStateBundle_2.frameNumber].Variables;
            for v88, v89 in pairs(v84.newVarsMapping) do
                l_Variables_2[v88] = v89;
            end;
            local l_childPaths_0 = l_Variables_2[v84.parentPath].childPaths;
            for _, v92 in ipairs(v84.childKeys) do
                table.insert(l_childPaths_0, v92);
            end;
            return v2.Dictionary.join(v83, {
                stateTokenToFlattenedTree = v85
            });
        end;
    end, 
    [v11.name] = function(v93, v94) --[[ Line: 359 ]]
        -- upvalues: l_deepCopy_0 (copy), v48 (copy), v53 (copy), v37 (copy), v2 (copy)
        local v95 = l_deepCopy_0(v93.stateTokenToFlattenedTree);
        local l_stepStateBundle_3 = v94.stepStateBundle;
        local v97 = nil;
        if v94.isVariablesTab then
            if v48(v95, v94) == false then
                return v93;
            else
                v97 = v95[l_stepStateBundle_3.debuggerStateToken][l_stepStateBundle_3.threadId][l_stepStateBundle_3.frameNumber].Variables;
            end;
        elseif v53(v95, v94.stepStateBundle, v94) == false then
            return v93;
        else
            v97 = v95[l_stepStateBundle_3.debuggerStateToken][l_stepStateBundle_3.threadId][l_stepStateBundle_3.frameNumber].Watches;
        end;
        v97[v94.parentPath].childPaths = {};
        v97[v94.parentPath .. v37.SeparationToken .. v37.DummyRowName] = nil;
        return v2.Dictionary.join(v93, {
            stateTokenToFlattenedTree = v95
        });
    end, 
    [v8.name] = function(v98, v99) --[[ Line: 388 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v98, {
            pathToExpansionState = v2.Dictionary.join(v98.pathToExpansionState, {
                [v99.path] = v99.expanded
            })
        });
    end, 
    [v20.name] = function(v100, v101) --[[ Line: 397 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v100, {
            expressionToExpansionState = v2.Dictionary.join(v100.expressionToExpansionState, {
                [v101.path] = v101.expanded
            })
        });
    end, 
    [v6.name] = function(v102, v103) --[[ Line: 406 ]]
        -- upvalues: l_deepCopy_0 (copy), v48 (copy), v2 (copy)
        local v104 = l_deepCopy_0(v102.stateTokenToFlattenedTree);
        if v48(v104, v103) == false then
            return v102;
        else
            local l_stepStateBundle_4 = v103.stepStateBundle;
            local l_Variables_3 = v104[l_stepStateBundle_4.debuggerStateToken][l_stepStateBundle_4.threadId][l_stepStateBundle_4.frameNumber].Variables;
            for v107, v108 in pairs(v103.textFilterMap) do
                l_Variables_3[v107].scopeFilteredOut = v108;
            end;
            return v2.Dictionary.join(v102, {
                stateTokenToFlattenedTree = v104
            });
        end;
    end, 
    [v7.name] = function(v109, v110) --[[ Line: 425 ]]
        -- upvalues: l_deepCopy_0 (copy), v48 (copy), v2 (copy)
        local v111 = l_deepCopy_0(v109.stateTokenToFlattenedTree);
        if v48(v111, v110) == false then
            return v109;
        else
            local l_stepStateBundle_5 = v110.stepStateBundle;
            local v113 = if v110.isVariablesTab then v111[l_stepStateBundle_5.debuggerStateToken][l_stepStateBundle_5.threadId][l_stepStateBundle_5.frameNumber].Variables else v111[l_stepStateBundle_5.debuggerStateToken][l_stepStateBundle_5.threadId][l_stepStateBundle_5.frameNumber].Watches;
            for v114, v115 in pairs(v110.textFilterMap) do
                v113[v114].textFilteredOut = v115;
            end;
            return v2.Dictionary.join(v109, {
                stateTokenToFlattenedTree = v111
            });
        end;
    end, 
    [v28.name] = function(v116, v117) --[[ Line: 446 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v116, {
            currentTab = v117.currentTab
        });
    end, 
    [v25.name] = function(v118, v119) --[[ Line: 452 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v118, {
            listOfEnabledScopes = v119.listOfEnabledScopes
        });
    end, 
    [v26.name] = function(v120, v121) --[[ Line: 458 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v120, {
            listOfVariablesColumns = v121.listOfVariablesColumns
        });
    end, 
    [v27.name] = function(v122, v123) --[[ Line: 464 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v122, {
            listOfMyWatchesColumns = v123.listOfMyWatchesColumns
        });
    end, 
    [v12.name] = function(v124, v125) --[[ Line: 470 ]]
        -- upvalues: l_deepCopy_0 (copy), v53 (copy), v2 (copy)
        local v126 = l_deepCopy_0(v124.stateTokenToFlattenedTree);
        if v53(v126, v125.stepStateBundle, v125) == false then
            return v124;
        else
            local l_Watches_0 = v126[v125.stepStateBundle.debuggerStateToken][v125.stepStateBundle.threadId][v125.stepStateBundle.frameNumber].Watches;
            for v128, v129 in pairs(v125.newVarsMapping) do
                l_Watches_0[v128] = v129;
            end;
            local l_childPaths_1 = l_Watches_0[v125.parentPath].childPaths;
            for _, v132 in ipairs(v125.childKeys) do
                table.insert(l_childPaths_1, v132);
            end;
            return v2.Dictionary.join(v124, {
                stateTokenToFlattenedTree = v126
            });
        end;
    end, 
    [v13.name] = function(v133, v134) --[[ Line: 493 ]]
        -- upvalues: v2 (copy)
        local v135 = false;
        local l_listOfExpressions_0 = v133.listOfExpressions;
        local l_expression_0 = v134.expression;
        local v138;
        for v139, v140 in pairs(l_listOfExpressions_0) do
            if v140 == l_expression_0 then
                v138 = v139;
                v135 = true;
            end;
            if v135 then
                break;
            end;
        end;
        if not v135 then
            v138 = nil;
        end;
        v135 = false;
        if v138 ~= nil then
            return v133;
        else
            return v2.Dictionary.join(v133, {
                listOfExpressions = v2.List.join(v133.listOfExpressions, {
                    v134.expression
                })
            });
        end;
    end, 
    [v14.name] = function(v141, v142) --[[ Line: 502 ]]
        -- upvalues: l_deepCopy_0 (copy), v2 (copy)
        local v143 = false;
        local v144 = false;
        local v145 = false;
        local l_listOfExpressions_1 = v141.listOfExpressions;
        local l_newExpression_0 = v142.newExpression;
        local v148;
        for v149, v150 in pairs(l_listOfExpressions_1) do
            if v150 == l_newExpression_0 then
                v148 = v149;
                v143 = true;
            end;
            if v143 then
                break;
            end;
        end;
        if not v143 then
            v148 = nil;
        end;
        v143 = false;
        if v148 ~= nil then
            return v141;
        else
            l_listOfExpressions_1 = v141.listOfExpressions;
            l_newExpression_0 = v142.oldExpression;
            for v151, v152 in pairs(l_listOfExpressions_1) do
                if v152 == l_newExpression_0 then
                    v148 = v151;
                    v144 = true;
                end;
                if v144 then
                    break;
                end;
            end;
            if not v144 then
                v148 = nil;
            end;
            v144 = false;
            if v148 == nil then
                return v141;
            else
                v148 = l_deepCopy_0(v141.listOfExpressions);
                l_newExpression_0 = v142.oldExpression;
                for v153, v154 in pairs(v148) do
                    if v154 == l_newExpression_0 then
                        l_listOfExpressions_1 = v153;
                        v145 = true;
                    end;
                    if v145 then
                        break;
                    end;
                end;
                if not v145 then
                    l_listOfExpressions_1 = nil;
                end;
                v145 = false;
                v148[l_listOfExpressions_1] = v142.newExpression;
                return v2.Dictionary.join(v141, {
                    listOfExpressions = v148
                });
            end;
        end;
    end, 
    [v15.name] = function(v155, v156) --[[ Line: 520 ]]
        -- upvalues: l_deepCopy_0 (copy), v40 (copy), v2 (copy)
        local v157 = l_deepCopy_0(v155.stateTokenToRoots);
        v40(v157, v156.stepStateBundle);
        table.insert(v157[v156.stepStateBundle.debuggerStateToken][v156.stepStateBundle.threadId][v156.stepStateBundle.frameNumber].Watches, v156.watchRow.pathColumn);
        local v158 = l_deepCopy_0(v155.stateTokenToFlattenedTree);
        v40(v158, v156.stepStateBundle);
        v158[v156.stepStateBundle.debuggerStateToken][v156.stepStateBundle.threadId][v156.stepStateBundle.frameNumber].Watches[v156.watchRow.pathColumn] = v156.watchRow;
        return v2.Dictionary.join(v155, {
            stateTokenToRoots = v157, 
            stateTokenToFlattenedTree = v158
        });
    end, 
    [v16.name] = function(v159, v160) --[[ Line: 541 ]]
        -- upvalues: l_deepCopy_0 (copy), v40 (copy), v2 (copy)
        local v161 = l_deepCopy_0(v159.stateTokenToRoots);
        v40(v161, v160.stepStateBundle);
        local l_Watches_1 = v161[v160.stepStateBundle.debuggerStateToken][v160.stepStateBundle.threadId][v160.stepStateBundle.frameNumber].Watches;
        for _, v164 in v160.watchRows do
            table.insert(l_Watches_1, v164.pathColumn);
        end;
        local v165 = l_deepCopy_0(v159.stateTokenToFlattenedTree);
        v40(v165, v160.stepStateBundle);
        local l_Watches_2 = v165[v160.stepStateBundle.debuggerStateToken][v160.stepStateBundle.threadId][v160.stepStateBundle.frameNumber].Watches;
        for _, v168 in v160.watchRows do
            l_Watches_2[v168.pathColumn] = v168;
        end;
        return v2.Dictionary.join(v159, {
            stateTokenToRoots = v161, 
            stateTokenToFlattenedTree = v165
        });
    end, 
    [v17.name] = function(v169, v170) --[[ Line: 567 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v169, {
            listOfExpressions = v2.List.removeValue(v169.listOfExpressions, v170.expression)
        });
    end, 
    [v21.name] = function(v171, _) --[[ Line: 573 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v171, {
            listOfExpressions = {}
        });
    end, 
    [v18.name] = function(v173, v174) --[[ Line: 579 ]]
        -- upvalues: v2 (copy)
        if v174.isVariablesTab then
            return v2.Dictionary.join(v173, {
                pathToExpansionState = v2.Dictionary.join(v173.pathToExpansionState, v174.expansionMapping)
            });
        else
            return v2.Dictionary.join(v173, {
                expressionToExpansionState = v2.Dictionary.join(v173.expressionToExpansionState, v174.expansionMapping)
            });
        end;
    end, 
    [v29.name] = function(v175, v176) --[[ Line: 594 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v175, {
            filterText = v176.filterText
        });
    end, 
    [v19.name] = function(v177, v178) --[[ Line: 600 ]]
        -- upvalues: v34 (copy), v2 (copy)
        if v177.currentTab == v34.Variables then
            return v2.Dictionary.join(v177, {
                variablesSortDirection = v178.sortDirection, 
                variablesColumnIndex = v178.columnIndex
            });
        else
            return v2.Dictionary.join(v177, {
                watchesSortDirection = v178.sortDirection, 
                watchesColumnIndex = v178.columnIndex
            });
        end;
    end
});