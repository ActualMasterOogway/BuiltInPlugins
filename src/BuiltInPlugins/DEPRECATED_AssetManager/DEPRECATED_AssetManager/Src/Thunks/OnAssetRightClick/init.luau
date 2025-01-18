local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetAssets);
local v2 = require(l_Parent_0.Src.Actions.SetEditingAssets);
local v3 = require(l_Parent_0.Src.Actions.SetScreen);
local v4 = require(l_Parent_0.Src.Actions.SetSelectedAssets);
local v5 = require(l_Parent_0.Src.Thunks.GetAssets);
local v6 = require(l_Parent_0.Src.Thunks.LaunchBulkImport);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local v9 = require(l_Parent_0.Src.Util.Screens);
local v10 = require(l_Parent_0.Src.Util.View);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_RunService_0 = game:GetService("RunService");
local l_StudioService_0 = game:GetService("StudioService");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local v17 = game:DefineFastFlag("AssetManagerInsertMeshCorrectly", false);
local function v25(v18, v19, v20, v21, v22) --[[ Line: 31 ]] --[[ Name: removeAssets ]]
    -- upvalues: l_AssetManagerService_0 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), v4 (copy), v1 (copy), v5 (copy)
    for _, v24 in pairs(v20) do
        if v21[v24.key] then
            if v24.assetType == Enum.AssetType.Place then
                l_AssetManagerService_0:RemovePlace(v24.id);
            elseif v24.assetType == Enum.AssetType.Image then
                l_AssetManagerService_0:DeleteAlias("Images/" .. v24.name);
            elseif v24.assetType == Enum.AssetType.MeshPart then
                l_AssetManagerService_0:DeleteAlias("Meshes/" .. v24.name);
            elseif l_enableAudioImport_0() and v24.assetType == Enum.AssetType.Audio then
                l_AssetManagerService_0:DeleteAlias("Audio/" .. v24.name);
            elseif l_enableVideoImport_0() and v24.assetType == Enum.AssetType.Video then
                l_AssetManagerService_0:DeleteAlias("Video/" .. v24.name);
            end;
        end;
    end;
    v22:dispatch(v4({}));
    v22:dispatch(v1({
        assets = {}
    }));
    v22:dispatch(v5(v18, v19.assetType));
end;
local function _(v26, v27, v28, v29, v30, v31) --[[ Line: 54 ]] --[[ Name: addRenameAliasContextItem ]]
    -- upvalues: v2 (copy)
    v26:AddNewAction("RenameAlias", v29:getText("ContextMenu", "RenameAlias")).Triggered:connect(function() --[[ Line: 57 ]]
        -- upvalues: v30 (copy), v28 (copy), v31 (copy), v2 (ref), v27 (copy)
        v30();
        local v32 = {
            [v28.id] = true
        };
        v31:dispatch(v2(v32));
        v27:report("clickContextMenuItem");
    end);
end;
local function v39(v34, v35, v36, v37, v38) --[[ Line: 66 ]] --[[ Name: addEditAssetContextItem ]]
    -- upvalues: l_RunService_0 (copy), l_MemStorageService_0 (copy), l_HttpService_0 (copy)
    if l_RunService_0:IsEdit() then
        v34:AddNewAction("EditAsset", v37:getText("ContextMenu", "EditAsset")).Triggered:connect(function() --[[ Line: 70 ]]
            -- upvalues: l_MemStorageService_0 (ref), l_HttpService_0 (ref), v36 (copy), v38 (copy), v35 (copy)
            l_MemStorageService_0:Fire("OpenAssetConfiguration", l_HttpService_0:JSONEncode({
                id = v36.id, 
                assetType = v38
            }));
            v35:report("clickContextMenuItem");
        end);
    end;
