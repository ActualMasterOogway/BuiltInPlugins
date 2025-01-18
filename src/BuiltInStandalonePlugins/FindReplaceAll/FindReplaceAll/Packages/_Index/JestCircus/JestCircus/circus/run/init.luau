local l_Parent_0 = script.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = require(l_Parent_0.Promise);
local v3 = {};
local _ = require(l_Parent_0.JestTypes);
local v5 = require(script.Parent.state);
local l_dispatch_0 = v5.dispatch;
local l_getState_0 = v5.getState;
local l_RETRY_TIMES_0 = require(script.Parent.types).RETRY_TIMES;
local v9 = require(script.Parent.utils);
local l_callAsyncCircusFn_0 = v9.callAsyncCircusFn;
local l_getAllHooksForDescribe_0 = v9.getAllHooksForDescribe;
local l_getEachHooksForTest_0 = v9.getEachHooksForTest;
local l_getTestID_0 = v9.getTestID;
local l_invariant_0 = v9.invariant;
local l_makeRunResult_0 = v9.makeRunResult;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local function v21() --[[ Line: 44 ]] --[[ Name: run ]]
    -- upvalues: v2 (copy), l_getState_0 (copy), l_dispatch_0 (copy), v16 (ref), l_makeRunResult_0 (copy)
    return v2.resolve():andThen(function() --[[ Line: 45 ]]
        -- upvalues: l_getState_0 (ref), l_dispatch_0 (ref), v16 (ref), l_makeRunResult_0 (ref)
        local v20 = nil;
        v20 = l_getState_0().rootDescribeBlock;
        l_dispatch_0({
            name = "run_start"
        }):expect();
        v16(v20):expect();
        l_dispatch_0({
            name = "run_finish"
        }):expect();
        return l_makeRunResult_0(l_getState_0().rootDescribeBlock, l_getState_0().unhandledErrors);
    end);
end;
v16 = function(v22) --[[ Line: 58 ]] --[[ Name: _runTestsForDescribeBlock ]]
    -- upvalues: v2 (copy), l_dispatch_0 (copy), l_getAllHooksForDescribe_0 (copy), v18 (ref), l_RETRY_TIMES_0 (copy), v16 (ref), v17 (ref)
    return v2.resolve():andThen(function() --[[ Line: 59 ]]
        -- upvalues: l_dispatch_0 (ref), v22 (copy), l_getAllHooksForDescribe_0 (ref), v18 (ref), l_RETRY_TIMES_0 (ref), v16 (ref), v17 (ref)
        l_dispatch_0({
            describeBlock = v22, 
            name = "run_describe_start"
        }):expect();
        local v23 = l_getAllHooksForDescribe_0(v22);
        local l_beforeAll_0 = v23.beforeAll;
        local l_afterAll_0 = v23.afterAll;
        local v26 = v22.mode == "skip";
        if not v26 then
            for _, v28 in ipairs(l_beforeAll_0) do
                v18({
                    describeBlock = v22, 
                    hook = v28
                }):expect();
            end;
        end;
        local v29 = tonumber(_G[l_RETRY_TIMES_0], 10);
        local v30 = if v29 ~= nil then v29 else 0;
        local v31 = {};
        for _, v33 in ipairs(v22.children) do
            if v33.type == "describeBlock" then
                v16(v33):expect();
            elseif v33.type == "test" then
                local v34 = #v33.errors > 0;
                v17(v33, v26):expect();
                if v34 == false and v30 > 0 and #v33.errors > 0 then
                    table.insert(v31, v33);
                end;
            end;
        end;
        for _, v36 in ipairs(v31) do
            local l_v30_0 = v30;
            while l_v30_0 > 0 and #v36.errors > 0 do
                l_dispatch_0({
                    name = "test_retry", 
                    test = v36
                }):expect();
                v17(v36, v26):expect();
                l_v30_0 = l_v30_0 - 1;
            end;
        end;
        if not v26 then
            for _, v39 in ipairs(l_afterAll_0) do
                v18({
                    describeBlock = v22, 
                    hook = v39
                }):expect();
            end;
        end;
        l_dispatch_0({
            describeBlock = v22, 
            name = "run_describe_finish"
        }):expect();
    end);
