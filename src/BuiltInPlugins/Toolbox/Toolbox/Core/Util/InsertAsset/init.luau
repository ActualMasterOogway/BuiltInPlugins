local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
local v3 = require(l_Parent_0.Core.Util.InsertToolPromise);
local _ = require(l_Parent_0.Core.Util.isCli);
local _ = require(l_Parent_0.Core.Networking.NetworkInterface);
local v6 = require(l_Parent_0.Core.Util.Urls);
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v9 = require(l_Parent_0.Core.Types.Category);
local v10 = require(l_Parent_0.Core.Types.AssetSubTypes);
local l_webKeys_0 = require(l_Parent_0.Core.Util.Permissions.Constants).webKeys;
local l_ToolboxEnableAudioGrantDialog_0 = game:GetFastFlag("ToolboxEnableAudioGrantDialog");
local v13 = game:DefineFastFlag("ToolboxUnifyModelPackageInsertion2", false);
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxDeleteTempModelFix_0 = game:GetFastFlag("ToolboxDeleteTempModelFix");
local l_ToolboxVideoUsePermissionInsertion_0 = game:GetFastFlag("ToolboxVideoUsePermissionInsertion");
local l_ToolboxVideoTestUseLocalAudioFile_0 = game:GetFastFlag("ToolboxVideoTestUseLocalAudioFile");
local l_game_FastInt_0 = game:GetFastInt("ToolboxYieldInsertPerInstanceModulus");
local l_ToolboxLogInsertDuration_0 = game:GetFastFlag("ToolboxLogInsertDuration");
local l_ToolboxYieldWhenInserting_0 = game:GetFastFlag("ToolboxYieldWhenInserting");
local v22 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxGrantUponInsertion);
local v23 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableWebView);
local v24 = require(l_Parent_0.Core.Util.ToolboxCommunication);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_InsertService_0 = game:GetService("InsertService");
local l_Selection_0 = game:GetService("Selection");
local l_StarterPack_0 = game:GetService("StarterPack");
local l_Workspace_0 = game:GetService("Workspace");
local l_StudioService_0 = game:GetService("StudioService");
local l_Lighting_0 = game:GetService("Lighting");
local l_MaterialService_0 = game:GetService("MaterialService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v34 = {
    [Enum.RibbonTool.Move] = true, 
    [Enum.RibbonTool.Rotate] = true, 
    [Enum.RibbonTool.Scale] = true, 
    [Enum.RibbonTool.Select] = true
};
local v35 = if v22() then {
    [Enum.AssetType.Model.Value] = true, 
    [Enum.AssetType.Decal.Value] = true, 
    [Enum.AssetType.MeshPart.Value] = true
} else nil;
local function _(v36) --[[ Line: 64 ]] --[[ Name: maybeYieldDuringInsert ]]
    -- upvalues: l_game_FastInt_0 (copy)
    if l_game_FastInt_0 == 0 then
        return;
    else
        if v36 > 1 and (v36 - 1) % l_game_FastInt_0 == 0 then
            task.wait();
        end;
        return;
    end;