end;
local function v50(v40, v41, v42, v43, v44, v45, v46, v47) --[[ Line: 79 ]] --[[ Name: addRemoveFromGameContextItem ]]
    -- upvalues: v25 (copy)
    local l_assets_0 = v47.AssetManagerReducer.assetsTable.assets;
    local l_selectedAssets_0 = v47.AssetManagerReducer.selectedAssets;
    v40:AddNewAction("RemoveFromGame", v44:getText("ContextMenu", "RemoveFromGame")).Triggered:connect(function() --[[ Line: 93 ]]
        -- upvalues: v25 (ref), v41 (copy), v43 (copy), l_assets_0 (copy), l_selectedAssets_0 (copy), v46 (copy), v45 (copy), v42 (copy)
        v25(v41, v43, l_assets_0, l_selectedAssets_0, v46);
        v45();
        v42:report("clickContextMenuItem");
    end);
end;
local function v59(v51, v52, v53, v54, v55, v56) --[[ Line: 100 ]] --[[ Name: createFolderContextMenu ]]
    -- upvalues: v3 (copy), v9 (copy), v6 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), l_AssetManagerService_0 (copy), v1 (copy), v5 (copy)
    v54:AddNewAction("OpenFolder", v55:getText("ContextMenu", "OpenFolder")).Triggered:connect(function() --[[ Line: 103 ]]
        -- upvalues: v56 (copy), v3 (ref), v53 (copy), v51 (copy)
        v56:dispatch(v3(v53.Screen));
        v51:report("clickContextMenuItem");
    end);
    if v53.Screen.Path == v9.IMAGES.Path then
        v54:AddNewAction("AddImages", v55:getText("ContextMenu", "AddImages")).Triggered:connect(function() --[[ Line: 110 ]]
            -- upvalues: v56 (copy), v6 (ref), v51 (copy)
            v56:dispatch(v6(Enum.AssetType.Image.Value));
            v51:report("clickContextMenuItem");
        end);
    elseif l_enableAudioImport_0() and v53.Screen.Path == v9.AUDIO.Path then
        v54:AddNewAction("AddAudio", v55:getText("ContextMenu", "AddAudio")).Triggered:connect(function() --[[ Line: 117 ]]
            -- upvalues: v56 (copy), v6 (ref), v51 (copy)
            v56:dispatch(v6(Enum.AssetType.Audio.Value));
            v51:report("clickContextMenuItem");
        end);
    elseif l_enableVideoImport_0() and v53.Screen.Path == v9.VIDEO.Path then
        v54:AddNewAction("AddVideo", v55:getText("ContextMenu", "AddVideo")).Triggered:connect(function() --[[ Line: 124 ]]
            -- upvalues: v56 (copy), v6 (ref), v51 (copy)
            v56:dispatch(v6(Enum.AssetType.Video.Value));
            v51:report("clickContextMenuItem");
        end);
    elseif v53.Screen.Path == v9.MESHES.Path then
        v54:AddNewAction("AddMeshes", v55:getText("ContextMenu", "AddMeshes")).Triggered:connect(function() --[[ Line: 131 ]]
            -- upvalues: v56 (copy), v6 (ref), v51 (copy)
            v56:dispatch(v6(Enum.AssetType.MeshPart.Value));
            v51:report("clickContextMenuItem");
        end);
    elseif v53.Screen.Path == v9.PLACES.Path then
        v54:AddNewAction("AddPlace", v55:getText("ContextMenu", "AddNewPlace")).Triggered:connect(function() --[[ Line: 138 ]]
            -- upvalues: l_AssetManagerService_0 (ref), v56 (copy), v1 (ref), v9 (ref), v5 (ref), v52 (copy), v3 (ref), v51 (copy)
            local _, v58 = l_AssetManagerService_0:AddNewPlace();
            if v58 then
                error(v58);
                return;
            else
                v56:dispatch(v1({
                    assets = {}
                }));
                if v56:getState().Screen.currentScreen.Path == v9.PLACES.Path then
                    v56:dispatch(v5(v52, v9.PLACES.AssetType));
                else
                    v56:dispatch(v3(v9.PLACES));
                end;
                v51:report("clickContextMenuItem");
                return;
            end;
        end);
    end;
    v54:ShowAsync();
    v54:Destroy();
