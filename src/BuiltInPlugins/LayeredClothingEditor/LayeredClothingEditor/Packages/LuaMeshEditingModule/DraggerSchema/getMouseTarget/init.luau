local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_join_0 = require(l_Parent_1.Dash).join;
local l_Util_0 = l_Parent_0.Util;
local v4 = require(l_Util_0.Constants);
local v5 = require(l_Util_0.Selectable);
local l_Workspace_0 = game:GetService("Workspace");
local l_game_EngineFeature_0 = game:GetEngineFeature("DraggerBruteForceAll");
local v8 = require(l_Parent_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
return function(v9, v10, _) --[[ Line: 17 ]]
    -- upvalues: v8 (copy), l_Workspace_0 (copy), v5 (copy), v4 (copy), l_join_0 (copy), l_game_EngineFeature_0 (copy)
    if v8() then
        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
        local v13 = v9.vertexEditingTool:getHoveredPoint();
        if v13 ~= nil and v13.Parent ~= nil then
            local v14, _ = l_CurrentCamera_0:WorldToScreenPoint(v13.CFrame.Position);
            return v5.new(v13.Parent.Name, (tonumber(v13.Name))), v13, v14.Z;
        end;
    end;
    local l_l_Workspace_0_FirstChild_0 = l_Workspace_0:FindFirstChild(v4.ControlPointsFolderName);
    if not l_l_Workspace_0_FirstChild_0 then
        return nil;
    else
        local v17 = {};
        for _, v19 in ipairs(l_l_Workspace_0_FirstChild_0:GetChildren()) do
            v17 = l_join_0(v17, v19:GetChildren());
        end;
        if l_game_EngineFeature_0 then
            local v20 = RaycastParams.new();
            v20.FilterDescendantsInstances = v17;
            v20.BruteForceAllSlow = true;
            v20.FilterType = Enum.RaycastFilterType.Whitelist;
            local v21 = l_Workspace_0:Raycast(v10.Origin, v10.Direction, v20);
            if not v21 then
                return nil;
            else
                return v5.new(v21.Instance.Parent.Name, (tonumber(v21.Instance.Name))), v21.Instance, v21.Distance;
            end;
        else
            local l_l_Workspace_0_PartOnRayWithWhitelist_0, v23 = l_Workspace_0:FindPartOnRayWithWhitelist(v10, v17);
            local l_Magnitude_0 = (v10.Origin - v23).Magnitude;
            if l_l_Workspace_0_PartOnRayWithWhitelist_0 then
                return v5.new(l_l_Workspace_0_PartOnRayWithWhitelist_0.Parent.Name, (tonumber(l_l_Workspace_0_PartOnRayWithWhitelist_0.Name))), l_l_Workspace_0_PartOnRayWithWhitelist_0, l_Magnitude_0;
            else
                return nil;
            end;
        end;
    end;
end;