end;
local function v44() --[[ Line: 76 ]] --[[ Name: getInsertPosition ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    local v39 = l_CurrentCamera_0.ViewportSize / 2;
    local v40 = l_CurrentCamera_0:ViewportPointToRay(v39.X, v39.Y, 0);
    local v41 = Ray.new(v40.Origin, v40.Direction * 2048);
    local v42 = RaycastParams.new();
    v42.BruteForceAllSlow = true;
    local v43 = l_Workspace_0:Raycast(v41.Origin, v41.Direction, v42);
    if v43 then
        return v43.Position;
    else
        return l_CurrentCamera_0.CFrame.p + v40.Direction * 64;
    end;
end;
local function v49(v45, v46) --[[ Line: 92 ]] --[[ Name: insertSourceAssetIdInChildren ]]
    -- upvalues: l_ToolboxYieldWhenInserting_0 (copy), l_game_FastInt_0 (copy)
    if v45 and v46 and v45:IsA("Folder") then
        for v47, v48 in ipairs(v45:GetChildren()) do
            if l_ToolboxYieldWhenInserting_0 and l_game_FastInt_0 ~= 0 and v47 > 1 and (v47 - 1) % l_game_FastInt_0 == 0 then
                task.wait();
            end;
            if v48:IsA("Model") then
                v48.SourceAssetId = v46;
            end;
        end;
    end;
end;
local function v53(v50, v51) --[[ Line: 105 ]] --[[ Name: grantAssetPermission ]]
    -- upvalues: l_webKeys_0 (copy)
    if game.GameId == 0 then
        return;
    else
        return v51:grantAssetPermissionWithTimeout(v50, {
            requests = {
                {
                    action = l_webKeys_0.UseAction, 
                    subjectId = game.GameId, 
                    subjectType = l_webKeys_0.Universe
                }
            }
        }):catch(function(v52) --[[ Line: 121 ]]
            return v52;
        end):await();
    end;
end;
local function v61(v54, v55, v56, v57, v58, v59) --[[ Line: 127 ]] --[[ Name: doPermissionGrantDialogForAsset ]]
    -- upvalues: l_MarketplaceService_0 (copy), v53 (copy)
    if game.GameId == 0 then
        return;
    elseif not v57 then
        return;
    elseif l_MarketplaceService_0:GetProductInfo(v55, Enum.InfoType.Asset).IsPublicDomain then
        return;
    else
        if v56 ~= Enum.AssetType.Audio.Value then
            error("Only support for fetching permissions on Audio is implemented at this time.");
        end;
        if v57:promptPermissionsGrantAndWait({
            assetName = v54, 
            assetId = v55, 
            assetType = v58:getText("General", "AssetTypeAudio")
        }) then
            local v60 = v53(v55, v59);
            if v60 ~= nil and v60.Body ~= nil and v60.Body.Error ~= nil and v60.Body.Error.Code ~= nil and v60.Body.Error.Code ~= 4 then
                warn(v58:getText("GrantAssetPermission", "Failure", {
                    assetId = v55
                }));
                return;
            else
                print(v58:getText("GrantAssetPermission", "Success", {
                    assetId = v55
                }));
            end;
        end;
        return;
    end;
end;
local function v69(v62, v63, v64, v65, v66) --[[ Line: 177 ]] --[[ Name: insertAudio ]]
    -- upvalues: v6 (copy), v2 (copy), v53 (copy), l_Selection_0 (copy), l_Workspace_0 (copy), l_ToolboxEnableAudioGrantDialog_0 (copy), v61 (copy)
    local v67 = v6.constructAssetIdString(v62);
    if v2.shouldDebugUrls() then
        print(("Inserting sound %s"):format(v67));
    end;
    v53(v62, v66);
    local l_Sound_0 = Instance.new("Sound");
    l_Sound_0.SourceAssetId = v62;
    l_Sound_0.SoundId = v67;
    l_Sound_0.Name = v63;
    l_Sound_0.Parent = (l_Selection_0:Get() or {})[1] or l_Workspace_0;
    l_Selection_0:Set({
        l_Sound_0
    });
    if l_ToolboxEnableAudioGrantDialog_0 then
        v61(v63, v62, Enum.AssetType.Audio.Value, v64, v65, v66);
    end;
    return l_Sound_0;
end;
local function v77(v70, v71, v72) --[[ Line: 208 ]] --[[ Name: sanitizeMeshAsset ]]
    -- upvalues: l_ToolboxYieldWhenInserting_0 (copy), l_game_FastInt_0 (copy), v1 (copy)
    local v73 = false;
    local v74 = {};
    for v75, v76 in ipairs(v71) do
        if l_ToolboxYieldWhenInserting_0 and l_game_FastInt_0 ~= 0 and v75 > 1 and (v75 - 1) % l_game_FastInt_0 == 0 then
            task.wait();
        end;
        if v76:IsA("MeshPart") then
            if #v76:GetChildren() > 0 then
                v76:ClearAllChildren();
                v73 = true;
            end;
            table.insert(v74, v76);
        else
            v76:Destroy();
            v73 = true;
        end;
    end;
    if v73 then
        v1.reportMeshPartFiltered(v70);
    end;
    if #v74 == 0 then
        warn(v72:getText("Common", "InsertAborted", {
            assetId = v70
        }));
    end;
    return v74;
end;
local _ = function(v78, v79, v80) --[[ Line: 245 ]] --[[ Name: doScriptConfirmationOrCancelIfContainsScripts ]]
    -- upvalues: l_Promise_0 (copy), l_ToolboxYieldWhenInserting_0 (copy), l_game_FastInt_0 (copy), l_ToolboxDeleteTempModelFix_0 (copy)
    return l_Promise_0.new(function(v81, _) --[[ Line: 246 ]]
        -- upvalues: v79 (copy), l_ToolboxYieldWhenInserting_0 (ref), l_game_FastInt_0 (ref), v80 (copy), v78 (copy), l_ToolboxDeleteTempModelFix_0 (ref)
        local function v85() --[[ Line: 248 ]]
            -- upvalues: v79 (ref), l_ToolboxYieldWhenInserting_0 (ref), l_game_FastInt_0 (ref), v81 (copy)
            for v83, v84 in ipairs(v79) do
                if l_ToolboxYieldWhenInserting_0 and l_game_FastInt_0 ~= 0 and v83 > 1 and (v83 - 1) % l_game_FastInt_0 == 0 then
                    task.wait();
                end;
                v84:Destroy();
            end;
            v81(false);
        end;
        local function v86() --[[ Line: 258 ]]
            -- upvalues: v81 (copy)
            v81(true);
        end;
        if not v79 then
            v81(true);
        end;
        if not v80 then
            v81(true);
        end;
        local v87 = 0;
        local v88 = 0;
        for _, v90 in ipairs(v79) do
            if l_ToolboxYieldWhenInserting_0 then
                local l_v88_0 = v88;
                if l_game_FastInt_0 ~= 0 and l_v88_0 > 1 and (l_v88_0 - 1) % l_game_FastInt_0 == 0 then
                    task.wait();
                end;
            end;
            if v90:IsA("Script") then
                v87 = v87 + 1;
            end;
            for _, v93 in ipairs(v90:GetDescendants()) do
                if l_ToolboxYieldWhenInserting_0 then
                    local l_v88_1 = v88;
                    if l_game_FastInt_0 ~= 0 and l_v88_1 > 1 and (l_v88_1 - 1) % l_game_FastInt_0 == 0 then
                        task.wait();
                    end;
                end;
                if v93:IsA("Script") then
                    v87 = v87 + 1;
                end;
                if l_ToolboxYieldWhenInserting_0 then
                    v88 = v88 + 1;
                end;
            end;
            if l_ToolboxYieldWhenInserting_0 then
                v88 = v88 + 1;
            end;
        end;
        if v87 < 1 then
            v81(true);
        end;
        if v87 >= 1 then
            v80:promptScriptWarningAndWait({
                assetName = v78, 
                numScripts = v87, 
                cancel = v85, 
                insert = v86
            });
        end;
        if l_ToolboxDeleteTempModelFix_0 then
            v81(true);
        end;
    end);
end;
local function v106(v96, v97, v98, v99, v100) --[[ Line: 317 ]] --[[ Name: placeAssetInCorrectService ]]
    -- upvalues: l_Lighting_0 (copy), v10 (copy), l_MaterialService_0 (copy), v3 (copy), l_StarterPack_0 (copy), v2 (copy)
    for _, v102 in ipairs(v98) do
        if v102:IsA("Sky") or v102:IsA("Atmosphere") then
            v102.Parent = l_Lighting_0;
        elseif v10.contains(v99, v10.MaterialPack) then
            v102.Parent = l_MaterialService_0;
        else
            local l_v97_0 = v97;
            if v102:IsA("Tool") or v102:IsA("HopperBin") then
                local v104 = v96:promptAndWait();
                if v104 == v3.INSERT_TO_WORKSPACE then
                    l_v97_0 = v97;
                elseif v104 == v3.INSERT_TO_STARTER_PACK then
                    l_v97_0 = l_StarterPack_0;
                elseif v104 == v3.INSERT_CANCELLED then
                    l_v97_0 = nil;
                end;
            end;
            do
                local l_l_v97_0_0 = l_v97_0;
                xpcall(function() --[[ Line: 342 ]]
                    -- upvalues: v102 (copy), v2 (ref), l_l_v97_0_0 (ref)
                    if game:GetService(v102.ClassName) then
                        if v2.shouldDebugWarnings() then
                            warn((("Attempted to insert unsupported service type: %*"):format(v102.ClassName)));
                        end;
                        return;
                    else
                        v102.Parent = l_l_v97_0_0;
                        if not v102.Parent then
                            v102:Destroy();
                        end;
                        return;
                    end;
                end, function() --[[ Line: 356 ]]
                    -- upvalues: v102 (copy), v2 (ref)
                    if v102 and v2.shouldDebugWarnings() then
                        warn((("Attempted to insert unsupported instance type: %*"):format(v102.ClassName)));
                    end;
                end);
            end;
        end;
        v100[#v100 + 1] = v102;
    end;
end;
local function v117(v107, v108) --[[ Line: 370 ]] --[[ Name: moveModelAndCameraToPosition ]]
    -- upvalues: l_Workspace_0 (copy)
    if v107 then
        if #v107:GetChildren() > 0 then
            v107:MoveTo(v108);
            local l_v107_BoundingBox_0, v110 = v107:GetBoundingBox();
            if v110.Magnitude > 0 then
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                local l_CFrame_0 = l_CurrentCamera_1.CFrame;
                local v113 = v110.Magnitude * 1.2;
                local l_unit_0 = (l_CFrame_0.p - l_v107_BoundingBox_0.p).unit;
                l_CurrentCamera_1.CFrame = CFrame.new(l_v107_BoundingBox_0.p + v113 * l_unit_0);
                l_CurrentCamera_1.Focus = CFrame.new(l_v107_BoundingBox_0.p);
            end;
            for _, v116 in ipairs(v107:GetChildren()) do
                v116.Parent = v107.Parent;
            end;
        end;
        v107:Destroy();
    end;
end;
local function v126(v118, v119, v120, v121, v122, v123, v124) --[[ Line: 400 ]] --[[ Name: doPostInsertSideEffects ]]
    -- upvalues: v106 (copy), v117 (copy), v24 (copy), v2 (copy), l_Selection_0 (copy)
    local v125 = {};
    if v119 then
        v106(v120, v121, v122, v123, v125);
        v117(v121, v124);
        v24:fire("AssetInserted", {
            assetId = v118, 
            assetInstance = v122
        });
    else
        if v2.shouldDebugWarnings() then
            print("destroying temp model insert");
        end;
        v121:Destroy();
    end;
    l_Selection_0:Set(v125);
    return v125;
end;
local function v160(v127, v128, v129, v130, v131, v132, v133, v134, v135) --[[ Line: 437 ]] --[[ Name: insertAsset ]]
    -- upvalues: l_Workspace_0 (copy), v13 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), v10 (copy), v9 (copy), v6 (copy), v2 (copy), l_InsertService_0 (copy), v49 (copy), v44 (copy), v77 (copy), l_Promise_0 (copy), l_ToolboxYieldWhenInserting_0 (copy), l_game_FastInt_0 (copy), l_ToolboxDeleteTempModelFix_0 (copy), v126 (copy)
    local l_l_Workspace_0_0 = l_Workspace_0;
    local v137 = if not not v13 or l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or v134 then v10.contains(v132, v10.Package) or v133 ~= nil and v9.categoryIsPackage(v133) or v134 and v9.getCategoryByName(v133) == v9.FREE_MODELS else nil;
    local v138 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 461 ]]
        -- upvalues: v6 (ref), v127 (copy), v13 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (ref), v134 (copy), v137 (copy), v2 (ref), v138 (ref), l_InsertService_0 (ref)
        local v139 = v6.constructAssetIdString(v127);
        if v13 or l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or v134 then
            if v137 then
                if v2.shouldDebugUrls() then
                    print(("Inserting package %s"):format(v139));
                end;
                v138 = l_InsertService_0:LoadPackageAssetAsync(v139);
                return;
            else
                if v2.shouldDebugUrls() then
                    print(("Inserting asset %s"):format(v139));
                end;
                v138 = game:InsertObjectsAndJoinIfLegacyAsync(v139);
                return;
            end;
        else
            if v2.shouldDebugUrls() then
                print(("Inserting asset %s"):format(v139));
            end;
            v138 = game:InsertObjectsAndJoinIfLegacyAsync(v139);
            return;
        end;
    end);
    if l_status_0 and v138 then
        if (v13 or v134) and v137 and v138[1] then
            v138[1].SourceAssetId = v127;
        end;
        if v138[1] and v138[1].SourceAssetId then
            v49(v138[1], v127);
        end;
        local v142 = if v135 and v135.positionOverride then v135.positionOverride else v44();
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = "ToolboxTemporaryInsertModel";
        l_Model_0.Parent = l_l_Workspace_0_0;
        if v130 == Enum.AssetType.MeshPart.Value then
            v138 = v77(v127, v138, v131);
        end;
        local l_v138_0 = v138;
        return l_Promise_0.new(function(v145, _) --[[ Line: 246 ]]
            -- upvalues: l_v138_0 (copy), l_ToolboxYieldWhenInserting_0 (ref), l_game_FastInt_0 (ref), v129 (copy), v128 (copy), l_ToolboxDeleteTempModelFix_0 (ref)
            local function v149() --[[ Line: 248 ]]
                -- upvalues: l_v138_0 (ref), l_ToolboxYieldWhenInserting_0 (ref), l_game_FastInt_0 (ref), v145 (copy)
                for v147, v148 in ipairs(l_v138_0) do
                    if l_ToolboxYieldWhenInserting_0 and l_game_FastInt_0 ~= 0 and v147 > 1 and (v147 - 1) % l_game_FastInt_0 == 0 then
                        task.wait();
                    end;
                    v148:Destroy();
                end;
                v145(false);
            end;
            local function v150() --[[ Line: 258 ]]
                -- upvalues: v145 (copy)
                v145(true);
            end;
            if not l_v138_0 then
                v145(true);
            end;
            if not v129 then
                v145(true);
            end;
            local v151 = 0;
            local v152 = 0;
            for _, v154 in ipairs(l_v138_0) do
                if l_ToolboxYieldWhenInserting_0 then
                    local l_v152_0 = v152;
                    if l_game_FastInt_0 ~= 0 and l_v152_0 > 1 and (l_v152_0 - 1) % l_game_FastInt_0 == 0 then
                        task.wait();
                    end;
                end;
                if v154:IsA("Script") then
                    v151 = v151 + 1;
                end;
                for _, v157 in ipairs(v154:GetDescendants()) do
                    if l_ToolboxYieldWhenInserting_0 then
                        local l_v152_1 = v152;
                        if l_game_FastInt_0 ~= 0 and l_v152_1 > 1 and (l_v152_1 - 1) % l_game_FastInt_0 == 0 then
                            task.wait();
                        end;
                    end;
                    if v157:IsA("Script") then
                        v151 = v151 + 1;
                    end;
                    if l_ToolboxYieldWhenInserting_0 then
                        v152 = v152 + 1;
                    end;
                end;
                if l_ToolboxYieldWhenInserting_0 then
                    v152 = v152 + 1;
                end;
            end;
            if v151 < 1 then
                v145(true);
            end;
            if v151 >= 1 then
                v129:promptScriptWarningAndWait({
                    assetName = v128, 
                    numScripts = v151, 
                    cancel = v149, 
                    insert = v150
                });
            end;
            if l_ToolboxDeleteTempModelFix_0 then
                v145(true);
            end;
        end):andThen(function(v159) --[[ Line: 518 ]]
            -- upvalues: v2 (ref), v126 (ref), v127 (copy), v129 (copy), l_Model_0 (copy), v138 (ref), v132 (copy), v142 (copy)
            if v2.shouldDebugWarnings() then
                print(("assetWasInserted: %s"):format((tostring(v159))));
            end;
            return (v126(v127, v159, v129, l_Model_0, v138, v132, v142));
        end):await();
    else
        return nil, l_result_0;
    end;
