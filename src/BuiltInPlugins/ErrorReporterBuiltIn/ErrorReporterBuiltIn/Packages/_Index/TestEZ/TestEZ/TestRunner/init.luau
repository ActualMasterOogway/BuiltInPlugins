local v0 = require(script.Parent.TestEnum);
local v1 = require(script.Parent.TestSession);
local v2 = require(script.Parent.LifecycleHooks);
local v3 = {
    environment = {}
};
local function v6(v4) --[[ Line: 20 ]] --[[ Name: wrapExpectContextWithPublicApi ]]
    return (setmetatable({
        extend = function(...) --[[ Line: 22 ]] --[[ Name: extend ]]
            -- upvalues: v4 (copy)
            v4:extend(...);
        end
    }, {
        __call = function(_, ...) --[[ Line: 26 ]] --[[ Name: __call ]]
            -- upvalues: v4 (copy)
            return v4:startExpectationChain(...);
        end
    }));
end;
v3.runPlan = function(v7) --[[ Line: 36 ]] --[[ Name: runPlan ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy), v3 (copy)
    local v8 = v1.new(v7);
    local v9 = v2.new();
    v8.hasFocusNodes = #v7:findNodes(function(v10) --[[ Line: 40 ]]
        -- upvalues: v0 (ref)
        return v10.modifier == v0.NodeModifier.Focus;
    end) > 0;
    _G.__JEST_TEST_CONTEXT__ = {
        blocks = {}, 
        instance = nil, 
        snapshotState = nil
    };
    v3.runPlanNode(v8, v7, v9);
    _G.__JEST_TEST_CONTEXT__ = nil;
    return v8:finalize();
end;
v3.runPlanNode = function(v11, v12, v13) --[[ Line: 63 ]] --[[ Name: runPlanNode ]]
    -- upvalues: v3 (copy), v6 (copy), v0 (copy)
    local function v31(v14, v15) --[[ Line: 64 ]] --[[ Name: runCallback ]]
        -- upvalues: v3 (ref), v6 (ref), v11 (copy)
        local v16 = true;
        local v17 = nil;
        _G.__TESTEZ_RUNNING_TEST__ = true;
        v15 = v15 or "";
        local v18 = getfenv(v14);
        for v19, v20 in pairs(v3.environment) do
            v18[v19] = v20;
        end;
        v18.fail = function(v21) --[[ Line: 80 ]]
            -- upvalues: v16 (ref), v17 (ref), v15 (ref)
            if v21 == nil then
                v21 = "fail() was called.";
            end;
            v16 = false;
            v17 = v15 .. debug.traceback(tostring(v21), 2);
        end;
        v18.expect = v6(v11:getExpectationContext());
        local v22 = v11:getContext();
        local function v27(v23) --[[ Line: 93 ]] --[[ Name: removeTestEZFromStack ]]
            v23 = v23:split("\n");
            local v24 = {};
            for _, v26 in pairs(v23) do
                if not v26:match("TestEZ%.TestEZ%.") then
                    table.insert(v24, v26);
                else
                    break;
                end;
            end;
            return table.concat(v24, "\n");
        end;
        local v29, v30 = xpcall(function() --[[ Line: 106 ]]
            -- upvalues: v14 (copy), v22 (copy)
            v14(v22);
        end, function(v28) --[[ Line: 109 ]]
            -- upvalues: v15 (ref), v27 (copy)
            if typeof(v28) == "table" and v28.stack and v28.name and v28.message then
                return v15 .. v27(tostring(v28) .. "\n" .. v28.stack);
            else
                return v15 .. debug.traceback(tostring(v28), 2);
            end;
        end);
        if not v29 then
            v16 = false;
            v17 = v30;
        end;
        _G.__TESTEZ_RUNNING_TEST__ = nil;
        return v16, v17;
    end;
    local function v43(v32) --[[ Line: 130 ]] --[[ Name: runNode ]]
        -- upvalues: v13 (copy), v31 (copy)
        for _, v34 in ipairs(v13:getBeforeEachHooks()) do
            local v35, v36 = v31(v34, "beforeEach hook: ");
            if not v35 then
                return false, v36;
            end;
        end;
        local v37, v38 = v31(v32.callback);
        for _, v40 in ipairs(v13:getAfterEachHooks()) do
            local v41, v42 = v31(v40, "afterEach hook: ");
            if not v41 then
                if not v37 then
                    return false, v38 .. "\nWhile cleaning up the failed test another error was found:\n" .. v42;
                else
                    return false, v42;
                end;
            end;
        end;
        if not v37 then
            return false, v38;
        else
            return true, nil;
        end;
    end;
    v13:pushHooksFrom(v12);
    local v44 = false;
    for _, v46 in ipairs(v13:getBeforeAllHooks()) do
        local v47, v48 = v31(v46, "beforeAll hook: ");
        if not v47 then
            v11:addDummyError("beforeAll", v48);
            v44 = true;
        end;
    end;
    if v12.isRoot then
        _G.__JEST_TEST_CONTEXT__.instance = v12.instance;
        _G.__JEST_TEST_CONTEXT__.blocks = {};
        _G.__JEST_TEST_CONTEXT__.snapshotState = nil;
    end;
    if not v44 then
        for _, v50 in ipairs(v12.children) do
            table.insert(_G.__JEST_TEST_CONTEXT__.blocks, v50.phrase);
            if v50.type == v0.NodeType.It then
                v11:pushNode(v50);
                if v11:shouldSkip() then
                    v11:setSkipped();
                else
                    local v51, v52 = v43(v50);
                    if v51 then
                        v11:setSuccess();
                    else
                        v11:setError(v52);
                    end;
                end;
                v11:popNode();
            elseif v50.type == v0.NodeType.Describe then
                v11:pushNode(v50);
                v3.runPlanNode(v11, v50, v13);
                if v50.loadError then
                    v11:setError("Error during planning: " .. v50.loadError);
                else
                    v11:setStatusFromChildren();
                end;
                v11:popNode();
            end;
            table.remove(_G.__JEST_TEST_CONTEXT__.blocks);
        end;
    end;
    local l_snapshotState_0 = _G.__JEST_TEST_CONTEXT__.snapshotState;
    if v12.isRoot and l_snapshotState_0 and l_snapshotState_0._updateSnapshot ~= "none" then
        if l_snapshotState_0:getUncheckedCount() > 0 then
            l_snapshotState_0:removeUncheckedKeys();
        end;
        l_snapshotState_0:save();
    end;
    for _, v55 in ipairs(v13:getAfterAllHooks()) do
        local v56, v57 = v31(v55, "afterAll hook: ");
        if not v56 then
            v11:addDummyError("afterAll", v57);
        end;
    end;
    v13:popHooks();
end;
return v3;