local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
return function(v3) --[[ Line: 12 ]] --[[ Name: ResolveButton ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy)
    return v1.createElement("TextButton", {
        Interactable = not v3.Disabled, 
        [v1.Event.Activated] = v3.OnClick, 
        [v1.Tag] = l_joinTags_0("Component-ResolveButton", v3.Resolved and "Resolved" or nil, v3.Disabled and "Disabled" or nil, v3[v1.Tag])
    }, {
        Icon = v1.createElement("ImageLabel")
    });
end;