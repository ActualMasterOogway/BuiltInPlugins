local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
return function(v3) --[[ Line: 21 ]] --[[ Name: BodyPointAdornment ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2(false);
    local v5 = v1.useCallback(function() --[[ Line: 24 ]]
        -- upvalues: v4 (copy), v3 (copy)
        v4.enable();
        v3.onMouseEnter();
    end, {
        v3.onMouseEnter
    });
    local v6 = v1.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v4 (copy), v3 (copy)
        v4.disable();
        v3.onMouseLeave();
    end, {
        v3.onMouseLeave
    });
    local v7 = if v3.showOrientation ~= nil then v3.showOrientation else v4.enabled;
    return v1.createElement(v1.Fragment, {}, {
        Sphere = v1.createElement("SphereHandleAdornment", {
            Adornee = v3.adornee, 
            AlwaysOnTop = true, 
            CFrame = v3.cframe, 
            Color3 = v3.color, 
            Radius = 0.1, 
            Transparency = v3.transparency, 
            ZIndex = 1, 
            [v1.Event.MouseEnter] = v5, 
            [v1.Event.MouseLeave] = v6
        }), 
        SphereOverModel = v1.createElement("SphereHandleAdornment", {
            Adornee = v3.adornee, 
            AlwaysOnTop = false, 
            CFrame = v3.cframe, 
            Color3 = v3.color, 
            Radius = 0.1, 
            Transparency = v3.transparencyOverModel, 
            ZIndex = 1
        }), 
        X = v7 and v1.createElement("LineHandleAdornment", {
            Adornee = v3.adornee, 
            AlwaysOnTop = true, 
            Length = 0.25, 
            Thickness = 3, 
            Color3 = Color3.new(1, 0, 0), 
            CFrame = v3.cframe * CFrame.Angles(0, 1.5707963267948966, 0), 
            ZIndex = 2
        }), 
        Y = v7 and v1.createElement("LineHandleAdornment", {
            Adornee = v3.adornee, 
            AlwaysOnTop = true, 
            Length = 0.25, 
            Thickness = 3, 
            Color3 = Color3.new(0, 1, 0), 
            CFrame = v3.cframe * CFrame.Angles(1.5707963267948966, 0, 0), 
            ZIndex = 2
        }), 
        Z = v7 and v1.createElement("LineHandleAdornment", {
            Adornee = v3.adornee, 
            AlwaysOnTop = true, 
            Length = 0.25, 
            Thickness = 3, 
            Color3 = Color3.new(0, 0, 1), 
            CFrame = v3.cframe, 
            ZIndex = 2
        })
    });
end;