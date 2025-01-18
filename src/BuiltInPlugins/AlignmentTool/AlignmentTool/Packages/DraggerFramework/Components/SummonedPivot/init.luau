local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local _ = require(l_Parent_0.Utility.Colors);
return function(v5) --[[ Line: 17 ]]
    -- upvalues: v3 (copy), l_Workspace_0 (copy)
    local v6 = v5.DraggerContext:getHandleScale(v5.CFrame.Position);
    local v7 = nil;
    local v8 = nil;
    if v5.Dragging then
        v7 = v5.DraggerContext:getChosenColor();
        v8 = 0.4;
    else
        v7 = v5.DraggerContext:getGridColor();
        v8 = v5.Hovered and 0.7 or 0.5;
    end;
    return v3.createElement("BoxHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Color3 = v7, 
        CFrame = v5.CFrame, 
        Size = Vector3.one * (v8 * v6), 
        AlwaysOnTop = false, 
        Transparency = 0, 
        ZIndex = 0
    });
end;