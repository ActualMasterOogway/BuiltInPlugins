local l_Parent_0 = script.Parent.Parent.Parent;
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_StudioService_0 = game:GetService("StudioService");
local function v13(v5) --[[ Line: 9 ]] --[[ Name: getSelectedMeshes ]]
    local v6 = v5:getState();
    local l_recentAssets_0 = v6.AssetManagerReducer.recentAssets;
    local l_selectedAssets_0 = v6.AssetManagerReducer.selectedAssets;
    local v9 = {};
    local v10 = {};
    for _, v12 in pairs(l_recentAssets_0) do
        if l_selectedAssets_0[v12.key] and v12.assetType == Enum.AssetType.MeshPart then
            table.insert(v9, "Meshes/" .. v12.name);
            table.insert(v10, v12.id);
        end;
    end;
    return v9, v10;
end;
local function v29(v14, _, v16, v17, v18, v19) --[[ Line: 25 ]] --[[ Name: createImageContextMenu ]]
    -- upvalues: v13 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy)
    v17:AddNewAction("Insert", v18:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 26 ]]
        -- upvalues: v19 (copy), v13 (ref), l_AssetManagerService_0 (ref), v14 (copy)
        local v20 = v19:getState();
        local l_recentAssets_1 = v20.AssetManagerReducer.recentAssets;
        local l_selectedAssets_1 = v20.AssetManagerReducer.selectedAssets;
        local v23 = {};
        local v24 = {};
        local v25, v26 = v13(v19);
        v23 = v25;
        v24 = v26;
        if next(v23) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v23, v24);
        end;
        v25 = {};
        for _, v28 in pairs(l_recentAssets_1) do
            if l_selectedAssets_1[v28.key] and v28.assetType == Enum.AssetType.Image then
                table.insert(v25, v28.id);
            end;
        end;
        l_AssetManagerService_0:InsertImages(v25);
        v14:report("clickContextMenuItem");
    end);
    v17:AddNewAction("CopyIdToClipboard", v18:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 51 ]]
        -- upvalues: l_StudioService_0 (ref), v16 (copy), v14 (copy)
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v16.id);
        v14:report("clickContextMenuItem");
    end);
    v17:ShowAsync();
    v17:Destroy();
end;
local function v42(v30, v31, v32, v33, v34) --[[ Line: 60 ]] --[[ Name: createAudioContextMenu ]]
    -- upvalues: v13 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy)
    v32:AddNewAction("Insert", v33:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 61 ]]
        -- upvalues: v34 (copy), v13 (ref), l_AssetManagerService_0 (ref), v31 (copy), v30 (copy)
        local v35 = v34:getState();
        local _ = v35.AssetManagerReducer.recentAssets;
        local _ = v35.AssetManagerReducer.selectedAssets;
        local v38 = {};
        local v39 = {};
        local v40, v41 = v13(v34);
        v38 = v40;
        v39 = v41;
        if next(v38) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v38, v39);
        end;
        l_AssetManagerService_0:InsertAudio(v31.id, v31.name);
        v30:report("clickContextMenuItem");
    end);
    v32:AddNewAction("CopyIdToClipboard", v33:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 77 ]]
        -- upvalues: l_StudioService_0 (ref), v31 (copy), v30 (copy)
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v31.id);
        v30:report("clickContextMenuItem");
    end);
    v32:ShowAsync();
    v32:Destroy();
end;
local function v55(v43, v44, v45, v46, v47) --[[ Line: 86 ]] --[[ Name: createVideoContextMenu ]]
    -- upvalues: v13 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy)
    v45:AddNewAction("Insert", v46:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 87 ]]
        -- upvalues: v47 (copy), v13 (ref), l_AssetManagerService_0 (ref), v44 (copy), v43 (copy)
        local v48 = v47:getState();
        local _ = v48.AssetManagerReducer.recentAssets;
        local _ = v48.AssetManagerReducer.selectedAssets;
        local v51 = {};
        local v52 = {};
        local v53, v54 = v13(v47);
        v51 = v53;
        v52 = v54;
        if next(v51) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v51, v52);
        end;
        l_AssetManagerService_0:InsertVideo(v44.id, v44.name);
        v43:report("clickContextMenuItem");
    end);
    v45:AddNewAction("CopyIdToClipboard", v46:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 103 ]]
        -- upvalues: l_StudioService_0 (ref), v44 (copy), v43 (copy)
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v44.id);
        v43:report("clickContextMenuItem");
    end);
    v45:ShowAsync();
    v45:Destroy();