end;
local function v169(_, v162, v163) --[[ Line: 538 ]] --[[ Name: insertDecal ]]
    -- upvalues: v6 (copy), v2 (copy), l_Selection_0 (copy), l_Workspace_0 (copy)
    local v164 = nil;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 540 ]]
        -- upvalues: v6 (ref), v162 (copy), v2 (ref), v164 (ref)
        local v165 = v6.constructAssetIdString(v162);
        if v2.shouldDebugUrls() then
            print(("Inserting decal %s"):format(v165));
        end;
        v164 = game:GetObjectsAsync(v165);
    end);
    if l_status_1 and v164 and v164[1] then
        local v168 = v164[1];
        v168.Name = v163;
        v168.SourceAssetId = v162;
        v168.Parent = (l_Selection_0:Get() or {})[1] or l_Workspace_0;
        l_Selection_0:Set({
            v168
        });
        return v168;
    else
        return nil, l_result_1;
    end;
end;
local function v175(v170) --[[ Line: 563 ]] --[[ Name: insertPackage ]]
    -- upvalues: v6 (copy), v2 (copy), l_InsertService_0 (copy), l_Selection_0 (copy), l_Workspace_0 (copy)
    local v171 = nil;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 565 ]]
        -- upvalues: v6 (ref), v170 (copy), v2 (ref), v171 (ref), l_InsertService_0 (ref)
        local v172 = v6.constructAssetIdString(v170);
        if v2.shouldDebugUrls() then
            print(("Inserting package %s"):format(v172));
        end;
        v171 = l_InsertService_0:LoadPackageAssetAsync(v172);
    end);
    if l_status_2 and v171 and v171[1] then
        v171[1].SourceAssetId = v170;
        v171[1].Parent = (l_Selection_0:Get() or {})[1] or l_Workspace_0;
        l_Selection_0:set(v171);
        return v171[1];
    else
        return nil, l_result_2;
    end;
