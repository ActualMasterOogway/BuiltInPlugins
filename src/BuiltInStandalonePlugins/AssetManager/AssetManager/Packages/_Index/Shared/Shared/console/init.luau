local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_console_0 = require(l_Parent_1.LuauPolyfill).console;
local v3 = require(l_Parent_0.consoleWithStackDev);
if _G.__DEV__ then
    return (setmetatable({
        warn = v3.warn, 
        error = v3.error
    }, {
        __index = l_console_0
    }));
else
    return l_console_0;
end;