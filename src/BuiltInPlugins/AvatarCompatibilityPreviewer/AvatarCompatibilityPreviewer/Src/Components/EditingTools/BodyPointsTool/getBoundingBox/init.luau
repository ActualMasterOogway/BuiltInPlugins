local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
return function(v2) --[[ Line: 6 ]] --[[ Name: getBoundingBox ]]
    if #v2.selectedPoints == 0 then
        return CFrame.new(), Vector3.new(), (Vector3.new());
    else
        local v3 = 1e999;
        local v4 = -1e999;
        local v5 = 1e999;
        local v6 = -1e999;
        local v7 = 1e999;
        local v8 = -1e999;
        local l_PrimaryPart_0 = v2.worldModel.PrimaryPart;
        for _, v11 in v2.selectedPoints do
            local l_Components_0, v13, v14 = v11.getCFrame():GetComponents();
            v3 = math.min(v3, l_Components_0);
            v4 = math.max(v4, l_Components_0);
            v5 = math.min(v5, v13);
            v6 = math.max(v6, v13);
            v7 = math.min(v7, v14);
            v8 = math.max(v8, v14);
        end;
        local v15 = Vector3.new(0.5 * (v3 + v4), 0.5 * (v5 + v6), 0.5 * (v7 + v8));
        return l_PrimaryPart_0.CFrame + l_PrimaryPart_0.CFrame.Rotation * v15, Vector3.new(), (Vector3.new());
    end;
end;