end;
local function _(v60, v61, v62, v63, v64, v65, v66) --[[ Line: 161 ]] --[[ Name: DEPRECATED_createPlaceContextMenu ]]
    -- upvalues: v2 (copy), l_StudioService_0 (copy), v25 (copy)
    local v67 = v66:getState();
    local l_assets_1 = v67.AssetManagerReducer.assetsTable.assets;
    local l_selectedAssets_1 = v67.AssetManagerReducer.selectedAssets;
    v63:AddNewAction("Rename", v64:getText("ContextMenu", "Rename")).Triggered:connect(function() --[[ Line: 173 ]]
        -- upvalues: v65 (copy), v62 (copy), v66 (copy), v2 (ref), v60 (copy)
        v65();
        local v70 = {
            [v62.id] = true
        };
        v66:dispatch(v2(v70));
        v60:report("clickContextMenuItem");
    end);
    v63:AddNewAction("CopyIdToClipboard", v64:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 183 ]]
        -- upvalues: l_StudioService_0 (ref), v62 (copy), v60 (copy)
        l_StudioService_0:CopyToClipboard(v62.id);
        v60:report("clickContextMenuItem");
    end);
    v63:AddNewAction("ViewPlaceHistory", v64:getText("ContextMenu", "ViewPlaceHistory")).Triggered:connect(function() --[[ Line: 189 ]]
        -- upvalues: l_StudioService_0 (ref), v62 (copy), v60 (copy)
        l_StudioService_0:ShowPlaceVersionHistoryDialog(v62.id);
        v60:report("clickContextMenuItem");
    end);
    if not v62.isRootPlace then
        v63:AddNewAction("RemoveFromGame", v64:getText("ContextMenu", "RemoveFromGame")).Triggered:connect(function() --[[ Line: 196 ]]
            -- upvalues: v25 (ref), v61 (copy), v62 (copy), l_assets_1 (copy), l_selectedAssets_1 (copy), v66 (copy), v60 (copy)
            v25(v61, v62, l_assets_1, l_selectedAssets_1, v66);
            v60:report("clickContextMenuItem");
        end);
    end;
    v63:ShowAsync();
    v63:Destroy();
end;
local function v84(v72, v73, v74, v75, v76, v77, v78, v79) --[[ Line: 206 ]] --[[ Name: createPlaceContextMenu ]]
    -- upvalues: v2 (copy), l_StudioService_0 (copy), l_MemStorageService_0 (copy), v25 (copy)
    local v80 = v79:getState();
    local l_assets_2 = v80.AssetManagerReducer.assetsTable.assets;
    local l_selectedAssets_2 = v80.AssetManagerReducer.selectedAssets;
    v75:AddNewAction("Rename", v76:getText("ContextMenu", "Rename")).Triggered:connect(function() --[[ Line: 219 ]]
        -- upvalues: v77 (copy), v74 (copy), v79 (copy), v2 (ref), v72 (copy)
        v77();
        local v83 = {
            [v74.id] = true
        };
        v79:dispatch(v2(v83));
        v72:report("clickContextMenuItem");
    end);
    v75:AddNewAction("CopyIdToClipboard", v76:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 229 ]]
        -- upvalues: l_StudioService_0 (ref), v74 (copy), v72 (copy)
        l_StudioService_0:CopyToClipboard(v74.id);
        v72:report("clickContextMenuItem");
    end);
    v75:AddNewAction("ViewPlaceHistory", v76:getText("ContextMenu", "ViewPlaceHistory")).Triggered:connect(function() --[[ Line: 235 ]]
        -- upvalues: l_StudioService_0 (ref), v74 (copy), v72 (copy)
        l_StudioService_0:ShowPlaceVersionHistoryDialog(v74.id);
        v72:report("clickContextMenuItem");
    end);
    if not v74.isRootPlace then
        v75:AddNewAction("RemoveFromGame", v76:getText("ContextMenu", "RemoveFromGame")).Triggered:connect(function() --[[ Line: 242 ]]
            -- upvalues: v78 (copy), l_MemStorageService_0 (ref), v25 (ref), v73 (copy), v74 (copy), l_assets_2 (copy), l_selectedAssets_2 (copy), v79 (copy), v72 (copy)
            v78();
            l_MemStorageService_0:Bind("RemovePlaceConfirmed", function() --[[ Line: 244 ]]
                -- upvalues: v25 (ref), v73 (ref), v74 (ref), l_assets_2 (ref), l_selectedAssets_2 (ref), v79 (ref)
                v25(v73, v74, l_assets_2, l_selectedAssets_2, v79);
            end);
            v72:report("clickContextMenuItem");
        end);
    end;
    v75:ShowAsync();
    v75:Destroy();
