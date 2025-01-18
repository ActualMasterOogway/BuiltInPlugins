local v0 = require(script.Parent.console);
local v1 = {};
setmetatable(v1, {
    __index = function(_, _) --[[ Line: 23 ]] --[[ Name: __index ]]
        -- upvalues: v0 (copy)
        if _G.__DEV__ then
            v0.warn("Attempted to access uninitialized state. Use setState to initialize state");
        end;
        return nil;
    end, 
    __newindex = function(_, _) --[[ Line: 31 ]] --[[ Name: __newindex ]]
        -- upvalues: v0 (copy)
        if _G.__DEV__ then
            v0.error("Attempted to directly mutate state. Use setState to assign new values to state.");
        end;
        return nil;
    end, 
    __tostring = function(_) --[[ Line: 39 ]] --[[ Name: __tostring ]]
        return "<uninitialized component state>";
    end, 
    __metatable = "UninitializedState"
});
return v1;