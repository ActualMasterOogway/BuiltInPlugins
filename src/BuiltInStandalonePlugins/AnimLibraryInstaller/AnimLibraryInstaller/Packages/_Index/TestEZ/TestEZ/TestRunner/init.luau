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
    local v11 = getfenv();
    if v11.DateTime then
        v8.results.startTime = v11.DateTime.now().UnixTimestampMillis;
    end;
    v3.runPlanNode(v8, v7, v9);
    _G.__JEST_TEST_CONTEXT__ = nil;
    return v8:finalize();
end;
v3.runPlanNode = function(v12, v13, v14) --[[ Line: 71 ]] --[[ Name: runPlanNode ]]
    -- upvalues: v3 (copy), v6 (copy), v0 (copy)
    local function v32(v15, v16) --[[ Line: 72 ]] --[[ Name: runCallback ]]
        -- upvalues: v3 (ref), v6 (ref), v12 (copy)
        local v17 = true;
        local v18 = nil;
        _G.__TESTEZ_RUNNING_TEST__ = true;
        v16 = v16 or "";
        local v19 = getfenv(v15);
        for v20, v21 in pairs(v3.environment) do
            v19[v20] = v21;
        end;
        v19.fail = function(v22) --[[ Line: 88 ]]
            -- upvalues: v17 (ref), v18 (ref), v16 (ref)
            if v22 == nil then
                v22 = "fail() was called.";
            end;
            v17 = false;
            v18 = v16 .. debug.traceback(tostring(v22), 2);
        end;
        v19.expect = v6(v12:getExpectationContext());
        local v23 = v12:getContext();
        local function v28(v24) --[[ Line: 101 ]] --[[ Name: removeTestEZFromStack ]]
            v24 = v24:split("\n");
            local v25 = {};
            for _, v27 in pairs(v24) do
                if not v27:match("TestEZ%.TestEZ%.") then
                    table.insert(v25, v27);
                else
                    break;
                end;
            end;
            return table.concat(v25, "\n");
        end;
        local v30, v31 = xpcall(function() --[[ Line: 113 ]]
            -- upvalues: v15 (copy), v23 (copy)
            v15(v23);
        end, function(v29) --[[ Line: 115 ]]
            -- upvalues: v16 (ref), v28 (copy)
            if typeof(v29) == "table" and v29.stack and v29.name and v29.message then
                return v16 .. v28(tostring(v29) .. "\n" .. v29.stack);
            else
                return v16 .. debug.traceback(tostring(v29), 2);
            end;
        end);
        if not v30 then
            v17 = false;
            v18 = v31;
        end;
        _G.__TESTEZ_RUNNING_TEST__ = nil;
        return v17, v18;
    end;
    local function v44(v33) --[[ Line: 135 ]] --[[ Name: runNode ]]
        -- upvalues: v14 (copy), v32 (copy)
        for _, v35 in ipairs(v14:getBeforeEachHooks()) do
            local v36, v37 = v32(v35, "beforeEach hook: ");
            if not v36 then
                return false, v37;
            end;
        end;
        local v38, v39 = v32(v33.callback);
        for _, v41 in ipairs(v14:getAfterEachHooks()) do
            local v42, v43 = v32(v41, "afterEach hook: ");
            if not v42 then
                if not v38 then
                    return false, v39 .. "\nWhile cleaning up the failed test another error was found:\n" .. v43;
                else
                    return false, v43;
                end;
            end;
        end;
        if not v38 then
            return false, v39;
        else
            return true, nil;
        end;
    end;
    v14:pushHooksFrom(v13);
    local v45 = false;
    for _, v47 in ipairs(v14:getBeforeAllHooks()) do
        local v48, v49 = v32(v47, "beforeAll hook: ");
        if not v48 then
            v12:addDummyError("beforeAll", v49);
            v45 = true;
        end;
    end;
    if v13.isRoot then
        _G.__JEST_TEST_CONTEXT__.instance = v13.instance;
        _G.__JEST_TEST_CONTEXT__.blocks = {};
        _G.__JEST_TEST_CONTEXT__.snapshotState = nil;
    end;
    if not v45 then
        for _, v51 in ipairs(v13.children) do
            table.insert(_G.__JEST_TEST_CONTEXT__.blocks, v51.phrase);
            if v51.type == v0.NodeType.It then
                v12:pushNode(v51);
                if v12:shouldSkip() then
                    v12:setSkipped();
                else
                    local v52, v53 = v44(v51);
                    if v52 then
                        v12:setSuccess();
                    else
                        v12:setError(v53);
                    end;
                end;
                v12:popNode();
            elseif v51.type == v0.NodeType.Describe then
                v12:pushNode(v51);
                v3.runPlanNode(v12, v51, v14);
                if v51.loadError then
                    v12:setError("Error during planning: " .. v51.loadError);
                else
                    v12:setStatusFromChildren();
                end;
                v12:popNode();
            end;
            table.remove(_G.__JEST_TEST_CONTEXT__.blocks);
        end;
    end;
    local l_snapshotState_0 = _G.__JEST_TEST_CONTEXT__.snapshotState;
    if v13.isRoot and l_snapshotState_0 and l_snapshotState_0._updateSnapshot ~= "none" then
        if l_snapshotState_0:getUncheckedCount() > 0 then
            l_snapshotState_0:removeUncheckedKeys();
        end;
        l_snapshotState_0:save();
    end;
    for _, v56 in ipairs(v14:getAfterAllHooks()) do
        local v57, v58 = v32(v56, "afterAll hook: ");
        if not v57 then
            v12:addDummyError("afterAll", v58);
        end;
    end;
    v14:popHooks();
end;
return v3;