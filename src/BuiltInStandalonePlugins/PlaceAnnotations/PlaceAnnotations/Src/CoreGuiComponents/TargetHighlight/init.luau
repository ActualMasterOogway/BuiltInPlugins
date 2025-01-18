local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Mouse_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Mouse;
local v3 = require(l_script_FirstAncestor_0.Src.Util.doSelectionRaycast);
return function() --[[ Line: 9 ]] --[[ Name: TargetHighlight ]]
    -- upvalues: v1 (copy), l_Mouse_0 (copy), v3 (copy)
    local v4, v5 = v1.useState(nil);
    local v6 = l_Mouse_0:use():get();
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v3 (ref), v5 (copy)
        local v8 = v6.Move:Connect(function() --[[ Line: 14 ]]
            -- upvalues: v3 (ref), v6 (ref), v5 (ref)
            local v7 = v3(v6);
            if v7 then
                v5(v7.Instance);
                return;
            else
                v5(nil);
                return;
            end;
        end);
        return function() --[[ Line: 23 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {});
    return v1.createElement("Highlight", {
        Adornee = v4, 
        LineThickness = 3, 
        ReservedId = Enum.ReservedHighlightId.Hover, 
        OutlineColor = Color3.fromRGB(190, 250, 190), 
        OutlineTransparency = 0.15, 
        FillTransparency = 1, 
        DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    });
end;