end;
local v176 = nil;
v176 = not l_ToolboxVideoUsePermissionInsertion_0 and function(v177, v178) --[[ Line: 585 ]] --[[ Name: insertVideo ]]
    -- upvalues: v6 (copy), v2 (copy), l_Selection_0 (copy), l_Workspace_0 (copy)
    local v179 = v6.constructAssetIdString(v177);
    if v2.shouldDebugUrls() then
        print(("Inserting video %s"):format(v179));
    end;
    local l_VideoFrame_0 = Instance.new("VideoFrame");
    l_VideoFrame_0.SourceAssetId = v177;
    l_VideoFrame_0.Video = v179;
    l_VideoFrame_0.Name = v178;
    l_VideoFrame_0.Parent = (l_Selection_0:Get() or {})[1] or l_Workspace_0;
    l_VideoFrame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Selection_0:Set({
        l_VideoFrame_0
    });
    return l_VideoFrame_0;
end or function(v181, v182, v183) --[[ Line: 602 ]] --[[ Name: insertVideo ]]
    -- upvalues: v6 (copy), v2 (copy), v53 (copy), l_Selection_0 (copy), l_Workspace_0 (copy)
    local v184 = v6.constructAssetIdString(v181);
    if v2.shouldDebugUrls() then
        print(("Inserting video %s"):format(v184));
    end;
    v53(v181, v183);
    local v185 = l_Selection_0:Get()[1];
    local l_VideoFrame_1 = Instance.new("VideoFrame");
    l_VideoFrame_1.SourceAssetId = v181;
    l_VideoFrame_1.Video = v184;
    l_VideoFrame_1.Name = v182;
    l_VideoFrame_1.Parent = v185 or l_Workspace_0;
    l_VideoFrame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Selection_0:Set({
        l_VideoFrame_1
    });
    return l_VideoFrame_1;