end;
local function v95(v85, v86, v87, v88, v89, v90, v91) --[[ Line: 255 ]] --[[ Name: createPackageContextMenu ]]
    -- upvalues: v10 (copy), v4 (copy), l_RunService_0 (copy), l_AssetManagerService_0 (copy), l_NewPackageAnalyticsWithRefactor2_0 (copy), l_StudioService_0 (copy)
    local l_view_0 = v91:getState().AssetManagerReducer.view;
    local v93 = true;
    if v86.action ~= "Edit" then
        v93 = v86.action == "Own";
    end;
    if l_view_0.Key == v10.LIST.Key and not v88 then
        v87:AddNewAction("AssetPreview", v89:getText("ContextMenu", "AssetPreview")).Triggered:connect(function() --[[ Line: 270 ]]
            -- upvalues: v91 (copy), v4 (ref), v86 (copy), v90 (copy)
            v91:dispatch(v4({
                [v86.key] = true
            }));
            v90(v86);
        end);
    end;
    if l_RunService_0:IsEdit() then
        v87:AddNewAction("Insert", v89:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 277 ]]
            -- upvalues: l_AssetManagerService_0 (ref), v86 (copy), v85 (copy), v91 (copy)
            l_AssetManagerService_0:InsertPackage(v86.id);
            v85:report("clickContextMenuItem");
            local l_searchTerm_0 = v91:getState().AssetManagerReducer.searchTerm;
            if utf8.len(l_searchTerm_0) ~= 0 then
                v85:report("insertAfterSearch");
            end;
        end);
    end;
    if l_RunService_0:IsEdit() then
        v87:AddNewAction("UpdateAll", v89:getText("ContextMenu", "UpdateAll")).Triggered:connect(function() --[[ Line: 290 ]]
            -- upvalues: l_AssetManagerService_0 (ref), v86 (copy), v85 (copy), l_NewPackageAnalyticsWithRefactor2_0 (ref)
            l_AssetManagerService_0:UpdateAllPackages(v86.id);
            v85:report("clickContextMenuItem");
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v85:report("massUpdateFromAssetManager");
            end;
        end);
    end;
    v87:AddNewAction("ViewOnWebsite", v89:getText("ContextMenu", "ViewOnWebsite")).Triggered:connect(function() --[[ Line: 300 ]]
        -- upvalues: l_AssetManagerService_0 (ref), v86 (copy), v85 (copy)
        l_AssetManagerService_0:ViewPackageOnWebsite(v86.id);
        v85:report("clickContextMenuItem");
    end);
    v87:AddNewAction("CopyIdToClipboard", v89:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 306 ]]
        -- upvalues: l_StudioService_0 (ref), v86 (copy), v85 (copy)
        l_StudioService_0:CopyToClipboard(v86.id);
        v85:report("clickContextMenuItem");
    end);
    if l_RunService_0:IsEdit() and v93 then
        v87:AddNewAction("PackageDetails", v89:getText("ContextMenu", "PackageDetails")).Triggered:connect(function() --[[ Line: 313 ]]
            -- upvalues: l_AssetManagerService_0 (ref), v86 (copy), v85 (copy)
            l_AssetManagerService_0:ShowPackageDetails(v86.id);
            v85:report("clickContextMenuItem");
        end);
    end;
    v87:ShowAsync();
    v87:Destroy();
