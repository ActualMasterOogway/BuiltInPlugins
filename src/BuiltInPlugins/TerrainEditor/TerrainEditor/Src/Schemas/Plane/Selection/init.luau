local l_DraggerFramework_0 = script:FindFirstAncestor("TerrainEditor").Packages.DraggerFramework;
local v1 = require(l_DraggerFramework_0.Utility.Signal);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = setmetatable({
        _transform = {
            Transform = v3
        }
    }, v2);
    v4.SelectionChanged = v1.new();
    return v4;
end;
v2.SetTransform = function(v5, v6) --[[ Line: 18 ]] --[[ Name: SetTransform ]]
    v5._transform.Transform = v6;
end;
v2.SetTransformSignal = function(v7, v8) --[[ Line: 22 ]] --[[ Name: SetTransformSignal ]]
    v7:SetTransform(v8);
    v7.SelectionChanged:Fire();
end;
v2.Set = function(_) --[[ Line: 28 ]] --[[ Name: Set ]]

end;
v2.Get = function(v10) --[[ Line: 32 ]] --[[ Name: Get ]]
    return {
        v10._transform
    };
end;
return v2;