local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_BoundingBox_0 = require(l_script_FirstAncestor_0.Packages.DraggerFramework).Utility.BoundingBox;
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.getBoundingBox);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        _draggerContext = v5
    }, v4));
end;
v4.isEmpty = function(_) --[[ Line: 27 ]] --[[ Name: isEmpty ]]
    return false;
end;
v4.getBoundingBox = function(v7) --[[ Line: 31 ]] --[[ Name: getBoundingBox ]]
    -- upvalues: l_BoundingBox_0 (copy), v3 (copy)
    if #v7._draggerContext.selectedPoints == 0 then
        local l_Pivot_0 = v7._draggerContext.worldModel:GetPivot();
        return l_Pivot_0, l_BoundingBox_0.fromObjects({
            v7._draggerContext.worldModel
        }, l_Pivot_0);
    else
        return v3(v7._draggerContext);
    end;
end;
v4.getLocalBoundingBox = function(_) --[[ Line: 40 ]] --[[ Name: getLocalBoundingBox ]]
    error("getLocalBoundingBox is not supported");
end;
v4.doesContainItem = function(v10, v11) --[[ Line: 44 ]] --[[ Name: doesContainItem ]]
    return table.find(v10._selection, v11) ~= nil;
end;
v4.isDynamic = function(_) --[[ Line: 48 ]] --[[ Name: isDynamic ]]
    return false;
end;
return v4;