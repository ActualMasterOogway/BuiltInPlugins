local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_inspect_0 = v1.util.inspect;
local l_setTimeout_0 = v1.setTimeout;
local v4 = require(l_Parent_0.Shared);
local l_console_0 = v4.console;
local l_errorToString_0 = v4.errorToString;
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactCapturedValue);
local l_showErrorDialog_0 = require(script.Parent.ReactFiberErrorDialog).showErrorDialog;
local l_ClassComponent_0 = require(script.Parent.ReactWorkTags).ClassComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
return {
    logCapturedError = function(v12, v13) --[[ Line: 33 ]]
        -- upvalues: l_showErrorDialog_0 (copy), l_ClassComponent_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_inspect_0 (copy), l_setTimeout_0 (copy), l_errorToString_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_showErrorDialog_0 (ref), v12 (copy), v13 (copy), l_ClassComponent_0 (ref), l_console_0 (ref), l_getComponentName_0 (ref), l_inspect_0 (ref)
            if l_showErrorDialog_0(v12, v13) == false then
                return nil;
            else
                local l_value_0 = v13.value;
                if _G.__DEV__ then
                    local l_source_0 = v13.source;
                    local v16 = v13.stack or "";
                    if l_value_0 ~= nil and l_value_0._suppressLogging then
                        if v12.tag == l_ClassComponent_0 then
                            return;
                        else
                            l_console_0.error(l_value_0);
                        end;
                    end;
                    local v17 = nil;
                    v17 = if l_source_0 ~= nil then l_getComponentName_0(l_source_0.type) else nil;
                    local v18 = nil;
                    v18 = if v17 then "The above error occurred in the <" .. tostring(v17) .. "> component:" else "The above error occurred in one of your React components:";
                    local _ = nil;
                    local v20 = l_getComponentName_0(v12.type);
                    local v21 = v18 .. "\n" .. v16 .. "\n\n" .. if v20 then "React will try to recreate this component tree from scratch " .. "using the error boundary you provided, " .. v20 .. "." else "Consider adding an error boundary to your tree to customize error handling behavior.\n" .. "Visit https://reactjs.org/link/error-boundaries to learn more about error boundaries.";
                    l_console_0.error(v21);
                else
                    l_console_0.error(l_inspect_0(l_value_0));
                end;
                return nil;
            end;
        end);
        if not l_status_0 then
            warn("failed to error with error: " .. l_inspect_0(l_result_0));
            l_setTimeout_0(function() --[[ Line: 125 ]]
                -- upvalues: l_errorToString_0 (ref), l_result_0 (copy)
                error(l_errorToString_0(l_result_0));
            end);
        end;
    end
};