end;
local function v191(_, _) --[[ Line: 624 ]] --[[ Name: insertFont ]]
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 625 ]]

    end);
    return l_status_3, l_result_3;
end;
local function v197(v192, v193, _) --[[ Line: 631 ]] --[[ Name: installPlugin ]]
    -- upvalues: v2 (copy), l_StudioService_0 (copy)
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 632 ]]
        -- upvalues: v2 (ref), v192 (copy), l_StudioService_0 (ref), v193 (copy)
        if v2.shouldDebugUrls() then
            print(("Installing plugin %s"):format((tostring(v192))));
        end;
        if l_StudioService_0 then
            l_StudioService_0:TryInstallPlugin(v192, v193);
            return;
        else
            warn("StudioService not found!");
            return;
        end;
    end);
    return l_status_4, l_result_4;
end;
local function v199(v198) --[[ Line: 647 ]] --[[ Name: assetTypeIdToString ]]
    -- upvalues: v2 (copy)
    if v198 == Enum.AssetType.Model.Value then
        return "Model";
    elseif v198 == Enum.AssetType.Decal.Value then
        return "Decal";
    elseif v198 == Enum.AssetType.Audio.Value then
        return "Audio";
    elseif v198 == Enum.AssetType.FontFamily.Value then
        return "FontFamily";
    elseif v198 == Enum.AssetType.MeshPart.Value then
        return "Mesh";
    elseif v198 == Enum.AssetType.Plugin.Value then
        return "Plugin";
    elseif v198 == Enum.AssetType.Video.Value then
        return "Video";
    elseif v198 == Enum.AssetType.Animation.Value then
        return "Animation";
    else
        if v2.shouldDebugWarnings() then
            warn(("Missing name for assetTypeId %s"):format((tostring(v198))));
        end;
        return "Unknown";
    end;
end;
local function v205(v200, v201, v202) --[[ Line: 672 ]] --[[ Name: dispatchInsertAsset ]]
    -- upvalues: v10 (copy), v9 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v13 (copy), v175 (copy), v69 (copy), v169 (copy), v197 (copy), l_ToolboxVideoUsePermissionInsertion_0 (copy), v176 (ref), v191 (copy), v160 (copy)
    local v203 = if v200.assetSubTypes ~= nil then v10.contains(v200.assetSubTypes, v10.Package) else v9.categoryIsPackage(v200.categoryName);
    local v204 = l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 and v200.getIsIXPVariableEnabled and v200.getIsIXPVariableEnabled("MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled");
    if not v13 and not v204 and v203 then
        return v175(v200.assetId);
    elseif v200.assetTypeId == Enum.AssetType.Audio.Value then
        return (v69(v200.assetId, v200.assetName, v201, v200.localization, v202));
    elseif v200.assetTypeId == Enum.AssetType.Decal.Value then
        return v169(v200.plugin, v200.assetId, v200.assetName);
    elseif v200.assetTypeId == Enum.AssetType.Plugin.Value then
        return v197(v200.assetId, v200.assetVersionId, v200.assetName);
    elseif v200.assetTypeId == Enum.AssetType.Video.Value then
        if l_ToolboxVideoUsePermissionInsertion_0 then
            return v176(v200.assetId, v200.assetName, v202);
        else
            return v176(v200.assetId, v200.assetName);
        end;
    elseif v200.assetTypeId == Enum.AssetType.FontFamily.Value then
        return v191(v200.assetId, v200.assetName);
    elseif l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
        return v160(v200.assetId, v200.assetName, v201, v200.assetTypeId, v200.localization, v200.assetSubTypes, v200.categoryName, v204, v200.tutorialLimits);
    else
        return v160(v200.assetId, v200.assetName, v201, v200.assetTypeId, v200.localization, v200.assetSubTypes, v200.categoryName, nil, v200.tutorialLimits);
    end;