end;
local function v77(v56, _, v58, v59, v60, v61) --[[ Line: 112 ]] --[[ Name: createMeshPartContextMenu ]]
    -- upvalues: v13 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy)
    local v62 = v61:getState();
    local _ = v62.AssetManagerReducer.recentAssets;
    local _ = v62.AssetManagerReducer.selectedAssets;
    v59:AddNewAction("Insert", v60:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 117 ]]
        -- upvalues: v13 (ref), v61 (copy), l_AssetManagerService_0 (ref), v56 (copy)
        local v65 = {};
        local v66 = {};
        local v67, v68 = v13(v61);
        v65 = v67;
        v66 = v68;
        if next(v65) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v65, v66);
        end;
        v56:report("clickContextMenuItem");
    end);
    v59:AddNewAction("InsertWithLocation", v60:getText("ContextMenu", "InsertWithLocation")).Triggered:connect(function() --[[ Line: 128 ]]
        -- upvalues: v13 (ref), v61 (copy), l_AssetManagerService_0 (ref), v56 (copy), v62 (copy)
        local v69 = {};
        local v70 = {};
        local v71, v72 = v13(v61);
        v69 = v71;
        v70 = v72;
        if next(v69) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v69, v70);
        end;
        v56:report("clickContextMenuItem");
        v71 = v62.AssetManagerReducer.searchTerm;
        if utf8.len(v71) ~= 0 then
            v56:report("insertAfterSearch");
        end;
    end);
    local l_status_0, l_result_0 = pcall(l_AssetManagerService_0.GetMeshIdFromAliasName, l_AssetManagerService_0, "Meshes/" .. v58.name);
    local l_status_1, l_result_1 = pcall(l_AssetManagerService_0.GetTextureIdFromAliasName, l_AssetManagerService_0, "Meshes/" .. v58.name);
    if l_status_0 then
        v59:AddNewAction("CopyMeshIdToClipboard", v60:getText("ContextMenu", "CopyMeshIdToClipboard")).Triggered:connect(function() --[[ Line: 151 ]]
            -- upvalues: l_StudioService_0 (ref), l_result_0 (copy), v56 (copy)
            l_StudioService_0:CopyToClipboard(l_result_0);
            v56:report("clickContextMenuItem");
        end);
    else
        warn("Failed to get mesh id for asset id " .. v58.id);
    end;
    if l_status_1 then
        v59:AddNewAction("CopyTextureIdToClipboard", v60:getText("ContextMenu", "CopyTextureIdToClipboard")).Triggered:connect(function() --[[ Line: 163 ]]
            -- upvalues: l_StudioService_0 (ref), l_result_1 (copy), v56 (copy)
            l_StudioService_0:CopyToClipboard(l_result_1);
            v56:report("clickContextMenuItem");
        end);
    end;
    v59:ShowAsync();
    v59:Destroy();
end;
local function v92(v78, _, v80, v81, v82, v83) --[[ Line: 173 ]] --[[ Name: createModelContextMenu ]]
    -- upvalues: v13 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy)
    local _ = v83:getState();
    v81:AddNewAction("Insert", v82:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 175 ]]
        -- upvalues: v83 (copy), v13 (ref), l_AssetManagerService_0 (ref), v80 (copy), v78 (copy)
        local v85 = v83:getState();
        local _ = v85.AssetManagerReducer.recentAssets;
        local _ = v85.AssetManagerReducer.selectedAssets;
        local v88 = {};
        local v89 = {};
        local v90, v91 = v13(v83);
        v88 = v90;
        v89 = v91;
        if next(v88) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v88, v89);
        end;
        l_AssetManagerService_0:InsertModel(v80.id);
        v78:report("clickContextMenuItem");
    end);
    v81:AddNewAction("CopyIdToClipboard", v82:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 190 ]]
        -- upvalues: l_StudioService_0 (ref), v80 (copy), v78 (copy)
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v80.id);
        v78:report("clickContextMenuItem");
    end);
    v81:ShowAsync();
    v81:Destroy();
end;
local function v100(v93, v94, v95, v96, v97, v98) --[[ Line: 199 ]] --[[ Name: createAssetContextMenu ]]
    -- upvalues: v29 (copy), v77 (copy), l_enableAudioImport_0 (copy), v42 (copy), l_enableVideoImport_0 (copy), v55 (copy), v92 (copy)
    local l_assetType_0 = v95.assetType;
    if l_assetType_0 == Enum.AssetType.Image then
        v29(v93, v94, v95, v96, v97, v98);
        return;
    elseif l_assetType_0 == Enum.AssetType.MeshPart then
        v77(v93, v94, v95, v96, v97, v98);
        return;
    elseif l_enableAudioImport_0() and l_assetType_0 == Enum.AssetType.Audio then
        v42(v93, v95, v96, v97, v98);
        return;
    elseif l_enableVideoImport_0() and l_assetType_0 == Enum.AssetType.Video then
        v55(v93, v95, v96, v97, v98);
        return;
    else
        if l_assetType_0 == Enum.AssetType.Model then
            v92(v93, v94, v95, v96, v97, v98);
        end;
        return;
    end;
end;
return function(v101) --[[ Line: 214 ]]
    -- upvalues: v100 (copy)
    return function(v102) --[[ Line: 215 ]]
        -- upvalues: v101 (copy), v100 (ref)
        local l_Analytics_0 = v101.Analytics;
        local v104 = v101.API:get();
        local l_AssetData_0 = v101.AssetData;
        local l_Localization_0 = v101.Localization;
        local l_PluginMenu_0 = v101.Plugin:get():CreatePluginMenu("AssetManagerContextMenu");
        v100(l_Analytics_0, v104, l_AssetData_0, l_PluginMenu_0, l_Localization_0, v102);
    end;
end;