end;
local function v113(v96, v97, v98, v99, v100, v101, v102, v103, v104) --[[ Line: 323 ]] --[[ Name: createImageContextMenu ]]
    -- upvalues: v10 (copy), v4 (copy), v39 (copy), v2 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy), v50 (copy)
    local v105 = v104:getState();
    if v105.AssetManagerReducer.view.Key == v10.LIST.Key and not v100 then
        v99:AddNewAction("AssetPreview", v101:getText("ContextMenu", "AssetPreview")).Triggered:connect(function() --[[ Line: 339 ]]
            -- upvalues: v104 (copy), v4 (ref), v98 (copy), v102 (copy)
            v104:dispatch(v4({
                [v98.key] = true
            }));
            v102(v98);
        end);
    end;
    v39(v99, v96, v98, v101, Enum.AssetType.Image.Value);
    v99:AddNewAction("RenameAlias", v101:getText("ContextMenu", "RenameAlias")).Triggered:connect(function() --[[ Line: 57 ]]
        -- upvalues: v103 (copy), v98 (copy), v104 (copy), v2 (ref), v96 (copy)
        v103();
        local v106 = {
            [v98.id] = true
        };
        v104:dispatch(v2(v106));
        v96:report("clickContextMenuItem");
    end);
    v99:AddNewAction("Insert", v101:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 347 ]]
        -- upvalues: v105 (copy), l_AssetManagerService_0 (ref), v98 (copy), v96 (copy)
        local l_assets_3 = v105.AssetManagerReducer.assetsTable.assets;
        local l_selectedAssets_3 = v105.AssetManagerReducer.selectedAssets;
        if #l_selectedAssets_3 == 1 then
            l_AssetManagerService_0:InsertImage(v98.id);
        else
            local v109 = {};
            for _, v111 in pairs(l_assets_3) do
                if l_selectedAssets_3[v111.layoutOrder] then
                    table.insert(v109, v111.id);
                end;
            end;
            l_AssetManagerService_0:InsertImages(v109);
        end;
        v96:report("clickContextMenuItem");
        local l_searchTerm_1 = v105.AssetManagerReducer.searchTerm;
        if utf8.len(l_searchTerm_1) ~= 0 then
            v96:report("insertAfterSearch");
        end;
    end);
    v99:AddNewAction("CopyIdToClipboard", v101:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 372 ]]
        -- upvalues: l_StudioService_0 (ref), v98 (copy), v96 (copy)
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v98.id);
        v96:report("clickContextMenuItem");
    end);
    v50(v99, v97, v96, v98, v101, v103, v104, v105);
    v99:ShowAsync();
    v99:Destroy();
end;
local function v126(v114, v115, v116, v117, v118, v119, v120, v121, v122) --[[ Line: 391 ]] --[[ Name: createAudioContextMenu ]]
    -- upvalues: v10 (copy), v39 (copy), v2 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy), v50 (copy)
    local v123 = v122:getState();
    if v123.AssetManagerReducer.view.Key == v10.LIST.Key and not v118 then
        v117:AddNewAction("AssetPreview", v119:getText("ContextMenu", "AssetPreview")).Triggered:connect(function() --[[ Line: 407 ]]
            -- upvalues: v120 (copy), v116 (copy)
            v120(v116);
        end);
    end;
    v39(v117, v114, v116, v119, Enum.AssetType.Audio.Value);
    v117:AddNewAction("RenameAlias", v119:getText("ContextMenu", "RenameAlias")).Triggered:connect(function() --[[ Line: 57 ]]
        -- upvalues: v121 (copy), v116 (copy), v122 (copy), v2 (ref), v114 (copy)
        v121();
        local v124 = {
            [v116.id] = true
        };
        v122:dispatch(v2(v124));
        v114:report("clickContextMenuItem");
    end);
    v117:AddNewAction("Insert", v119:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 413 ]]
        -- upvalues: l_AssetManagerService_0 (ref), v116 (copy), v114 (copy), v123 (copy)
        l_AssetManagerService_0:InsertAudio(v116.id, v116.name);
        v114:report("clickContextMenuItem");
        local l_searchTerm_2 = v123.AssetManagerReducer.searchTerm;
        if utf8.len(l_searchTerm_2) ~= 0 then
            v114:report("insertAfterSearch");
        end;
    end);
    v117:AddNewAction("CopyIdToClipboard", v119:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 423 ]]
        -- upvalues: l_StudioService_0 (ref), v116 (copy), v114 (copy)
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v116.id);
        v114:report("clickContextMenuItem");
    end);
    v50(v117, v115, v114, v116, v119, v121, v122, v123);
    v117:ShowAsync();
    v117:Destroy();
