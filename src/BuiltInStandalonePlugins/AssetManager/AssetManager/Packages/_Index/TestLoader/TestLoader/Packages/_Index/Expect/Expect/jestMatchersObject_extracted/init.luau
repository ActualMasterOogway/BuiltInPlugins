local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Symbol_0 = require(l_Parent_1.LuauPolyfill).Symbol;
local _ = require(l_Parent_0.types);
local v4 = l_Symbol_0.for_("$$jest-matchers-object");
return {
    JEST_MATCHERS_OBJECT = v4, 
    getState = function() --[[ Line: 29 ]] --[[ Name: getState ]]
        -- upvalues: v4 (copy)
        return _G[v4].state;
    end
};