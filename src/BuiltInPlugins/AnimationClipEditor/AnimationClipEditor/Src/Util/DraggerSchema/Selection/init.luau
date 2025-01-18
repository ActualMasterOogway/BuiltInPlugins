local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Selection_0 = game:GetService("Selection");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v6 = setmetatable({}, v3);
    v6.SelectionChanged = v4;
    v6.setSelectedTrackInstances = v5;
    return v6;
end;
v3.Set = function(v7, v8) --[[ Line: 20 ]] --[[ Name: Set ]]
    v7.setSelectedTrackInstances(v8);
end;
v3.Get = function(v9) --[[ Line: 24 ]] --[[ Name: Get ]]
    -- upvalues: l_deepCopy_0 (copy), l_Selection_0 (copy)
    return v9.selectedTrackInstances and l_deepCopy_0(v9.selectedTrackInstances) or l_Selection_0:Get();
end;
v3.GetActiveInstance = function(_) --[[ Line: 28 ]] --[[ Name: GetActiveInstance ]]
    return nil;
end;
return v3;