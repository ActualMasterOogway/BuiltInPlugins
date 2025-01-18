local l_Parent_0 = script.Parent;
local l_afterEach_0 = require(l_Parent_0.JestGlobals).afterEach;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_jsHelpers_0 = script.jsHelpers;
local v4 = require(l_jsHelpers_0.isCallable);
local v5 = {};
local l_cleanup_0 = require(script.pure).cleanup;
if not _G.RTL_SKIP_AUTO_CLEANUP and v4(l_afterEach_0) then
    l_afterEach_0(function() --[[ Line: 29 ]]
        -- upvalues: l_cleanup_0 (copy)
        l_cleanup_0();
    end);
end;
l_Object_0.assign(v5, require(script.pure));
local _ = require(script.types);
return v5;