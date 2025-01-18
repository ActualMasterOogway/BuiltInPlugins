local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_console_0 = v1.console;
local l_Array_0 = v1.Array;
local v4 = require(script.Parent.ReactSharedInternals);
local v5 = nil;
local v8 = {
    warn = function(v6, ...) --[[ Line: 25 ]]
        -- upvalues: v5 (ref)
        if _G.__DEV__ then
            v5("warn", v6, {
                ...
            });
        end;
    end, 
    error = function(v7, ...) --[[ Line: 30 ]]
        -- upvalues: v5 (ref)
        if _G.__DEV__ then
            v5("error", v7, {
                ...
            });
        end;
    end
};
v5 = function(v9, v10, v11) --[[ Line: 36 ]] --[[ Name: printWarning ]]
    -- upvalues: v4 (copy), l_Array_0 (copy), l_console_0 (copy)
    if _G.__DEV__ then
        local v12 = v4.ReactDebugCurrentFrame.getStackAddendum();
        if v12 ~= "" then
            v10 = v10 .. "%s";
            v11 = l_Array_0.slice(v11, 1);
            table.insert(v11, v12);
        end;
        local v13 = l_Array_0.map(v11, tostring);
        table.insert(v13, 1, "Warning: " .. v10);
        l_console_0[v9](unpack(v13));
    end;
end;
return v8;