end;
local function v139(v127, v128, v129, v130, v131, v132, v133, v134, v135) --[[ Line: 441 ]] --[[ Name: createVideoContextMenu ]]
    -- upvalues: v10 (copy), v39 (copy), v2 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy), v50 (copy)
    local v136 = v135:getState();
    if v136.AssetManagerReducer.view.Key == v10.LIST.Key and not v131 then
        v130:AddNewAction("AssetPreview", v132:getText("ContextMenu", "AssetPreview")).Triggered:connect(function() --[[ Line: 457 ]]
            -- upvalues: v133 (copy), v129 (copy)
            v133(v129);
        end);
    end;
    v39(v130, v127, v129, v132, Enum.AssetType.Video.Value);
    v130:AddNewAction("RenameAlias", v132:getText("ContextMenu", "RenameAlias")).Triggered:connect(function() --[[ Line: 57 ]]
        -- upvalues: v134 (copy), v129 (copy), v135 (copy), v2 (ref), v127 (copy)
        v134();
        local v137 = {
            [v129.id] = true
        };
        v135:dispatch(v2(v137));
        v127:report("clickContextMenuItem");
    end);
    v130:AddNewAction("Insert", v132:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 463 ]]
        -- upvalues: l_AssetManagerService_0 (ref), v129 (copy), v127 (copy), v136 (copy)
        l_AssetManagerService_0:InsertVideo(v129.id, v129.name);
        v127:report("clickContextMenuItem");
        local l_searchTerm_3 = v136.AssetManagerReducer.searchTerm;
        if utf8.len(l_searchTerm_3) ~= 0 then
            v127:report("insertAfterSearch");
        end;
    end);
    v130:AddNewAction("CopyIdToClipboard", v132:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 473 ]]
        -- upvalues: l_StudioService_0 (ref), v129 (copy), v127 (copy)
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v129.id);
        v127:report("clickContextMenuItem");
    end);
    v50(v130, v128, v127, v129, v132, v134, v135, v136);
    v130:ShowAsync();
    v130:Destroy();
