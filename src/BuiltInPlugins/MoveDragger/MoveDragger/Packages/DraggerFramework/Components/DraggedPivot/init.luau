local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
return function(v3) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), l_Workspace_0 (copy)
    local v4 = v3.DraggerContext:getHandleScale(v3.CFrame.Position);
    return v2.createElement("SphereHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        CFrame = v3.CFrame, 
        Radius = v4 * 0.4, 
        ZIndex = 0, 
        AlwaysOnTop = false, 
        Transparency = 0.5, 
        Color3 = v3.DraggerContext:getSelectionBoxColor(v3.IsActive)
    });
end;