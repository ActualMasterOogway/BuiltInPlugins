local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Types);
local v6 = require(l_Parent_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v7 = require(l_Parent_0.Src.Components.AvatarScreenContext);
local v8 = require(l_Parent_0.Src.Components.DisambiguationMenu);
local v9 = require(l_Parent_0.Src.Util.EquipmentStateContext);
local v10 = require(l_Parent_0.Src.Util.SelectionWrapper);
local v11 = require(l_Parent_0.Src.Util.UserCatalogContext);
local v12 = require(l_Parent_0.Src.Util.createUnimplemented);
local v13 = require(script.useAssignLoneMeshParts);
local v14 = require(l_Parent_0.Src.Hooks.useEquipCatalogItemsInSelection);
local v15 = require(l_Parent_0.Src.Hooks.useEventConnection);
local v16 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerCatalogUndo);
local v17 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v18 = {
    addAmbiguousAsset = v12("addAmbiguousAsset"), 
    addLoneMeshPart = v12("addLoneMeshPart")
};
local v19 = v3.createContext(v18);
return {
    Context = v19, 
    Provider = function(v20) --[[ Line: 40 ]] --[[ Name: Provider ]]
        -- upvalues: v3 (copy), v17 (copy), v7 (copy), v6 (copy), v9 (copy), v11 (copy), v10 (copy), v16 (copy), v14 (copy), l_ChangeHistoryService_0 (copy), v4 (copy), v15 (copy), l_Workspace_0 (copy), v13 (copy), v19 (copy), v8 (copy)
        local v21, v22 = v3.useState({});
        local v25 = v3.useCallback(function(v23) --[[ Line: 45 ]]
            -- upvalues: v22 (copy)
            v22(function(v24) --[[ Line: 46 ]]
                -- upvalues: v23 (copy)
                v24 = table.clone(v24);
                table.insert(v24, v23);
                return v24;
            end);
        end, {});
        local v26 = v3.useContext(if v17() then v7.Context else v6);
        local v27 = v3.useContext(v9);
        local v28 = v3.useContext(v11);
        local v29 = v10:use():get();
        local v30 = if v16() then v14() else nil;
        local v35 = v3.useCallback(function(v31) --[[ Line: 67 ]]
            -- upvalues: v16 (ref), l_ChangeHistoryService_0 (ref), v4 (ref), v28 (copy), v27 (copy), v26 (copy), v22 (copy)
            assert(#v31 > 0, "assignAmbiguousAssets called with no ambiguous assets");
            local v32 = if v16() then l_ChangeHistoryService_0:TryBeginRecording(v4.WAYPOINT_NAME_DISAMBIGUATION) else nil;
            for _, v34 in v31 do
                v28.addNewItem(v34.createdInstance, v34.palette, v34.worldModel);
                v27.addEquippedItem({
                    palette = v34.palette, 
                    item = {
                        source = v4.SOURCE_INSTANCE, 
                        instance = v34.createdInstance
                    }
                });
            end;
            v26.openPalette(v31[#v31].palette.Key);
            v22({});
            if v16() and v32 then
                l_ChangeHistoryService_0:FinishRecording(v32, Enum.FinishRecordingOperation.Commit);
            end;
        end, {
            v26.openPalette, 
            v27.addEquippedItem, 
            v28.addNewItem
        });
        if v16() then
            v15(l_ChangeHistoryService_0.OnRedo, function(v36) --[[ Line: 102 ]]
                -- upvalues: v4 (ref), v30 (copy), v29 (copy), l_Workspace_0 (ref)
                if string.find(v36, v4.WAYPOINT_NAME_DISAMBIGUATION) == nil and string.find(v36, v4.WAYPOINT_NAME_ADD_ITEMS) == nil then
                    return;
                else
                    v30();
                    local v37 = v29:Get();
                    local v38 = {};
                    for _, v40 in v37 do
                        if v40:IsDescendantOf(l_Workspace_0) then
                            table.insert(v38, v40);
                        end;
                    end;
                    v29:Set(v38);
                    return;
                end;
            end, {
                v27
            });
        end;
        local v41 = v13();
        local v42, v43 = v3.useState({});
        local v46 = v3.useCallback(function(v44, v45) --[[ Line: 131 ]]
            -- upvalues: v35 (copy), v41 (copy), v43 (copy)
            if #v44 > 0 then
                v35(v44);
            end;
            if #v45 > 0 then
                v41(v45);
                v43({});
            end;
        end, {
            v35, 
            v41
        });
        local v50 = v3.useCallback(function(v47) --[[ Line: 150 ]]
            -- upvalues: v43 (copy)
            v43(function(v48) --[[ Line: 151 ]]
                -- upvalues: v47 (copy)
                local v49 = table.clone(v48);
                table.insert(v49, v47);
                return v49;
            end);
        end, {});
        local v51 = {
            addAmbiguousAsset = v25, 
            addLoneMeshPart = v50
        };
        return v3.createElement(v19.Provider, {
            value = v51
        }, v20.children, (not (#v21 <= 0) or #v42 > 0) and v3.createElement(v8, {
            assign = v46, 
            ambiguousAssets = v21, 
            loneMeshParts = v42, 
            close = function() --[[ Line: 171 ]] --[[ Name: close ]]
                -- upvalues: v22 (copy), v43 (copy)
                v22({});
                v43({});
            end
        }));
    end
};