end;
local function v166(v140, v141, v142, v143, v144, v145, v146, v147, v148) --[[ Line: 491 ]] --[[ Name: createMeshPartContextMenu ]]
    -- upvalues: v10 (copy), v4 (copy), v39 (copy), v2 (copy), l_AssetManagerService_0 (copy), v17 (copy), l_StudioService_0 (copy), v50 (copy)
    local v149 = v148:getState();
    local l_assets_4 = v149.AssetManagerReducer.assetsTable.assets;
    local l_selectedAssets_4 = v149.AssetManagerReducer.selectedAssets;
    local v152 = 0;
    for _, _ in pairs(l_selectedAssets_4) do
        v152 = v152 + 1;
    end;
    if v149.AssetManagerReducer.view.Key == v10.LIST.Key and not v144 then
        v143:AddNewAction("AssetPreview", v145:getText("ContextMenu", "AssetPreview")).Triggered:connect(function() --[[ Line: 514 ]]
            -- upvalues: v148 (copy), v4 (ref), v142 (copy), v146 (copy)
            v148:dispatch(v4({
                [v142.key] = true
            }));
            v146(v142);
        end);
    end;
    v39(v143, v140, v142, v145, Enum.AssetType.MeshPart.Value);
    v143:AddNewAction("RenameAlias", v145:getText("ContextMenu", "RenameAlias")).Triggered:connect(function() --[[ Line: 57 ]]
        -- upvalues: v147 (copy), v142 (copy), v148 (copy), v2 (ref), v140 (copy)
        v147();
        local v155 = {
            [v142.id] = true
        };
        v148:dispatch(v2(v155));
        v140:report("clickContextMenuItem");
    end);
    if v152 == 1 then
        v143:AddNewAction("Insert", v145:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 523 ]]
            -- upvalues: l_AssetManagerService_0 (ref), v142 (copy), v140 (copy), v149 (copy)
            l_AssetManagerService_0:InsertMesh("Meshes/" .. v142.name, false, v142.id);
            v140:report("clickContextMenuItem");
            local l_searchTerm_4 = v149.AssetManagerReducer.searchTerm;
            if utf8.len(l_searchTerm_4) ~= 0 then
                v140:report("insertAfterSearch");
            end;
        end);
    end;
    v143:AddNewAction("InsertWithLocation", v145:getText("ContextMenu", "InsertWithLocation")).Triggered:connect(function() --[[ Line: 534 ]]
        -- upvalues: v152 (ref), v17 (ref), l_AssetManagerService_0 (ref), v142 (copy), l_assets_4 (copy), l_selectedAssets_4 (copy), v140 (copy), v149 (copy)
        if v152 == 1 then
            if v17 then
                l_AssetManagerService_0:InsertMesh("Meshes/" .. v142.name, true, v142.id);
            else
                l_AssetManagerService_0:InsertMesh("Meshes/" .. v142.name, false, v142.id);
            end;
        else
            local v157 = {};
            local v158 = {};
            for _, v160 in pairs(l_assets_4) do
                if l_selectedAssets_4[v160.layoutOrder] then
                    table.insert(v157, "Meshes/" .. v160.name);
                    table.insert(v158, v160.id);
                end;
            end;
            l_AssetManagerService_0:InsertMeshesWithLocation(v157, v158);
        end;
        v140:report("clickContextMenuItem");
        local l_searchTerm_5 = v149.AssetManagerReducer.searchTerm;
        if utf8.len(l_searchTerm_5) ~= 0 then
            v140:report("insertAfterSearch");
        end;
    end);
    local l_status_0, l_result_0 = pcall(l_AssetManagerService_0.GetMeshIdFromAliasName, l_AssetManagerService_0, "Meshes/" .. v142.name);
    local l_status_1, l_result_1 = pcall(l_AssetManagerService_0.GetTextureIdFromAliasName, l_AssetManagerService_0, "Meshes/" .. v142.name);
    if l_status_0 then
        v143:AddNewAction("CopyMeshIdToClipboard", v145:getText("ContextMenu", "CopyMeshIdToClipboard")).Triggered:connect(function() --[[ Line: 568 ]]
            -- upvalues: l_StudioService_0 (ref), l_result_0 (copy), v140 (copy)
            l_StudioService_0:CopyToClipboard(l_result_0);
            v140:report("clickContextMenuItem");
        end);
    else
        warn("Failed to get mesh id for asset id " .. v142.id);
    end;
    if l_status_1 then
        v143:AddNewAction("CopyTextureIdToClipboard", v145:getText("ContextMenu", "CopyTextureIdToClipboard")).Triggered:connect(function() --[[ Line: 580 ]]
            -- upvalues: l_StudioService_0 (ref), l_result_1 (copy), v140 (copy)
            l_StudioService_0:CopyToClipboard(l_result_1);
            v140:report("clickContextMenuItem");
        end);
    end;
    v50(v143, v141, v140, v142, v145, v147, v148, v149);
    v143:ShowAsync();
    v143:Destroy();
end;
local function v179(v167, v168, v169, v170, v171, v172, v173, v174, v175) --[[ Line: 601 ]] --[[ Name: createModelContextMenu ]]
    -- upvalues: v10 (copy), v4 (copy), v39 (copy), v2 (copy), l_AssetManagerService_0 (copy), l_StudioService_0 (copy), v50 (copy)
    local v176 = v175:getState();
    if v176.AssetManagerReducer.view.Key == v10.LIST.Key and not v171 then
        v170:AddNewAction("AssetPreview", v172:getText("ContextMenu", "AssetPreview")).Triggered:connect(function() --[[ Line: 617 ]]
            -- upvalues: v175 (copy), v4 (ref), v169 (copy), v173 (copy)
            v175:dispatch(v4({
                [v169.key] = true
            }));
            v173(v169);
        end);
    end;
    v39(v170, v167, v169, v172, Enum.AssetType.Model.Value);
    v170:AddNewAction("RenameAlias", v172:getText("ContextMenu", "RenameAlias")).Triggered:connect(function() --[[ Line: 57 ]]
        -- upvalues: v174 (copy), v169 (copy), v175 (copy), v2 (ref), v167 (copy)
        v174();
        local v177 = {
            [v169.id] = true
        };
        v175:dispatch(v2(v177));
        v167:report("clickContextMenuItem");
    end);
    v170:AddNewAction("Insert", v172:getText("ContextMenu", "Insert")).Triggered:connect(function() --[[ Line: 625 ]]
        -- upvalues: v167 (copy), l_AssetManagerService_0 (ref), v169 (copy), v176 (copy)
        v167:report("clickContextMenuItem");
        l_AssetManagerService_0:InsertModel(v169.id);
        local l_searchTerm_6 = v176.AssetManagerReducer.searchTerm;
        if utf8.len(l_searchTerm_6) ~= 0 then
            v167:report("insertAfterSearch");
        end;
    end);
    v170:AddNewAction("CopyIdToClipboard", v172:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function() --[[ Line: 635 ]]
        -- upvalues: l_StudioService_0 (ref), v169 (copy), v167 (copy)
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v169.id);
        v167:report("clickContextMenuItem");
    end);
    v50(v170, v168, v167, v169, v172, v174, v175, v176);
    v170:ShowAsync();
    v170:Destroy();
