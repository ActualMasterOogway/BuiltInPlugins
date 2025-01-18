local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_DraggerFramework_0.Utility.Signal);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v7 = setmetatable({
        _region = {
            Region = {
                transform = v5, 
                size = v6
            }
        }
    }, v4);
    v7.SelectionChanged = v2.new();
    return v7;
end;
v4.SetRegion = function(v8, v9) --[[ Line: 23 ]] --[[ Name: SetRegion ]]
    v8._region.Region = {
        size = v9.Size, 
        transform = v9.Transform
    };
end;
v4.SetRegionSignal = function(v10, v11) --[[ Line: 30 ]] --[[ Name: SetRegionSignal ]]
    v10:SetRegion(v11);
    v10.SelectionChanged:Fire();
end;
v4.Set = function(_) --[[ Line: 36 ]] --[[ Name: Set ]]

end;
v4.Get = function(v13) --[[ Line: 40 ]] --[[ Name: Get ]]
    return {
        v13._region
    };
end;
return v4;