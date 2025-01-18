local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local function _(v2) --[[ Line: 27 ]] --[[ Name: onlyInTestError ]]
    -- upvalues: l_console_0 (copy)
    return function() --[[ Line: 28 ]]
        -- upvalues: l_console_0 (ref), v2 (copy)
        l_console_0.error(v2 .. " is only available in tests, not in production");
    end;
end;
local v4 = require(script.ReactCurrentDispatcher);
local v5 = require(script.ReactCurrentBatchConfig);
local v6 = require(script.ReactCurrentOwner);
local v7 = require(script.ReactDebugCurrentFrame);
local v8 = require(script.IsSomeRendererActing);
return {
    ReactCurrentDispatcher = v4, 
    ReactCurrentBatchConfig = v5, 
    ReactCurrentOwner = v6, 
    IsSomeRendererActing = v8, 
    ReactDebugCurrentFrame = if _G.__DEV__ then v7 else {
        setExtraStackFrame = function(_) --[[ Line: 51 ]] --[[ Name: setExtraStackFrame ]]

        end
    }
};