end;
local function v191(v180, v181, v182, v183, v184, v185, v186, v187, v188, v189) --[[ Line: 654 ]] --[[ Name: createAssetContextMenu ]]
    -- upvalues: v84 (copy), v95 (copy), v113 (copy), v166 (copy), l_enableAudioImport_0 (copy), v126 (copy), l_enableVideoImport_0 (copy), v139 (copy), v179 (copy)
    local l_assetType_0 = v182.assetType;
    if l_assetType_0 == Enum.AssetType.Place then
        v84(v180, v181, v182, v183, v185, v187, v188, v189);
        return;
    elseif l_assetType_0 == Enum.AssetType.Package then
        v95(v180, v182, v183, v184, v185, v186, v189);
        return;
    elseif l_assetType_0 == Enum.AssetType.Image then
        v113(v180, v181, v182, v183, v184, v185, v186, v187, v189);
        return;
    elseif l_assetType_0 == Enum.AssetType.MeshPart then
        v166(v180, v181, v182, v183, v184, v185, v186, v187, v189);
        return;
    elseif l_enableAudioImport_0() and l_assetType_0 == Enum.AssetType.Audio then
        v126(v180, v181, v182, v183, v184, v185, v186, v187, v189);
        return;
    elseif l_enableVideoImport_0() and l_assetType_0 == Enum.AssetType.Video then
        v139(v180, v181, v182, v183, v184, v185, v186, v187, v189);
        return;
    else
        if l_assetType_0 == Enum.AssetType.Model then
            v179(v180, v181, v182, v183, v184, v185, v186, v187, v189);
        end;
        return;
    end;
end;
return function(v192) --[[ Line: 751 ]]
    -- upvalues: v59 (copy), v191 (copy)
    return function(v193) --[[ Line: 752 ]]
        -- upvalues: v192 (copy), v59 (ref), v191 (ref)
        local l_Analytics_0 = v192.Analytics;
        local v195 = v192.API:get();
        local l_AssetData_0 = v192.AssetData;
        local l_IsAssetPreviewMenu_0 = v192.IsAssetPreviewMenu;
        local l_Localization_0 = v192.Localization;
        local v199 = v192.Plugin:get();
        local l_OnOpenAssetPreview_0 = v192.OnOpenAssetPreview;
        local l_OnAssetPreviewClose_0 = v192.OnAssetPreviewClose;
        local l_OnOpenConfirmRemovePlaceDialog_0 = v192.OnOpenConfirmRemovePlaceDialog;
        local l_v199_PluginMenu_0 = v199:CreatePluginMenu("AssetManagerContextMenu");
        if l_AssetData_0.ClassName == "Folder" then
            v59(l_Analytics_0, v195, l_AssetData_0, l_v199_PluginMenu_0, l_Localization_0, v193);
            return;
        else
            v191(l_Analytics_0, v195, l_AssetData_0, l_v199_PluginMenu_0, l_IsAssetPreviewMenu_0, l_Localization_0, l_OnOpenAssetPreview_0, l_OnAssetPreviewClose_0, l_OnOpenConfirmRemovePlaceDialog_0, v193);
            return;
        end;
    end;
end;