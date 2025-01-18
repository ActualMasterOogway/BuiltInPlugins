local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenuContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v8 = require(l_script_FirstAncestor_0.Src.Util.UserCatalogContext);
local v9 = require(l_script_FirstAncestor_0.Src.Util.filterDescendants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.isAvatar);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCatalogUndo);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCheckFaceItems);
return function() --[[ Line: 21 ]] --[[ Name: useAddInstancesToUserCatalogAndEquip ]]
    -- upvalues: v2 (copy), v6 (copy), v7 (copy), v8 (copy), v5 (copy), v10 (copy), v4 (copy), v9 (copy), v12 (copy), v11 (copy), l_ChangeHistoryService_0 (copy)
    local v13 = v2.useContext(v6.Context);
    local v14 = v2.useContext(v7);
    local v15 = v2.useContext(v8);
    return v2.useCallback(function(v16) --[[ Line: 33 ]]
        -- upvalues: v5 (ref), v10 (ref), v13 (copy), v4 (ref), v9 (ref), v12 (ref), v11 (ref), l_ChangeHistoryService_0 (ref), v15 (copy), v14 (copy)
        local v17 = nil;
        local v18 = {};
        local v19 = {};
        local v20 = {};
        local v21 = 0;
        local v22 = nil;
        for _, v24 in v16 do
            if v24:IsA("MeshPart") and table.find(v5.LIMBS, v24.Name) == nil then
                if v24.Parent ~= nil and v10(v24.Parent) then
                    v13.addLoneMeshPart(v24);
                end;
            else
                local v25 = {};
                local v26 = 0;
                for _, v28 in v4 do
                    for _, v30 in v28 do
                        local v31 = v30.CreateCustomInstanceFromSelection(v24);
                        if v31 ~= nil then
                            assert(v31 ~= nil, v5.LUAU_ANALYZE_ERROR);
                            if typeof(v31) == "string" then
                                v20[v24] = v31;
                            else
                                assert(v31 ~= v24, "CreateCustomInstanceFromSelection should always give a new instance");
                                assert(v31.Parent == nil, "CreateCustomInstanceFromSelection should give an isolated instance");
                                v9(v31, {
                                    "Handle"
                                });
                                if v12() then
                                    local v32 = false;
                                    for v33 in v25 do
                                        if v33.Key == v30.Key then
                                            v32 = true;
                                            break;
                                        end;
                                    end;
                                    if v32 then
                                        continue;
                                    end;
                                end;
                                v26 = v26 + 1;
                                v25[v30] = v31;
                            end;
                        end;
                    end;
                end;
                if v26 == 0 then
                    table.insert(v18, v24);
                elseif v26 > 1 then
                    local v34 = v24:Clone();
                    v9(v34, {
                        "Handle"
                    });
                    v13.addAmbiguousAsset({
                        worldModel = v34, 
                        instances = v25
                    });
                else
                    local v35, v36 = next(v25);
                    local v37 = false;
                    if v35 ~= nil then
                        v37 = v36 ~= nil;
                    end;
                    assert(v37, v5.LUAU_ANALYZE_ERROR);
                    if v35.Key == "Shoes" then
                        v19[v24] = v35;
                        v21 = v21 + 1;
                    else
                        if v11() then
                            v22 = v22 or l_ChangeHistoryService_0:TryBeginRecording(v5.WAYPOINT_NAME_ADD_ITEMS);
                        else
                            v22 = nil;
                        end;
                        v15.addNewItem(v36, v35, v24);
                        v14.addEquippedItem({
                            palette = v35, 
                            item = {
                                source = v5.SOURCE_INSTANCE, 
                                instance = v36
                            }
                        });
                        v17 = v35;
                    end;
                end;
            end;
        end;
        if v21 == 2 then
            local l_Folder_0 = Instance.new("Folder");
            local v39 = nil;
            local v40 = nil;
            for v41, v42 in v19 do
                if v40 == nil then
                    v40 = v42;
                elseif v42 ~= v40 then
                    warn("Shoes palette mismatch found!");
                end;
                local v43 = nil;
                if v41:IsA("Folder") then
                    if #v41:GetChildren() <= 1 then
                        v43 = v41:GetChildren()[1];
                    else
                        break;
                    end;
                else
                    v43 = v41;
                end;
                local v44 = v43:Clone();
                local l_Handle_0 = v44:FindFirstChild("Handle");
                if v44:IsA("Accessory") and l_Handle_0 ~= nil then
                    v44.Parent = l_Folder_0;
                    if l_Handle_0:FindFirstChild("LeftFootAttachment") then
                        v39 = v43;
                    end;
                end;
            end;
            local v46 = v40.CreateCustomInstanceFromSelection(l_Folder_0);
            if v46 ~= nil and typeof(v46) ~= "string" and v46:IsA("Instance") and v39 ~= nil then
                v15.addNewItem(v46, v40, v39);
                v14.addEquippedItem({
                    palette = v40, 
                    item = {
                        source = v5.SOURCE_INSTANCE, 
                        instance = v46
                    }
                });
                v17 = v40;
            else
                if typeof(v46) == "string" then
                    local v47, _ = next(v19);
                    if v47 ~= nil then
                        v20[v47] = v46;
                    end;
                end;
                for v49, _ in v19 do
                    table.insert(v18, v49);
                end;
            end;
        elseif v21 == 1 then
            local v51, v52 = next(v19);
            local v53 = v52.CreateCustomInstanceFromSelection(v51);
            if v51 ~= nil then
                if v53 and typeof(v53) == "string" then
                    table.insert(v18, v51);
                elseif v53 and v53:IsA("Instance") then
                    if v51:IsA("Folder") then
                        local v54 = v51:GetChildren()[1];
                        v15.addNewItem(v53, v52, v54 or v51);
                    else
                        v15.addNewItem(v53, v52, v51);
                    end;
                    v14.addEquippedItem({
                        palette = v52, 
                        item = {
                            source = v5.SOURCE_INSTANCE, 
                            instance = v53
                        }
                    });
                    if v53:IsA("Accessory") then
                        v20[v51] = "OnlyOneShoe";
                        table.insert(v18, v51);
                    end;
                    v17 = v52;
                end;
            end;
        elseif v21 > 2 then
            local v55, _ = next(v19);
            if v55 ~= nil then
                v20[v55] = "NeedTwoShoes";
            end;
            for v57, _ in v19 do
                table.insert(v18, v57);
            end;
        end;
        if v11() and v22 then
            l_ChangeHistoryService_0:FinishRecording(v22, Enum.FinishRecordingOperation.Commit);
        end;
        return {
            activePalette = v17, 
            invalidInstances = v18, 
            extraErrors = v20
        };
    end, {
        v13.addAmbiguousAsset, 
        v13.addLoneMeshPart, 
        v14.addEquippedItem, 
        v15.addNewItem
    });
end;