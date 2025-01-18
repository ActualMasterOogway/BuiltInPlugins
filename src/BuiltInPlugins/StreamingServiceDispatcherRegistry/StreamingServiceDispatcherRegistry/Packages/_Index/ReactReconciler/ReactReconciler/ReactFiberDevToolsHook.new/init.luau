local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.LuauPolyfill);
local v3 = {};
local function _(v4) --[[ Line: 28 ]] --[[ Name: isCallable ]]
    if typeof(v4) == "function" then
        return true;
    else
        if typeof(v4) == "table" then
            local v5 = getmetatable(v4);
            if v5 and rawget(v5, "__call") then
                return true;
            elseif v4._isMockFunction then
                return true;
            end;
        end;
        return false;
    end;
end;
local l_enableProfilerTimer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableProfilerTimer;
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(l_Parent_0.Shared);
local l_DidCapture_0 = require(script.Parent.ReactFiberFlags).DidCapture;
local v11 = nil;
local v12 = nil;
local v13 = false;
v3.isDevToolsPresent = function() --[[ Line: 63 ]]
    return _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil;
end;
v3.injectInternals = function(v14) --[[ Line: 67 ]]
    -- upvalues: l_console_0 (copy), v11 (ref), v12 (ref)
    if _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
        return false;
    else
        local l___REACT_DEVTOOLS_GLOBAL_HOOK___0 = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__;
        if l___REACT_DEVTOOLS_GLOBAL_HOOK___0.isDisabled then
            return true;
        elseif not l___REACT_DEVTOOLS_GLOBAL_HOOK___0.supportsFiber then
            if _G.__DEV__ then
                l_console_0.error("The installed version of React DevTools is too old and will not work " .. "with the current version of React. Please update React DevTools. " .. "https://reactjs.org/link/react-devtools");
            end;
            return true;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 90 ]]
                -- upvalues: v11 (ref), l___REACT_DEVTOOLS_GLOBAL_HOOK___0 (copy), v14 (copy), v12 (ref)
                v11 = l___REACT_DEVTOOLS_GLOBAL_HOOK___0.inject(v14);
                v12 = l___REACT_DEVTOOLS_GLOBAL_HOOK___0;
            end);
            if not l_status_0 and _G.__DEV__ then
                l_console_0.error("React instrumentation encountered an error: %s.", l_result_0);
            end;
            return true;
        end;
    end;
end;
v3.onScheduleRoot = function(v18, v19) --[[ Line: 106 ]]
    -- upvalues: v12 (ref), v11 (ref), v13 (ref), l_console_0 (copy)
    local v20 = false;
    if _G.__DEV__ and v12 then
        local l_onScheduleFiberRoot_0 = v12.onScheduleFiberRoot;
        local v22;
        if typeof(l_onScheduleFiberRoot_0) == "function" then
            v22 = true;
        else
            if typeof(l_onScheduleFiberRoot_0) == "table" then
                local v23 = getmetatable(l_onScheduleFiberRoot_0);
                if v23 and rawget(v23, "__call") then
                    v22 = true;
                    v20 = true;
                elseif l_onScheduleFiberRoot_0._isMockFunction then
                    v22 = true;
                    v20 = true;
                end;
            end;
            if not v20 then
                if not v20 then
                    v22 = false;
                end;
            end;
        end;
        v20 = false;
        if v22 then
            v22, l_onScheduleFiberRoot_0 = pcall(v12.onScheduleFiberRoot, v11, v18, v19);
            if not v22 and _G.__DEV__ and not v13 then
                v13 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onScheduleFiberRoot_0);
            end;
        end;
    end;
end;
v3.onCommitRoot = function(v24, v25) --[[ Line: 126 ]]
    -- upvalues: v12 (ref), l_DidCapture_0 (copy), l_enableProfilerTimer_0 (copy), v11 (ref), v13 (ref), l_console_0 (copy)
    local v26 = false;
    if v12 then
        local l_onCommitFiberRoot_0 = v12.onCommitFiberRoot;
        local v28;
        if typeof(l_onCommitFiberRoot_0) == "function" then
            v28 = true;
        else
            if typeof(l_onCommitFiberRoot_0) == "table" then
                local v29 = getmetatable(l_onCommitFiberRoot_0);
                if v29 and rawget(v29, "__call") then
                    v28 = true;
                    v26 = true;
                elseif l_onCommitFiberRoot_0._isMockFunction then
                    v28 = true;
                    v26 = true;
                end;
            end;
            if not v26 then
                if not v26 then
                    v28 = false;
                end;
            end;
        end;
        v26 = false;
        if v28 then
            v28, l_onCommitFiberRoot_0 = pcall(function() --[[ Line: 132 ]]
                -- upvalues: v24 (copy), l_DidCapture_0 (ref), l_enableProfilerTimer_0 (ref), v12 (ref), v11 (ref), v25 (copy)
                local v30 = bit32.band(v24.current.flags, l_DidCapture_0) == l_DidCapture_0;
                if l_enableProfilerTimer_0 then
                    v12.onCommitFiberRoot(v11, v24, v25, v30);
                    return;
                else
                    v12.onCommitFiberRoot(v11, v24, nil, v30);
                    return;
                end;
            end);
            if not v28 and _G.__DEV__ and not v13 then
                v13 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onCommitFiberRoot_0);
            end;
        end;
    end;
end;
v3.onCommitUnmount = function(v31) --[[ Line: 151 ]]
    -- upvalues: v12 (ref), v11 (ref), v13 (ref), l_console_0 (copy)
    local v32 = false;
    if v12 then
        local l_onCommitFiberUnmount_0 = v12.onCommitFiberUnmount;
        local v34;
        if typeof(l_onCommitFiberUnmount_0) == "function" then
            v34 = true;
        else
            if typeof(l_onCommitFiberUnmount_0) == "table" then
                local v35 = getmetatable(l_onCommitFiberUnmount_0);
                if v35 and rawget(v35, "__call") then
                    v34 = true;
                    v32 = true;
                elseif l_onCommitFiberUnmount_0._isMockFunction then
                    v34 = true;
                    v32 = true;
                end;
            end;
            if not v32 then
                if not v32 then
                    v34 = false;
                end;
            end;
        end;
        v32 = false;
        if v34 then
            v34, l_onCommitFiberUnmount_0 = pcall(v12.onCommitFiberUnmount, v11, v31);
            if not v34 and _G.__DEV__ and not v13 then
                v13 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onCommitFiberUnmount_0);
            end;
        end;
    end;
end;
return v3;