end;
local function v209(v206, v207) --[[ Line: 737 ]] --[[ Name: sendInsertionAnalytics ]]
    -- upvalues: v1 (copy), v199 (copy)
    v1.incrementToolboxInsertCounter((v199(v206.assetTypeId)));
    local l_categoryName_0 = v206.categoryName;
    v1.incrementToolboxCategoryInsertCounter(l_categoryName_0);
    if not v207 then
        v1.onAssetInserted(v206.assetId, v206.searchTerm, v206.assetIndex, l_categoryName_0, v206.layoutMode);
    else
        v1.onAssetDragInserted(v206.assetId, v206.searchTerm, v206.assetIndex, l_categoryName_0);
    end;
    v1.incrementWorkspaceInsertCounter();
end;
local v210 = {
    _localization = nil, 
    registerLocalization = nil, 
    registerProcessDragHandler = nil, 
    tryInsert = nil
};
local v211 = nil;
if v22() then
    didBatchGrantFail = function(v212) --[[ Line: 783 ]] --[[ Name: didBatchGrantFail ]]
        if v212.errors then
            for _, v214 in ipairs(v212.errors) do
                if v214.assetId and v214.code and v214.code ~= "PublicAssetCannotBeGrantedTo" and v214.code ~= "AssetTypeNotEnabled" then
                    return true, v214.assetId;
                end;
            end;
        end;
        return false, 0;
    end;
    v210.getGameId = function() --[[ Line: 822 ]] --[[ Name: getGameId ]]
        return game.GameId;
    end;
    v210.tryInsertWithBatchGrantPermissions = function(v215, v216, v217, v218) --[[ Line: 826 ]] --[[ Name: tryInsertWithBatchGrantPermissions ]]
        -- upvalues: v35 (copy), v210 (copy)
        if not v35[v215.assetTypeId] then
            return v210.tryInsert(v215, v216, v217, v218);
        else
            local v219 = v210.getGameId();
            if type(v219) ~= "number" or v219 == 0 then
                local v220 = v210._localization:getText("AAC", "RestrictedAssetInUnsavedExperience", {
                    assetId = v215.assetId
                });
                warn(v220);
                return v210.tryInsert(v215, v216, v217, v218);
            else
                v218:batchGrantAssetPermissions({
                    v215.assetId
                }, v219):andThen(function(v221) --[[ Line: 850 ]]
                    -- upvalues: v210 (ref), v215 (copy), v216 (copy), v217 (copy), v218 (copy)
                    local v222, v223 = didBatchGrantFail(v221);
                    if v222 then
                        warn(v210._localization:getText("GrantAssetPermission", "Failure", {
                            assetId = v223
                        }));
                    end;
                    v210.tryInsert(v215, v216, v217, v218);
                end):catch(function() --[[ Line: 859 ]]
                    -- upvalues: v210 (ref), v215 (copy), v216 (copy), v217 (copy), v218 (copy)
                    warn(v210._localization:getText("GrantAssetPermission", "Failure", {
                        assetId = v215.assetId
                    }));
                    v210.tryInsert(v215, v216, v217, v218);
                end);
                return;
            end;
        end;
    end;
end;
v210.tryInsert = function(v224, v225, v226, v227) --[[ Line: 871 ]] --[[ Name: tryInsert ]]
    -- upvalues: v34 (copy), v211 (ref), l_ToolboxEnableAudioGrantDialog_0 (copy), v210 (copy), v23 (copy)
    if v226 then
        if not v34[v224.plugin:GetSelectedRibbonTool()] then
            v224.plugin:SelectRibbonTool(Enum.RibbonTool.Select, UDim2.new());
        end;
        v211 = {
            assetName = v224.assetName, 
            assetId = v224.assetId, 
            assetTypeId = if l_ToolboxEnableAudioGrantDialog_0 then v224.assetTypeId else nil, 
            assetSubTypes = v224.assetSubTypes, 
            localization = if l_ToolboxEnableAudioGrantDialog_0 then v210._localization else nil, 
            insertToolPromise = v225, 
            onSuccess = v224.onSuccess
        };
        v210.doDragInsertAsset(v224);
        return;
    else
        local v228, v229 = v210.doInsertAsset(v224, v225, v227);
        if v23() and v229 and v224.onError then
            v224.onError(v229, v224.assetId, v224.assetTypeId);
        end;
        return v228, v229;
    end;
