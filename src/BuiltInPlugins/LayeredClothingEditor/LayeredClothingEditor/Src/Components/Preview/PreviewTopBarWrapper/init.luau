local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Components_0 = v4.Components;
local l_ConfirmCancelDialog_0 = l_Components_0.ConfirmCancelDialog;
local l_ConfirmDialog_0 = l_Components_0.ConfirmDialog;
local l_PreviewTopBar_0 = l_Components_0.PreviewTopBar;
local l_AccessoryAndBodyToolShared_0 = v4.Util.AccessoryAndBodyToolShared;
local _ = l_AccessoryAndBodyToolShared_0.Constants;
local _ = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local l_PreviewFolderManager_0 = l_AccessoryAndBodyToolShared_0.PreviewFolderManager;
local v14 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v14.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v14.Util;
local _ = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local v20 = require(l_Parent_0.Src.Actions.SetSearchFilter);
local v21 = require(l_Parent_0.Src.Thunks.StartSelectingFromExplorer);
local v22 = require(l_Parent_0.Src.Thunks.FinishSelectingFromExplorer);
local v23 = require(l_Parent_0.Src.Thunks.DeleteUserAddedAssetForPreview);
local v24 = require(l_Parent_0.Src.Thunks.AddUserAddedAssetForPreview);
local l_EditingItemContext_0 = v4.Contexts.EditingItemContext;
local v26 = require(l_Parent_0.Src.Util.Constants);
local v27 = require(l_Parent_0.Src.Util.ShowDialog);
local v28 = v1.PureComponent:extend("PreviewTopBarWrapper");
l_Typecheck_0.wrap(v28, script);
v28.init = function(v29) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_PreviewFolderManager_0 (copy), v26 (copy), l_PreviewConstantsInterface_0 (copy), v27 (copy), l_ConfirmCancelDialog_0 (copy), l_ConfirmDialog_0 (copy)
    v29.previewFolder = l_PreviewFolderManager_0.new();
    v29.onSearchRequested = function(v30) --[[ Line: 60 ]]
        -- upvalues: v29 (copy)
        v29.props.SetSearchFilter(v30);
    end;
    v29.onClickAddNewInstance = function() --[[ Line: 64 ]]
        -- upvalues: v29 (copy), v26 (ref)
        local l_props_0 = v29.props;
        local v32 = l_props_0.Localization:getText("Preview", "PanelBlockerAddItemWithEscape");
        l_props_0.StartSelectingFromExplorer(v26.SELECTOR_MODE.Preview, v32);
    end;
    v29.getTabForInstance = function(v33) --[[ Line: 71 ]]
        -- upvalues: l_PreviewConstantsInterface_0 (ref), v29 (copy)
        for v34, _ in pairs(l_PreviewConstantsInterface_0.getTabs()) do
            if v29.isInstanceValidForTab(v34, v33) then
                return v34;
            end;
        end;
    end;
    v29.isInstanceValidForTab = function(v36, v37) --[[ Line: 79 ]]
        -- upvalues: v29 (copy), l_PreviewConstantsInterface_0 (ref)
        local v38 = v29.props.EditingItemContext:getItem();
        local v39 = l_PreviewConstantsInterface_0.getTabInfo(v36);
        if not v39 or not v39.IsSelectedInstanceValid(v37) then
            return false;
        else
            local v40 = v37:FindFirstAncestor("LayeredClothingEditorPreview") ~= nil;
            local v41 = v37 == v38;
            local v42 = v37 == v38.Parent;
            return not (v40 or v41 or v42);
        end;
    end;
    v29.isSelectedInstanceValid = function(v43) --[[ Line: 93 ]]
        -- upvalues: v29 (copy)
        if v29.getTabForInstance(v43) then
            return true;
        elseif v43:IsA("Folder") then
            return true;
        else
            return false;
        end;
    end;
    v29.onInstanceSelectorValidSelection = function(v44) --[[ Line: 107 ]]
        -- upvalues: v29 (copy), v27 (ref), l_ConfirmCancelDialog_0 (ref)
        local l_props_1 = v29.props;
        local l_FinishSelectingFromExplorer_0 = l_props_1.FinishSelectingFromExplorer;
        local v47 = v29.props.Localization:getText("Preview", "ConfirmAddTile", {
            itemName = v44.Name
        });
        local v48 = v29.props.Localization:getText("Preview", "ConfirmAddTiles", {
            itemName = v44.Name
        });
        local v49 = if v44:IsA("Folder") then v48 else v47;
        v27(l_props_1.Plugin, l_props_1.Localization, l_ConfirmCancelDialog_0, {
            Text = v49, 
            OnClose = l_FinishSelectingFromExplorer_0, 
            OnConfirm = function() --[[ Line: 120 ]] --[[ Name: OnConfirm ]]
                -- upvalues: l_FinishSelectingFromExplorer_0 (copy), v44 (copy), v29 (ref), l_props_1 (copy)
                l_FinishSelectingFromExplorer_0(v44);
                local v50 = v29.getTabForInstance(v44);
                if v50 then
                    l_props_1.AddUserAddedAssetForPreview(v50, v44:Clone());
                    return;
                else
                    if v44:IsA("Folder") then
                        v29.previewFolder:addFolderPath(v44);
                        v29.previewFolder:addDirtyFolders(v29.props.UserAddedAssets, v29.isInstanceValidForTab, v29.props.AddUserAddedAssetForPreview);
                    end;
                    return;
                end;
            end
        });
    end;
    v29.onInstanceSelectorInvalidSelection = function(_) --[[ Line: 138 ]]
        -- upvalues: v29 (copy), v27 (ref), l_ConfirmDialog_0 (ref)
        local l_props_2 = v29.props;
        local l_FinishSelectingFromExplorer_1 = l_props_2.FinishSelectingFromExplorer;
        local l_Localization_0 = l_props_2.Localization;
        v27(l_props_2.Plugin, l_props_2.Localization, l_ConfirmDialog_0, {
            Text = l_Localization_0:getText("Preview", "InvalidAdd"), 
            OnClose = l_FinishSelectingFromExplorer_1
        });
    end;
