local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
return function(v2) --[[ Line: 4 ]] --[[ Name: SphereAdorn ]]
    -- upvalues: v1 (copy)
    local v3 = nil;
    local v4 = nil;
    if v2.Adornee.ClassName == "Attachment" then
        v3 = v2.Adornee.Parent;
        v4 = v2.Adornee.CFrame;
    else
        v3 = v2.Adornee;
    end;
    return v1.createElement("SphereHandleAdornment", {
        Adornee = v3, 
        CFrame = v4, 
        Color3 = v2.Color, 
        AlwaysOnTop = v2.AlwaysOnTop, 
        Transparency = 0.3, 
        ZIndex = v2.AlwaysOnTop and 1 or nil
    });
end;