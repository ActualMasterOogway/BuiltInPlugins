local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = require(l_Parent_0.RegExp);
return {
    default = function(v3) --[[ Line: 16 ]] --[[ Name: validatePattern ]]
        -- upvalues: l_Boolean_0 (copy), v2 (copy)
        if v3 ~= nil and l_Boolean_0.toJSBoolean(v3) and not pcall(function() --[[ Line: 18 ]]
            -- upvalues: v2 (ref), v3 (copy)
            v2(v3, "i");
        end) then
            return false;
        else
            return true;
        end;
    end
};