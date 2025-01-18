local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.getMeshInfo);
local v3 = require(l_Parent_0.util.getMeshMinMax);
local v4 = require(l_Parent_0.util.getExpectedPartSize);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v6, v7) --[[ Line: 17 ]] --[[ Name: getRenderMeshScale ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v8, v9, v10 = v2(v6, v7);
    if not v8 then
        return v8, v9;
    else
        local v11 = nil;
        local v12 = nil;
        local v13, v14, v15, v16 = v3(v10, v7);
        v8 = v13;
        v9 = v14;
        v11 = v15;
        v12 = v16;
        if not v8 then
            return v8, v9;
        else
            v13 = v12 - v11;
            return true, nil, (if v5() then v4(v6, v7) else v6.Size) / v13;
        end;
    end;
end;