end;
v210.doInsertAsset = function(v230, v231, v232) --[[ Line: 899 ]] --[[ Name: doInsertAsset ]]
    -- upvalues: l_ToolboxLogInsertDuration_0 (copy), v2 (copy), l_ToolboxVideoTestUseLocalAudioFile_0 (copy), l_ChangeHistoryService_0 (copy), v210 (copy), v205 (copy), v209 (copy)
    local l_assetId_0 = v230.assetId;
    local l_assetName_0 = v230.assetName;
    local l_assetTypeId_0 = v230.assetTypeId;
    local v236 = nil;
    if l_ToolboxLogInsertDuration_0 then
        v236 = os.clock();
    end;
    if v2.shouldDebugWarnings() then
        print(("Inserting asset %s %s"):format(tostring(l_assetId_0), (tostring(l_assetName_0))));
    end;
    if l_ToolboxVideoTestUseLocalAudioFile_0 then
        l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %s"):format((tostring(l_assetId_0))));
    else
        l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %d"):format(l_assetId_0));
    end;
    v230.localization = v210._localization;
    local v237, v238 = v205(v230, v231, v232);
    local v239 = nil;
    if l_ToolboxLogInsertDuration_0 then
        v239 = os.clock() - v236;
    end;
    if l_assetTypeId_0 == Enum.AssetType.Plugin.Value then
        if l_ToolboxVideoTestUseLocalAudioFile_0 then
            l_ChangeHistoryService_0:SetWaypoint(("After attempt to install plugin %s"):format((tostring(l_assetId_0))));
        else
            l_ChangeHistoryService_0:SetWaypoint(("After attempt to install plugin %d"):format(l_assetId_0));
        end;
        v209(v230, false);
        if v230.onSuccess then
            v230.onSuccess(l_assetId_0, nil, v239);
            return v237, v238;
        end;
    elseif v237 then
        if l_ToolboxVideoTestUseLocalAudioFile_0 then
            l_ChangeHistoryService_0:SetWaypoint(("After insert asset %s"):format((tostring(l_assetId_0))));
        else
            l_ChangeHistoryService_0:SetWaypoint(("After insert asset %d"):format(l_assetId_0));
        end;
        v209(v230, false);
        if v230.onSuccess then
            v230.onSuccess(l_assetId_0, v237, v239);
            return v237, v238;
        end;
    elseif l_ToolboxVideoTestUseLocalAudioFile_0 then
        warn(("Toolbox failed to insert asset %s %s: %s"):format(tostring(l_assetId_0), l_assetName_0, v238 or ""));
        return v237, v238;
    else
        warn(("Toolbox failed to insert asset %d %s: %s"):format(l_assetId_0, l_assetName_0, v238 or ""));
    end;
    return v237, v238;
end;
v210.doDragInsertAsset = function(v240) --[[ Line: 960 ]] --[[ Name: doDragInsertAsset ]]
    -- upvalues: v2 (copy), l_ToolboxVideoTestUseLocalAudioFile_0 (copy), l_ChangeHistoryService_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v9 (copy), v10 (copy), v6 (copy), v209 (copy)
    local l_assetId_1 = v240.assetId;
    local l_assetName_1 = v240.assetName;
    if v240.assetTypeId == Enum.AssetType.Plugin.Value then
        return;
    else
        if v2.shouldDebugWarnings() then
            print(("Inserting asset %s %s"):format(tostring(l_assetId_1), (tostring(l_assetName_1))));
        end;
        if l_ToolboxVideoTestUseLocalAudioFile_0 then
            l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %s"):format((tostring(l_assetId_1))));
        else
            l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %d"):format(l_assetId_1));
        end;
        local l_status_5, l_result_5 = pcall(function() --[[ Line: 979 ]]
            -- upvalues: v240 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (ref), v9 (ref), v10 (ref), v6 (ref), l_assetId_1 (copy), l_assetName_1 (copy), v2 (ref)
            v240.plugin.UsesAssetInsertionDrag = true;
            local v243 = l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 and v240.getIsIXPVariableEnabled and v240.getIsIXPVariableEnabled("MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled");
            local v244 = nil;
            v244 = if v243 then v9.categoryIsPackage(v240.categoryName) or v240.assetSubTypes and v10.contains(v240.assetSubTypes, v10.Package) or v9.getCategoryByName(v240.categoryName) == v9.FREE_MODELS else if v240.assetSubTypes ~= nil then v10.contains(v240.assetSubTypes, v10.Package) else v9.categoryIsPackage(v240.categoryName);
            local v245 = v6.constructAssetGameAssetIdUrl(l_assetId_1, v240.assetTypeId, v244, l_assetName_1);
            if v2.shouldDebugUrls() then
                print(("Dragging asset url %s"):format(v245));
            end;
            v240.plugin:StartDrag({
                Sender = "LuaToolbox", 
                MimeType = "text/plain", 
                Data = v245
            });
        end);
        if l_status_5 then
            v209(v240, true);
            return l_status_5;
        elseif l_ToolboxVideoTestUseLocalAudioFile_0 then
            warn(("Toolbox failed to drag asset %s %s: %s"):format(tostring(l_assetId_1), l_assetName_1, l_result_5 or ""));
            return l_status_5;
        else
            warn(("Toolbox failed to drag asset %d %s: %s"):format(l_assetId_1, l_assetName_1, l_result_5 or ""));
            return l_status_5;
        end;
    end;
end;
local function v252(v248, v249) --[[ Line: 1026 ]] --[[ Name: setSourceAssetIdOnInstances ]]
    -- upvalues: l_ToolboxYieldWhenInserting_0 (copy), l_game_FastInt_0 (copy), v49 (copy)
    for v250, v251 in ipairs(v249) do
        if l_ToolboxYieldWhenInserting_0 and l_game_FastInt_0 ~= 0 and v250 > 1 and (v250 - 1) % l_game_FastInt_0 == 0 then
            task.wait();
        end;
        v251.SourceAssetId = v248;
        v49(v251, v248);
    end;
end;
v210.registerLocalization = function(v253) --[[ Line: 1036 ]] --[[ Name: registerLocalization ]]
    -- upvalues: v210 (copy)
    v210._localization = v253;
