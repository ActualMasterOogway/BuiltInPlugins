local v0 = require(script.Parent.TestEnum);
local v1 = require(script.Parent.TestSession);
local v2 = require(script.Parent.LifecycleHooks);
local v3 = {
    environment = {}
};
local function v6(v4) --[[ Line: 19 ]] --[[ Name: wrapExpectContextWithPublicApi ]]
    return (setmetatable({
        extend = function(...) --[[ Line: 21 ]] --[[ Name: extend ]]
            -- upvalues: v4 (copy)
            v4:extend(...);
        end
    }, {
        __call = function(_, ...) --[[ Line: 25 ]] --[[ Name: __call ]]
            -- upvalues: v4 (copy)
            return v4:startExpectationChain(...);
        end
    }));
end;
v3.runPlan = function(v7) --[[ Line: 35 ]] --[[ Name: runPlan ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy), v3 (copy)
    local v8 = v1.new(v7);
    local v9 = v2.new();
    v8.hasFocusNodes = #v7:findNodes(function(v10) --[[ Line: 39 ]]
        -- upvalues: v0 (ref)
        return v10.modifier == v0.NodeModifier.Focus;
    end) > 0;
    v3.runPlanNode(v8, v7, v9);
    return v8:finalize();
end;
v3.runPlanNode = function(v11, v12, v13) --[[ Line: 54 ]] --[[ Name: runPlanNode ]]
    -- upvalues: v3 (copy), v6 (copy), v0 (copy)
    local function v26(v14, v15) --[[ Line: 55 ]] --[[ Name: runCallback ]]
        -- upvalues: v3 (ref), v6 (ref), v11 (copy)
        local v16 = true;
        local v17 = nil;
        _G.__TESTEZ_RUNNING_TEST__ = true;
        v15 = v15 or "";
        local v18 = getfenv(v14);
        for v19, v20 in pairs(v3.environment) do
            v18[v19] = v20;
        end;
        v18.fail = function(v21) --[[ Line: 71 ]]
            -- upvalues: v16 (ref), v17 (ref), v15 (ref)
            if v21 == nil then
                v21 = "fail() was called.";
            end;
            v16 = false;
            v17 = v15 .. debug.traceback(tostring(v21), 2);
        end;
        v18.expect = v6(v11:getExpectationContext());
        local v22 = v11:getContext();
        local v24, v25 = xpcall(function() --[[ Line: 85 ]]
            -- upvalues: v14 (copy), v22 (copy)
            v14(v22);
        end, function(v23) --[[ Line: 88 ]]
            -- upvalues: v15 (ref)
            return v15 .. debug.traceback(tostring(v23), 2);
        end);
        if not v24 then
            v16 = false;
            v17 = v25;
        end;
        _G.__TESTEZ_RUNNING_TEST__ = nil;
        return v16, v17;
    end;
    local function v38(v27) --[[ Line: 105 ]] --[[ Name: runNode ]]
        -- upvalues: v13 (copy), v26 (copy)
        for _, v29 in ipairs(v13:getBeforeEachHooks()) do
            local v30, v31 = v26(v29, "beforeEach hook: ");
            if not v30 then
                return false, v31;
            end;
        end;
        local v32, v33 = v26(v27.callback);
        for _, v35 in ipairs(v13:getAfterEachHooks()) do
            local v36, v37 = v26(v35, "afterEach hook: ");
            if not v36 then
                if not v32 then
                    return false, v33 .. "\nWhile cleaning up the failed test another error was found:\n" .. v37;
                else
                    return false, v37;
                end;
            end;
        end;
        if not v32 then
            return false, v33;
        else
            return true, nil;
        end;
    end;
    v13:pushHooksFrom(v12);
    local v39 = false;
    for _, v41 in ipairs(v13:getBeforeAllHooks()) do
        local v42, v43 = v26(v41, "beforeAll hook: ");
        if not v42 then
            v11:addDummyError("beforeAll", v43);
            v39 = true;
        end;
    end;
    if not v39 then
        for _, v45 in ipairs(v12.children) do
            if v45.type == v0.NodeType.It then
                v11:pushNode(v45);
                if v11:shouldSkip() then
                    v11:setSkipped();
                else
                    local v46, v47 = v38(v45);
                    if v46 then
                        v11:setSuccess();
                    else
                        v11:setError(v47);
                    end;
                end;
                v11:popNode();
            elseif v45.type == v0.NodeType.Describe then
                v11:pushNode(v45);
                v3.runPlanNode(v11, v45, v13);
                if v45.loadError then
                    v11:setError("Error during planning: " .. v45.loadError);
                else
                    v11:setStatusFromChildren();
                end;
                v11:popNode();
            end;
        end;
    end;
    for _, v49 in ipairs(v13:getAfterAllHooks()) do
        local v50, v51 = v26(v49, "afterAll hook: ");
        if not v50 then
            v11:addDummyError("afterAll", v51);
        end;
    end;
    v13:popHooks();
end;
return v3;