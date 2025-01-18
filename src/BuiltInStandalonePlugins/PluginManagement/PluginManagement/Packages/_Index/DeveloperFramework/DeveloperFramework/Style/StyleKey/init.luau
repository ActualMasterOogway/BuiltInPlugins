local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.tableCache)("StyleKey");
setmetatable(v1, {
    __index = function(v2, v3) --[[ Line: 12 ]] --[[ Name: __index ]]
        -- upvalues: v1 (copy)
        local v4 = v1:add(v3);
        v2[v3] = v4;
        return v4;
    end
});
return v1;