end;
v17 = function(v40, v41) --[[ Line: 116 ]] --[[ Name: _runTest ]]
    -- upvalues: v2 (copy), l_dispatch_0 (copy), l_getState_0 (copy), l_getTestID_0 (copy), l_getEachHooksForTest_0 (copy), v18 (ref), v19 (ref)
    return v2.resolve():andThen(function() --[[ Line: 117 ]]
        -- upvalues: l_dispatch_0 (ref), v40 (copy), l_getState_0 (ref), v41 (copy), l_getTestID_0 (ref), l_getEachHooksForTest_0 (ref), v18 (ref), v19 (ref)
        l_dispatch_0({
            name = "test_start", 
            test = v40
        }):expect();
        local v42 = {};
        local v43 = l_getState_0();
        local l_hasFocusedTests_0 = v43.hasFocusedTests;
        local l_testNamePattern_0 = v43.testNamePattern;
        if v41 or v40.mode == "skip" or l_hasFocusedTests_0 and v40.mode ~= "only" or l_testNamePattern_0 and not l_testNamePattern_0:test(l_getTestID_0(v40)) then
            l_dispatch_0({
                name = "test_skip", 
                test = v40
            }):expect();
            return;
        elseif v40.mode == "todo" then
            l_dispatch_0({
                name = "test_todo", 
                test = v40
            }):expect();
            return;
        else
            local v46 = l_getEachHooksForTest_0(v40);
            local l_afterEach_0 = v46.afterEach;
            local l_beforeEach_0 = v46.beforeEach;
            for _, v50 in ipairs(l_beforeEach_0) do
                if #v40.errors <= 0 then
                    v18({
                        hook = v50, 
                        test = v40, 
                        testContext = v42
                    }):expect();
                else
                    break;
                end;
            end;
            v19(v40, v42):expect();
            for _, v52 in ipairs(l_afterEach_0) do
                v18({
                    hook = v52, 
                    test = v40, 
                    testContext = v42
                }):expect();
            end;
            l_dispatch_0({
                name = "test_done", 
                test = v40
            }):expect();
            return;
        end;
    end);
end;
v18 = function(v53) --[[ Line: 167 ]] --[[ Name: _callCircusHook ]]
    -- upvalues: v2 (copy), l_dispatch_0 (copy), l_Boolean_0 (copy), l_getState_0 (copy), l_callAsyncCircusFn_0 (copy)
    local l_hook_0 = v53.hook;
    local l_test_0 = v53.test;
    local l_describeBlock_0 = v53.describeBlock;
    local l_testContext_0 = v53.testContext;
    return v2.resolve():andThen(function() --[[ Line: 174 ]]
        -- upvalues: l_dispatch_0 (ref), l_hook_0 (copy), l_Boolean_0 (ref), l_getState_0 (ref), l_callAsyncCircusFn_0 (ref), l_testContext_0 (copy), l_describeBlock_0 (copy), l_test_0 (copy)
        l_dispatch_0({
            hook = l_hook_0, 
            name = "hook_start"
        }):expect();
        local v58 = if l_Boolean_0.toJSBoolean(l_hook_0.timeout) and l_hook_0.timeout ~= nil then l_hook_0.timeout else l_getState_0().testTimeout;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 180 ]]
            -- upvalues: l_callAsyncCircusFn_0 (ref), l_hook_0 (ref), l_testContext_0 (ref), v58 (copy), l_dispatch_0 (ref), l_describeBlock_0 (ref), l_test_0 (ref)
            l_callAsyncCircusFn_0(l_hook_0, l_testContext_0, {
                isHook = true, 
                timeout = v58
            }):expect();
            l_dispatch_0({
                describeBlock = l_describeBlock_0, 
                hook = l_hook_0, 
                name = "hook_success", 
                test = l_test_0
            }):expect();
        end);
        if not l_status_0 then
            l_dispatch_0({
                describeBlock = l_describeBlock_0, 
                error = l_result_0, 
                hook = l_hook_0, 
                name = "hook_failure", 
                test = l_test_0
            }):expect();
        end;
    end);
end;
v19 = function(v61, v62) --[[ Line: 201 ]] --[[ Name: _callCircusTest ]]
    -- upvalues: v2 (copy), l_dispatch_0 (copy), l_Boolean_0 (copy), l_getState_0 (copy), l_invariant_0 (copy), l_callAsyncCircusFn_0 (copy)
    return v2.resolve():andThen(function() --[[ Line: 202 ]]
        -- upvalues: l_dispatch_0 (ref), v61 (copy), l_Boolean_0 (ref), l_getState_0 (ref), l_invariant_0 (ref), l_callAsyncCircusFn_0 (ref), v62 (copy)
        l_dispatch_0({
            name = "test_fn_start", 
            test = v61
        }):expect();
        local v63 = l_Boolean_0.toJSBoolean(v61.timeout) and v61.timeout or l_getState_0().testTimeout;
        l_invariant_0(v61.fn, "Tests with no 'fn' should have 'mode' set to 'skipped'");
        if #v61.errors > 0 then
            return;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 210 ]]
                -- upvalues: l_callAsyncCircusFn_0 (ref), v61 (ref), v62 (ref), v63 (copy), l_dispatch_0 (ref)
                l_callAsyncCircusFn_0(v61, v62, {
                    isHook = false, 
                    timeout = v63
                }):expect();
                if v61.failing then
                    v61.asyncError.message = "Failing test passed even though it was supposed to fail. Remove `.failing` to remove error.";
                    l_dispatch_0({
                        error = v61.asyncError, 
                        name = "test_fn_failure", 
                        test = v61
                    });
                    return;
                else
                    l_dispatch_0({
                        name = "test_fn_success", 
                        test = v61
                    }):expect();
                    return;
                end;
            end);
            if not l_status_1 then
                if v61.failing then
                    l_dispatch_0({
                        name = "test_fn_success", 
                        test = v61
                    });
                    return;
                else
                    l_dispatch_0({
                        error = l_result_1, 
                        name = "test_fn_failure", 
                        test = v61
                    }):expect();
                end;
            end;
            return;
        end;
    end);
end;
v3.default = v21;
return v3;