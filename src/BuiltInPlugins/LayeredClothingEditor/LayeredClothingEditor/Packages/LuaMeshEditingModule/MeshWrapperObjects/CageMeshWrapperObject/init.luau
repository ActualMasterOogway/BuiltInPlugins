local l_Util_0 = script.Parent.Parent.Util;
local v1 = require(l_Util_0.WrapUtil);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5 = setmetatable({}, v2);
    v5.instance = v4;
    v5.getVertices = function(v6) --[[ Line: 22 ]] --[[ Name: getVertices ]]
        -- upvalues: v1 (ref), v3 (copy)
        return v1.getVerticesFromWrap(v3, v6.instance);
    end;
    v5.getTriangleIndexData = function(v7) --[[ Line: 25 ]] --[[ Name: getTriangleIndexData ]]
        -- upvalues: v1 (ref), v3 (copy)
        local v8 = v1.getFacesForWrap(v3, v7.instance);
        local v9 = {};
        for v10 = 1, #v8, 3 do
            table.insert(v9, {
                v8[v10] + 1, 
                v8[v10 + 1] + 1, 
                v8[v10 + 2] + 1
            });
        end;
        return v9;
    end;
    v5.getMeshOrigin = function(v11) --[[ Line: 37 ]] --[[ Name: getMeshOrigin ]]
        -- upvalues: v1 (ref), v3 (copy)
        return v1.getCageOrigin(v3, v11.instance);
    end;
    return v5;
end;
return v2;