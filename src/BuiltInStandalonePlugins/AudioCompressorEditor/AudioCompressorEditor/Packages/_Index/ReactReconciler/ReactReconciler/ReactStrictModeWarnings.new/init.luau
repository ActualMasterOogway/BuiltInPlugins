local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v3 = require(script.Parent.ReactCurrentFiber);
local l_resetCurrentFiber_0 = v3.resetCurrentFiber;
local l_setCurrentFiber_0 = v3.setCurrentFiber;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_StrictMode_0 = require(script.Parent.ReactTypeOfMode).StrictMode;
local v12 = {
    recordUnsafeLifecycleWarnings = function(_, _) --[[ Line: 31 ]] --[[ Name: recordUnsafeLifecycleWarnings ]]

    end, 
    flushPendingUnsafeLifecycleWarnings = function() --[[ Line: 32 ]] --[[ Name: flushPendingUnsafeLifecycleWarnings ]]

    end, 
    recordLegacyContextWarning = function(_, _) --[[ Line: 33 ]] --[[ Name: recordLegacyContextWarning ]]

    end, 
    flushLegacyContextWarning = function() --[[ Line: 34 ]] --[[ Name: flushLegacyContextWarning ]]

    end, 
    discardPendingWarnings = function() --[[ Line: 35 ]] --[[ Name: discardPendingWarnings ]]

    end
};
if _G.__DEV__ then
    local function _(v13) --[[ Line: 39 ]]
        -- upvalues: l_StrictMode_0 (copy)
        local v14 = nil;
        local l_v13_0 = v13;
        while l_v13_0 ~= nil do
            if bit32.band(l_v13_0.mode, l_StrictMode_0) ~= 0 then
                v14 = l_v13_0;
            end;
            l_v13_0 = l_v13_0.return_;
        end;
        return v14;
    end;
    local function v21(v17) --[[ Line: 54 ]]
        local v18 = {};
        for v19, _ in v17 do
            table.insert(v18, v19);
        end;
        table.sort(v18);
        return table.concat(v18, ", ");
    end;
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = {};
    local v28 = {};
    v12.recordUnsafeLifecycleWarnings = function(v29, v30) --[[ Line: 74 ]]
        -- upvalues: v28 (copy), v22 (copy), l_StrictMode_0 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy)
        if v28[v29.type] then
            return;
        else
            if typeof(v30.componentWillMount) == "function" then
                table.insert(v22, v29);
            end;
            if bit32.band(v29.mode, l_StrictMode_0) ~= 0 and typeof(v30.UNSAFE_componentWillMount) == "function" then
                table.insert(v23, v29);
            end;
            if typeof(v30.componentWillReceiveProps) == "function" then
                table.insert(v24, v29);
            end;
            if bit32.band(v29.mode, l_StrictMode_0) ~= 0 and typeof(v30.UNSAFE_componentWillReceiveProps) == "function" then
                table.insert(v25, v29);
            end;
            if typeof(v30.componentWillUpdate) == "function" then
                table.insert(v26, v29);
            end;
            if bit32.band(v29.mode, l_StrictMode_0) ~= 0 and typeof(v30.UNSAFE_componentWillUpdate) == "function" then
                table.insert(v27, v29);
            end;
            return;
        end;
    end;
    v12.flushPendingUnsafeLifecycleWarnings = function() --[[ Line: 127 ]]
        -- upvalues: v22 (copy), l_getComponentName_0 (copy), v28 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v21 (copy), l_console_0 (copy)
        local v31 = {};
        if #v22 > 0 then
            for _, v33 in v22 do
                v31[l_getComponentName_0(v33.type) or "Component"] = true;
                v28[v33.type] = true;
            end;
            table.clear(v22);
        end;
        local v34 = {};
        if #v23 > 0 then
            for _, v36 in v23 do
                v34[l_getComponentName_0(v36.type) or "Component"] = true;
                v28[v36.type] = true;
            end;
            table.clear(v23);
        end;
        local v37 = {};
        if #v24 > 0 then
            for _, v39 in v24 do
                v37[l_getComponentName_0(v39.type) or "Component"] = true;
                v28[v39.type] = true;
            end;
            table.clear(v24);
        end;
        local v40 = {};
        if #v25 > 0 then
            for _, v42 in v25 do
                v40[l_getComponentName_0(v42.type) or "Component"] = true;
                v28[v42.type] = true;
            end;
            table.clear(v25);
        end;
        local v43 = {};
        if #v26 > 0 then
            for _, v45 in v26 do
                v43[l_getComponentName_0(v45.type) or "Component"] = true;
                v28[v45.type] = true;
            end;
            table.clear(v26);
        end;
        local v46 = {};
        if #v27 > 0 then
            for _, v48 in v27 do
                v46[l_getComponentName_0(v48.type) or "Component"] = true;
                v28[v48.type] = true;
            end;
            table.clear(v27);
        end;
        if next(v34) ~= nil then
            local v49 = v21(v34);
            l_console_0.error("Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move code with side effects to componentDidMount, and set initial state in the constructor.\n" .. "\nPlease update the following components: %s", v49);
        end;
        if next(v40) ~= nil then
            local v50 = v21(v40);
            l_console_0.error("Using UNSAFE_componentWillReceiveProps in strict mode is not recommended " .. "and may indicate bugs in your code. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move data fetching code or side effects to componentDidUpdate.\n" .. "* If you're updating state whenever props change, " .. "refactor your code to use memoization techniques or move it to " .. "static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n" .. "\nPlease update the following components: %s", v50);
        end;
        if next(v46) ~= nil then
            local v51 = v21(v46);
            l_console_0.error("Using UNSAFE_componentWillUpdate in strict mode is not recommended " .. "and may indicate bugs in your code. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move data fetching code or side effects to componentDidUpdate.\n" .. "\nPlease update the following components: %s", v51);
        end;
        if next(v31) ~= nil then
            local v52 = v21(v31);
            l_console_0.warn("componentWillMount has been renamed, and is not recommended for use. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move code with side effects to componentDidMount, and set initial state in the constructor.\n" .. "* Rename componentWillMount to UNSAFE_componentWillMount to suppress " .. "this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n" .. "\nPlease update the following components: %s", v52);
        end;
        if next(v37) ~= nil then
            local v53 = v21(v37);
            l_console_0.warn("componentWillReceiveProps has been renamed, and is not recommended for use. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move data fetching code or side effects to componentDidUpdate.\n" .. "* If you're updating state whenever props change, refactor your " .. "code to use memoization techniques or move it to " .. "static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n" .. "* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress " .. "this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n" .. "\nPlease update the following components: %s", v53);
        end;
        if next(v43) ~= nil then
            local v54 = v21(v43);
            l_console_0.warn("componentWillUpdate has been renamed, and is not recommended for use. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move data fetching code or side effects to componentDidUpdate.\n" .. "* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress " .. "this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n" .. "\nPlease update the following components: %s", v54);
        end;
    end;
    local v55 = {};
    local v56 = {};
    v12.recordLegacyContextWarning = function(v57, v58) --[[ Line: 301 ]]
        -- upvalues: l_StrictMode_0 (copy), l_console_0 (copy), v56 (copy), v55 (copy)
        local v59 = nil;
        local l_v57_0 = v57;
        while l_v57_0 ~= nil do
            if bit32.band(l_v57_0.mode, l_StrictMode_0) ~= 0 then
                v59 = l_v57_0;
            end;
            l_v57_0 = l_v57_0.return_;
        end;
        local l_v59_0 = v59;
        if l_v59_0 == nil then
            l_console_0.error("Expected to find a StrictMode component in a strict mode tree. " .. "This error is likely caused by a bug in React. Please file an issue.");
            return;
        elseif v56[v57.type] then
            return;
        else
            v59 = v55[l_v59_0];
            if typeof(v57.type) ~= "function" and (v57.type.contextTypes ~= nil or v57.type.childContextTypes ~= nil or v58 ~= nil and typeof(v58.getChildContext) == "function") then
                if v59 == nil then
                    v59 = {};
                    v55[l_v59_0] = v59;
                end;
                table.insert(v59, v57);
            end;
            return;
        end;
    end;
    v12.flushLegacyContextWarning = function() --[[ Line: 340 ]]
        -- upvalues: v55 (copy), l_getComponentName_0 (copy), v56 (copy), v21 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
        for _, v63 in v55 do
            if #v63 == 0 then
                return;
            else
                local v64 = v63[1];
                local v65 = {};
                for _, v67 in v63 do
                    v65[l_getComponentName_0(v67.type) or "Component"] = true;
                    v56[v67.type] = true;
                end;
                local v68 = v21(v65);
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 355 ]]
                    -- upvalues: l_setCurrentFiber_0 (ref), v64 (copy), l_console_0 (ref), v68 (copy)
                    l_setCurrentFiber_0(v64);
                    l_console_0.error("Legacy context API has been detected within a strict-mode tree." .. "\n\nThe old API will be supported in all 16.x releases, but applications " .. "using it should migrate to the new version." .. "\n\nPlease update the following components: %s" .. "\n\nLearn more about this warning here: https://reactjs.org/link/legacy-context", v68);
                end);
                l_resetCurrentFiber_0();
                if not l_status_0 then
                    error(l_result_0);
                end;
            end;
        end;
    end;
    v12.discardPendingWarnings = function() --[[ Line: 376 ]]
        -- upvalues: v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v55 (copy)
        table.clear(v22);
        table.clear(v23);
        table.clear(v24);
        table.clear(v25);
        table.clear(v26);
        table.clear(v27);
        table.clear(v55);
    end;
end;
return v12;