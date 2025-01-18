local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_InsertService_0 = game:GetService("InsertService");
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v4 = require(l_script_FirstAncestor_0.Src.Utility.getWorkspaceInsertPosition);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagZoomToExtentsApi);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCinFixUploadResults);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local function _(v8, v9) --[[ Line: 15 ]] --[[ Name: getCameraOffset ]]
    local l_ViewportSize_0 = v9.ViewportSize;
    local v11 = math.min(1, l_ViewportSize_0.X / l_ViewportSize_0.Y);
    local v12 = math.atan(math.tan((math.rad(v9.FieldOfView / 2))) * v11);
    return v8.Magnitude / 2 / math.sin(v12);
end;
local function v22(v14, v15) --[[ Line: 25 ]] --[[ Name: zoomToExtents ]]
    -- upvalues: v5 (copy)
    local v16 = if v15:IsA("Model") then v15:GetModelCFrame() else v15.CFrame;
    local v17 = if v15:IsA("Model") then v15:GetExtentsSize() else v15.Size;
    if v5() then
        v14:zoomToExtents(v16, v17);
        return;
    else
        v14.CameraType = Enum.CameraType.Fixed;
        local l_ViewportSize_1 = v14.ViewportSize;
        local v19 = math.min(1, l_ViewportSize_1.X / l_ViewportSize_1.Y);
        local v20 = math.atan(math.tan((math.rad(v14.FieldOfView / 2))) * v19);
        local v21 = v17.Magnitude / 2 / math.sin(v20);
        l_ViewportSize_1 = v14.CFrame;
        v14.CFrame = l_ViewportSize_1 - l_ViewportSize_1.p + v16.p - l_ViewportSize_1.LookVector * v21;
        v14.Focus = v16;
        return;
    end;
end;
local function v30(v23, v24) --[[ Line: 40 ]] --[[ Name: handleAssetInsertion ]]
    -- upvalues: v6 (copy), l_InsertService_0 (copy), v4 (copy), l_ChangeHistoryService_0 (copy), v7 (copy), l_Selection_0 (copy), v22 (copy)
    if not v24.InsertInWorkspace then
        return;
    else
        local l_Instance_0 = v23.Instance;
        if v24.AddModelToInventory and v24.ShouldImport and v24.ImportAsPackage then
            local v26 = "rbxassetid://%d";
            v26 = if v6() then v26:format(v23.AssetIds[tostring(v24.Id)]) else v26:format(v23.AssetIds[v24.Id]);
            local l_status_0, l_result_0 = pcall(l_InsertService_0.LoadPackageAssetAsync, l_InsertService_0, v26);
            if not l_status_0 then
                error("Error trying to insert asset from import");
                return;
            else
                l_Instance_0 = l_result_0[1];
            end;
        end;
        if l_Instance_0 == nil then
            return;
        else
            l_InsertService_0:Insert(l_Instance_0);
            if not v24.InsertWithScenePosition then
                local v29 = v4();
                if l_Instance_0:IsA("Model") then
                    l_Instance_0:MoveTo(v29);
                elseif l_Instance_0:IsA("MeshPart") then
                    l_Instance_0.Position = v29;
                end;
            end;
            l_ChangeHistoryService_0:SetWaypoint("Insert imported asset");
            if not v7() then
                l_Selection_0:Set({
                    l_Instance_0
                });
                v22(game.Workspace.CurrentCamera, l_Instance_0);
            end;
            return;
        end;
    end;
end;
return function(v31, v32) --[[ Line: 87 ]]
    -- upvalues: v30 (copy)
    return function() --[[ Line: 88 ]]
        -- upvalues: v30 (ref), v31 (copy), v32 (copy)
        v30(v31, v32);
    end;
end;