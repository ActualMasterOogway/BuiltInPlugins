local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function() --[[ Line: 11 ]] --[[ Name: Background ]]
    -- upvalues: l_Stylizer_0 (copy), v2 (copy)
    local v5 = l_Stylizer_0:use("Background");
    return v2.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = v5.Image, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = -1
    });
end;