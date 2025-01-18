local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(script.Parent.Breakpoint);
local v3 = require(script.Parent.Callstack);
local v4 = require(script.Parent.Common);
local v5 = require(script.Parent.Watch);
local v6 = require(script.Parent.ScriptInfo);
return v1.combineReducers({
    Breakpoint = v2, 
    Watch = v5, 
    Callstack = v3, 
    Common = v4, 
    ScriptInfo = v6
});