local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
return {
    default = function(v2) --[[ Line: 16 ]] --[[ Name: isPromise ]]
        -- upvalues: v1 (copy)
        return v1.is(v2);
    end
};