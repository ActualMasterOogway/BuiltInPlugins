local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
return function(v3, _, v5) --[[ Line: 8 ]] --[[ Name: getMouseTarget ]]
    -- upvalues: l_Workspace_0 (copy)
    for _, v7 in v5 do
        if table.find(v3.hoveredPointNames, v7) ~= nil then
            return v7, nil, 1;
        end;
    end;
    if #v3.hoveredPointNames == 0 then
        return nil, nil, nil;
    elseif #v3.hoveredPointNames == 1 then
        return v3.hoveredPointNames[1], nil, 1;
    else
        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
        assert(l_CurrentCamera_0 ~= nil, "Camera was set to nil before getMouseTarget");
        local v9 = nil;
        local v10 = 1e999;
        local v11 = 0;
        for _, v13 in v3.points do
            if table.find(v3.hoveredPointNames, v13.name) ~= nil then
                local l_Magnitude_0 = (v3.worldModel.PrimaryPart.Position + v13.getCFrame().Position - l_CurrentCamera_0.CFrame.Position).Magnitude;
                if l_Magnitude_0 < v10 then
                    v10 = l_Magnitude_0;
                    v9 = v13.name;
                end;
                v11 = v11 + 1;
                if v11 == #v3.hoveredPointNames then
                    break;
                end;
            end;
        end;
        return v9, nil, 1;
    end;
end;