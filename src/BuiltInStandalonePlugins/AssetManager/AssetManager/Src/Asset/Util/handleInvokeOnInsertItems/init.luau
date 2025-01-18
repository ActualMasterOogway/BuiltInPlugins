local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Asset.Util.getAssetInstance);
local v3 = require(l_script_FirstAncestor_0.Src.Asset.Util.cameraZoomToExtents);
local v4 = require(l_script_FirstAncestor_0.Src.Asset.Util.getInsertPosition);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Selection_0 = game:GetService("Selection");
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
return function(v9, v10) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), v2 (copy), v8 (copy), l_Selection_0 (copy), l_ChangeHistoryService_0 (copy), v3 (copy)
    local v11 = if v10 then nil else v4();
    local v12 = l_HttpService_0:JSONDecode(v9);
    local v13 = {};
    for _, v15 in v12 do
        local v16 = v2[v15.AssetType](v15, v11);
        if v16 then
            v16.Parent = game.Workspace;
            v16.Name = v15.DisplayName;
            table.insert(v13, v16);
        elseif v8() then
            warn("Asset failed to load!");
        end;
    end;
    if #v13 ~= 0 then
        l_Selection_0:Set(v13);
        l_ChangeHistoryService_0:SetWaypoint("Insert assets");
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            v3(l_CurrentCamera_0, v13);
        end;
    end;
end;