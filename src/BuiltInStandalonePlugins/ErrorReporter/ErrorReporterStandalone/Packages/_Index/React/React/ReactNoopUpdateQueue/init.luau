local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v2 = {};
local function _(v3, v4) --[[ Line: 15 ]] --[[ Name: warnNoop ]]
    -- upvalues: v2 (copy), l_console_0 (copy)
    if _G.__DEV__ then
        local v5 = v3.__componentName or "ReactClass";
        local v6 = v5 .. "." .. v4;
        if v2[v6] then
            return;
        else
            l_console_0.error("Can't call %s on a component that is not yet mounted. " .. "This is a no-op, but it might indicate a bug in your application. " .. "Instead, assign to `self.state` directly with the desired state in " .. "the %s component's `init` method.", v4, v5);
            v2[v6] = true;
        end;
    end;
end;
return {
    isMounted = function(_) --[[ Line: 50 ]] --[[ Name: isMounted ]]
        return false;
    end, 
    enqueueForceUpdate = function(v9, _, _) --[[ Line: 68 ]] --[[ Name: enqueueForceUpdate ]]
        -- upvalues: v2 (copy), l_console_0 (copy)
        if _G.__DEV__ then
            local v12 = v9.__componentName or "ReactClass";
            local v13 = v12 .. "." .. "forceUpdate";
            if v2[v13] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. " .. "This is a no-op, but it might indicate a bug in your application. " .. "Instead, assign to `self.state` directly with the desired state in " .. "the %s component's `init` method.", "forceUpdate", v12);
                v2[v13] = true;
            end;
        end;
    end, 
    enqueueReplaceState = function(v14, _, _, _) --[[ Line: 84 ]] --[[ Name: enqueueReplaceState ]]
        -- upvalues: v2 (copy), l_console_0 (copy)
        if _G.__DEV__ then
            local v18 = v14.__componentName or "ReactClass";
            local v19 = v18 .. "." .. "replaceState";
            if v2[v19] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. " .. "This is a no-op, but it might indicate a bug in your application. " .. "Instead, assign to `self.state` directly with the desired state in " .. "the %s component's `init` method.", "replaceState", v18);
                v2[v19] = true;
            end;
        end;
    end, 
    enqueueSetState = function(v20, _, _, _) --[[ Line: 99 ]] --[[ Name: enqueueSetState ]]
        -- upvalues: v2 (copy), l_console_0 (copy)
        if _G.__DEV__ then
            local v24 = v20.__componentName or "ReactClass";
            local v25 = v24 .. "." .. "setState";
            if v2[v25] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. " .. "This is a no-op, but it might indicate a bug in your application. " .. "Instead, assign to `self.state` directly with the desired state in " .. "the %s component's `init` method.", "setState", v24);
                v2[v25] = true;
            end;
        end;
    end
};