end;
v210.registerProcessDragHandler = function(v254) --[[ Line: 1040 ]] --[[ Name: registerProcessDragHandler ]]
    -- upvalues: v252 (copy), v1 (copy), v77 (copy), v210 (copy), v211 (ref), l_ToolboxEnableAudioGrantDialog_0 (copy), v61 (copy), l_Promise_0 (copy), l_ToolboxYieldWhenInserting_0 (copy), l_game_FastInt_0 (copy), l_ToolboxDeleteTempModelFix_0 (copy), v10 (copy), l_MaterialService_0 (copy)
    v254.ProcessAssetInsertionDrag = function(v255, v256, v257) --[[ Line: 1042 ]]
        -- upvalues: v252 (ref), v1 (ref), v77 (ref), v210 (ref), v211 (ref)
        v252(v255, v257);
        spawn(function() --[[ Line: 1046 ]]
            -- upvalues: v1 (ref), v255 (copy), v256 (copy)
            v1.reportDragInsertFinished(v255, v256);
        end);
        if v256 == Enum.AssetType.MeshPart.Value then
            return (v77(v255, v257, v210._localization));
        else
            v211.instances = v257;
            return v257;
        end;
    end;
    v254.ProcessAssetInsertionDrop = function() --[[ Line: 1060 ]]
        -- upvalues: v211 (ref), l_ToolboxEnableAudioGrantDialog_0 (ref), v61 (ref), l_Promise_0 (ref), l_ToolboxYieldWhenInserting_0 (ref), l_game_FastInt_0 (ref), l_ToolboxDeleteTempModelFix_0 (ref), v10 (ref), l_MaterialService_0 (ref)
        spawn(function() --[[ Line: 1062 ]]
            -- upvalues: v211 (ref), l_ToolboxEnableAudioGrantDialog_0 (ref), v61 (ref), l_Promise_0 (ref), l_ToolboxYieldWhenInserting_0 (ref), l_game_FastInt_0 (ref), l_ToolboxDeleteTempModelFix_0 (ref), v10 (ref), l_MaterialService_0 (ref)
            if v211 then
                if l_ToolboxEnableAudioGrantDialog_0 and v211.assetTypeId == Enum.AssetType.Audio.Value then
                    v61(v211.assetName, v211.assetId, v211.assetTypeId, v211.insertToolPromise, v211.localization);
                end;
                local l_assetName_2 = v211.assetName;
                local l_instances_0 = v211.instances;
                local l_insertToolPromise_0 = v211.insertToolPromise;
                local _ = l_Promise_0.new(function(v261, _) --[[ Line: 246 ]]
                    -- upvalues: l_instances_0 (copy), l_ToolboxYieldWhenInserting_0 (ref), l_game_FastInt_0 (ref), l_insertToolPromise_0 (copy), l_assetName_2 (copy), l_ToolboxDeleteTempModelFix_0 (ref)
                    local function v265() --[[ Line: 248 ]]
                        -- upvalues: l_instances_0 (ref), l_ToolboxYieldWhenInserting_0 (ref), l_game_FastInt_0 (ref), v261 (copy)
                        for v263, v264 in ipairs(l_instances_0) do
                            if l_ToolboxYieldWhenInserting_0 and l_game_FastInt_0 ~= 0 and v263 > 1 and (v263 - 1) % l_game_FastInt_0 == 0 then
                                task.wait();
                            end;
                            v264:Destroy();
                        end;
                        v261(false);
                    end;
                    local function v266() --[[ Line: 258 ]]
                        -- upvalues: v261 (copy)
                        v261(true);
                    end;
                    if not l_instances_0 then
                        v261(true);
                    end;
                    if not l_insertToolPromise_0 then
                        v261(true);
                    end;
                    local v267 = 0;
                    local v268 = 0;
                    for _, v270 in ipairs(l_instances_0) do
                        if l_ToolboxYieldWhenInserting_0 then
                            local l_v268_0 = v268;
                            if l_game_FastInt_0 ~= 0 and l_v268_0 > 1 and (l_v268_0 - 1) % l_game_FastInt_0 == 0 then
                                task.wait();
                            end;
                        end;
                        if v270:IsA("Script") then
                            v267 = v267 + 1;
                        end;
                        for _, v273 in ipairs(v270:GetDescendants()) do
                            if l_ToolboxYieldWhenInserting_0 then
                                local l_v268_1 = v268;
                                if l_game_FastInt_0 ~= 0 and l_v268_1 > 1 and (l_v268_1 - 1) % l_game_FastInt_0 == 0 then
                                    task.wait();
                                end;
                            end;
                            if v273:IsA("Script") then
                                v267 = v267 + 1;
                            end;
                            if l_ToolboxYieldWhenInserting_0 then
                                v268 = v268 + 1;
                            end;
                        end;
                        if l_ToolboxYieldWhenInserting_0 then
                            v268 = v268 + 1;
                        end;
                    end;
                    if v267 < 1 then
                        v261(true);
                    end;
                    if v267 >= 1 then
                        l_insertToolPromise_0:promptScriptWarningAndWait({
                            assetName = l_assetName_2, 
                            numScripts = v267, 
                            cancel = v265, 
                            insert = v266
                        });
                    end;
                    if l_ToolboxDeleteTempModelFix_0 then
                        v261(true);
                    end;
                end);
                if v10.contains(v211.assetSubTypes, v10.MaterialPack) then
                    for _, v277 in v211.instances do
                        v277.Parent = l_MaterialService_0;
                    end;
                end;
                if v211.onSuccess then
                    v211.onSuccess(v211.assetId, v211.instances);
                end;
                v211 = nil;
            end;
        end);
    end;
end;
return v210;