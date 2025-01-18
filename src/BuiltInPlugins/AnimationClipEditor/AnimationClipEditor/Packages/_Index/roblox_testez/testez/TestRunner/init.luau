local v0 = require(script.Parent.Expectation);
local v1 = require(script.Parent.TestEnum);
local v2 = require(script.Parent.TestSession);
local v3 = require(script.Parent.Stack);
local v4 = require(script.Parent.LifecycleHooks);
local v5 = {
    environment = {}
};
v5.environment.expect = function(...) --[[ Line: 21 ]] --[[ Name: expect ]]
    -- upvalues: v0 (copy)
    return v0.new(...);
end;
v5.runPlan = function(v6) --[[ Line: 29 ]] --[[ Name: runPlan ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v1 (copy), v5 (copy)
    local v7 = v2.new(v6);
    local v8 = v3.new();
    local v9 = v4.new();
    v7.hasFocusNodes = #v6:findNodes(function(v10) --[[ Line: 34 ]]
        -- upvalues: v1 (ref)
        return v10.modifier == v1.NodeModifier.Focus;
    end) > 0;
    v5.runPlanNode(v7, v6, v8, v9);
    return v7:finalize();
end;
v5.runPlanNode = function(v11, v12, v13, v14, v15) --[[ Line: 49 ]] --[[ Name: runPlanNode ]]
    -- upvalues: v5 (copy), v1 (copy)
    local v16 = v15 and pcall or xpcall;
    local function v29(v17, _, v19) --[[ Line: 54 ]] --[[ Name: runCallback ]]
        -- upvalues: v5 (ref), v16 (copy)
        local v20 = true;
        local v21 = nil;
        _G.__TESTEZ_RUNNING_TEST__ = true;
        v19 = v19 or "";
        local v22 = getfenv(v17);
        for v23, v24 in pairs(v5.environment) do
            v22[v23] = v24;
        end;
        v22.fail = function(v25) --[[ Line: 70 ]]
            -- upvalues: v20 (ref), v21 (ref), v19 (ref)
            if v25 == nil then
                v25 = "fail() was called.";
            end;
            v20 = false;
            v21 = v19 .. v25 .. "\n" .. debug.traceback();
        end;
        local v27, v28 = v16(v17, function(v26) --[[ Line: 79 ]]
            -- upvalues: v19 (ref)
            return v19 .. v26 .. "\n" .. debug.traceback();
        end);
        if not v27 then
            v20 = false;
            v21 = v28;
        end;
        _G.__TESTEZ_RUNNING_TEST__ = nil;
        return v20, v21;
    end;
    local function v45(v30) --[[ Line: 95 ]] --[[ Name: runNode ]]
        -- upvalues: v14 (copy), v29 (copy)
        for _, v32 in pairs(v14:getPendingBeforeAllHooks()) do
            local v33, v34 = v29(v32, false, "beforeAll hook: ");
            if not v33 then
                return false, v34;
            end;
        end;
        for _, v36 in pairs(v14:getBeforeEachHooks()) do
            local v37, v38 = v29(v36, false, "beforeEach hook: ");
            if not v37 then
                return false, v38;
            end;
        end;
        local v39, v40 = v29(v30.callback);
        if not v39 then
            return false, v40;
        else
            for _, v42 in pairs(v14:getAfterEachHooks()) do
                local v43, v44 = v29(v42, true, "afterEach hook: ");
                if not v43 then
                    return false, v44;
                end;
            end;
            return true, nil;
        end;
    end;
    v14:pushHooksFrom(v12);
    for _, v47 in ipairs(v12.children) do
        local v48 = v11:pushNode(v47);
        if v47.type == v1.NodeType.It then
            if v11:shouldSkip() then
                v48.status = v1.TestStatus.Skipped;
            elseif v13:size() > 0 and v13:getBack().isOk == false then
                v48.status = v1.TestStatus.Failure;
                table.insert(v48.errors, string.format("%q failed without trying, because test case %q failed", v47.phrase, v13:getBack().failedNode.phrase));
            else
                local v49, v50 = v45(v47);
                if v49 then
                    v48.status = v1.TestStatus.Success;
                else
                    v48.status = v1.TestStatus.Failure;
                    table.insert(v48.errors, v50);
                end;
            end;
        elseif v47.type == v1.NodeType.Describe or v47.type == v1.NodeType.Try then
            if v47.type == v1.NodeType.Try then
                v13:push({
                    isOk = true, 
                    failedNode = nil
                });
            end;
            v5.runPlanNode(v11, v47, v13, v14, v47.HACK_NO_XPCALL);
            if v47.type == v1.NodeType.Try then
                v13:pop();
            end;
            local l_Success_0 = v1.TestStatus.Success;
            if v47.loadError then
                l_Success_0 = v1.TestStatus.Failure;
                local v52 = "Error during planning: " .. v47.loadError;
                table.insert(v48.errors, v52);
            else
                local v53 = true;
                for _, v55 in ipairs(v48.children) do
                    if v55.status ~= v1.TestStatus.Skipped then
                        v53 = false;
                        if v55.status == v1.TestStatus.Failure then
                            l_Success_0 = v1.TestStatus.Failure;
                        end;
                    end;
                end;
                if v53 then
                    l_Success_0 = v1.TestStatus.Skipped;
                end;
            end;
            v48.status = l_Success_0;
        end;
        v11:popNode();
    end;
    for _, v57 in pairs(v14:getAfterAllHooks()) do
        v29(v57, true, "afterAll hook: ");
    end;
    v14:popHooks();
end;
return v5;