end;
v28.render = function(v55) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_PreviewTopBar_0 (copy)
    local l_layoutOrder_0 = v55.props.layoutOrder;
    return v1.createElement(l_PreviewTopBar_0, {
        LayoutOrder = l_layoutOrder_0, 
        OnSearchRequested = v55.onSearchRequested, 
        IsSelectedInstanceValid = v55.isSelectedInstanceValid, 
        OnClickAddNewInstance = v55.onClickAddNewInstance, 
        OnInstanceSelectorValidSelection = v55.onInstanceSelectorValidSelection, 
        OnInstanceSelectorInvalidSelection = v55.onInstanceSelectorInvalidSelection
    });
end;
v28.didMount = function(v57) --[[ Line: 163 ]] --[[ Name: didMount ]]
    local _ = v57.props;
    if not next(v57.props.UserAddedAssets) then
        v57.previewFolder:resetAllFoldersAttributes();
    end;
    v57.previewFolder:cleanDirtyFolders(v57.props.UserAddedAssets, v57.props.DeleteUserAddedAssetForPreview);
    v57.previewFolder:addDirtyFolders(v57.props.UserAddedAssets, v57.isInstanceValidForTab, v57.props.AddUserAddedAssetForPreview);
end;
v28 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    EditingItemContext = l_EditingItemContext_0
})(v28);
return v2.connect(function(v59, _) --[[ Line: 185 ]] --[[ Name: mapStateToProps ]]
    return {
        UserAddedAssets = v59.previewStatus.userAddedAssets
    };
end, function(v61) --[[ Line: 192 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy)
    return {
        SetSearchFilter = function(v62) --[[ Line: 194 ]] --[[ Name: SetSearchFilter ]]
            -- upvalues: v61 (copy), v20 (ref)
            v61(v20(v62));
        end, 
        StartSelectingFromExplorer = function(v63, v64) --[[ Line: 197 ]] --[[ Name: StartSelectingFromExplorer ]]
            -- upvalues: v61 (copy), v21 (ref)
            v61(v21(v63, v64));
        end, 
        FinishSelectingFromExplorer = function(_) --[[ Line: 200 ]] --[[ Name: FinishSelectingFromExplorer ]]
            -- upvalues: v61 (copy), v22 (ref)
            v61(v22());
        end, 
        DeleteUserAddedAssetForPreview = function(v66, v67) --[[ Line: 203 ]] --[[ Name: DeleteUserAddedAssetForPreview ]]
            -- upvalues: v61 (copy), v23 (ref)
            v61(v23(v66, v67));
        end, 
        AddUserAddedAssetForPreview = function(v68, v69) --[[ Line: 206 ]] --[[ Name: AddUserAddedAssetForPreview ]]
            -- upvalues: v61 (copy), v24 (ref)
            v61(v24(v68, v69));
        end
    };
end)(v28);