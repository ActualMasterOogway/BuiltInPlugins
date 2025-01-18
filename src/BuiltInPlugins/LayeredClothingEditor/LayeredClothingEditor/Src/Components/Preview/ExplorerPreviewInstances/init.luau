local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v5.Util.AccessoryAndBodyToolShared;
local l_PreviewUtil_0 = l_AccessoryAndBodyToolShared_0.PreviewUtil;
local _ = l_AccessoryAndBodyToolShared_0.AvatarUtil;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local l_PreviewItemSelector_0 = v5.Components.PreviewItemSelector;
local l_EditingItemContext_0 = v5.Contexts.EditingItemContext;
local l_PreviewContext_0 = v5.Contexts.PreviewContext;
local l_AssetServiceWrapper_0 = v5.Contexts.AssetServiceWrapper;
local l_StudioServiceWrapper_0 = v5.Contexts.StudioServiceWrapper;
local v16 = require(l_Parent_0.Src.Actions.SelectPreviewTab);
local v17 = require(l_Parent_0.Src.Thunks.UpdatePreviewAssetsSelected);
local v18 = require(l_Parent_0.Src.Thunks.AddUserAddedAssetForPreview);
local v19 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v19.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Typecheck_0 = v19.Util.Typecheck;
local v23 = require(l_Parent_0.Src.Util.Constants);
local v24 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v25 = v2.PureComponent:extend("ExplorerPreviewInstances");
l_Typecheck_0.wrap(v25, script);
local l_GetFFlagAFTSelectHandleOnly_0 = v5.Flags.GetFFlagAFTSelectHandleOnly;
local function v43(v27) --[[ Line: 55 ]] --[[ Name: onPreviewSelectionChanged ]]
    -- upvalues: l_PreviewConstants_0 (copy), l_PreviewUtil_0 (copy)
    local l_props_0 = v27.props;
    local l_SelectedAssets_0 = l_props_0.SelectedAssets;
    local l_UserAddedAssets_0 = l_props_0.UserAddedAssets;
    local v31 = l_props_0.AssetServiceWrapper:get();
    local v32 = l_props_0.EditingItemContext:getItem();
    local l_PreviewContext_1 = l_props_0.PreviewContext;
    local l_Avatars_0 = l_PreviewConstants_0.TABS_KEYS.Avatars;
    local l_Clothing_0 = l_PreviewConstants_0.TABS_KEYS.Clothing;
    local v36 = l_SelectedAssets_0[l_Avatars_0] or {};
    local v37 = l_SelectedAssets_0[l_Clothing_0] or {};
    local v38 = l_PreviewUtil_0.createPreviewAvatars(v36, l_UserAddedAssets_0[l_Avatars_0], nil, v31);
    local v39 = l_PreviewUtil_0.createPreviewAvatars(v36, l_UserAddedAssets_0[l_Avatars_0], v27.folderRef.current, v31);
    local l_Archivable_0 = v32.Archivable;
    v32.Archivable = true;
    local v41 = v32:Clone();
    v32.Archivable = l_Archivable_0;
    l_PreviewContext_1:setAvatars(v38);
    l_PreviewContext_1:setStorageAvatars(v39);
    local v42 = l_PreviewContext_1:getAllAvatars();
    l_PreviewUtil_0.addPreviewClothingFromInstances(v42, {
        v41
    }, true);
    l_PreviewUtil_0.addPreviewClothingFromIds(v42, v37, l_UserAddedAssets_0[l_Clothing_0], v31);
    if l_PreviewContext_1:getCurrentPreviewAvatarIndex() > #l_PreviewContext_1:getAvatars() then
        l_PreviewContext_1:setPreviewAvatarIndex(1);
    end;
end;
local function v56(v44, _) --[[ Line: 104 ]] --[[ Name: transformOrDeformPreviewLayers ]]
    -- upvalues: v23 (copy)
    local l_props_1 = v44.props;
    local l_AttachmentPoint_0 = l_props_1.AttachmentPoint;
    local l_AccessoryTypeInfo_0 = l_props_1.AccessoryTypeInfo;
    local l_PreviewContext_2 = l_props_1.PreviewContext;
    local l_EditingCage_0 = l_props_1.EditingCage;
    local l_ItemSize_0 = l_props_1.ItemSize;
    local l_MeshScale_0 = l_props_1.MeshScale;
    local v53 = l_PreviewContext_2:getAllAvatars();
    for _, v55 in ipairs(v53) do
        if l_EditingCage_0 == v23.EDIT_MODE.Mesh then
            v55:transformLayer(1, l_ItemSize_0, l_AttachmentPoint_0.AttachmentCFrame, l_AttachmentPoint_0.ItemCFrame, l_AccessoryTypeInfo_0.Name, l_MeshScale_0);
        end;
    end;
end;
local function _(v57, v58) --[[ Line: 130 ]] --[[ Name: updatePreviewAssets ]]
    -- upvalues: v43 (copy), v56 (copy)
    coroutine.wrap(function() --[[ Line: 131 ]]
        -- upvalues: v57 (copy), v58 (copy), v43 (ref), v56 (ref)
        while v57.isUpdateInProgress do
            wait();
        end;
        v57.isUpdateInProgress = true;
        if v58 then
            v43(v57);
        end;
        v56(v57, v58);
        if v58 then
            v57.props.PreviewContext:updatePreviewModel();
        end;
        v57.isUpdateInProgress = false;
    end)();
end;
local function v65(v60, v61, v62, v63) --[[ Line: 154 ]] --[[ Name: equipUserAddedAsset ]]
    -- upvalues: v24 (copy), v23 (copy)
    if v61 then
        v60.props.UpdatePreviewAssetsSelected(v61.uniqueId, not v62);
        if not v62 then
            local l_Analytics_0 = v60.props.Analytics;
            if not v24.FirstAction then
                v24.FirstAction = v23.ACTIONS.Preview;
                l_Analytics_0:getHandler("FirstAction")(v24.FirstAction);
            end;
            l_Analytics_0:getHandler("PreviewAssetSelected")(true, v63, v61.uniqueId, false);
        end;
    end;
end;
local function v73(v66, v67) --[[ Line: 168 ]] --[[ Name: findUserAddedAsset ]]
    local l_UserAddedAssets_1 = v66.props.UserAddedAssets;
    for _, v70 in pairs(l_UserAddedAssets_1) do
        for _, v72 in pairs(v70) do
            if v72.instance == v67 then
                return v72;
            end;
        end;
    end;
end;
local function _(v74) --[[ Line: 179 ]] --[[ Name: getTab ]]
    -- upvalues: l_ItemCharacteristics_0 (copy), l_PreviewConstants_0 (copy)
    if l_ItemCharacteristics_0.isClothes(v74) then
        return l_PreviewConstants_0.TABS_KEYS.Clothing;
    elseif l_ItemCharacteristics_0.isAvatar(v74) then
        return l_PreviewConstants_0.TABS_KEYS.Avatars;
    else
        return nil;
    end;
end;
v25.init = function(v76) --[[ Line: 188 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v23 (copy), l_ItemCharacteristics_0 (copy), l_PreviewConstants_0 (copy), v73 (copy), v3 (copy), v65 (copy)
    v76.folderRef = v2.createRef();
    v76.isUpdateInProgress = false;
    v76.isSelectedInstanceValid = function(v77) --[[ Line: 192 ]]
        -- upvalues: v76 (copy), v23 (ref), l_ItemCharacteristics_0 (ref), l_PreviewConstants_0 (ref)
        local v78 = v76.props.EditingItemContext:getItem();
        if v77 == v78.Parent or v77:FindFirstAncestor(v78.Parent.Name) or v77:FindFirstAncestor(v23.PREVIEW_FOLDER_NAME) then
            return false;
        else
            return (if l_ItemCharacteristics_0.isClothes(v77) then l_PreviewConstants_0.TABS_KEYS.Clothing else if l_ItemCharacteristics_0.isAvatar(v77) then l_PreviewConstants_0.TABS_KEYS.Avatars else nil) ~= nil;
        end;
    end;
    v76.isEquipped = function(v79) --[[ Line: 207 ]]
        -- upvalues: v73 (ref), v76 (copy), l_ItemCharacteristics_0 (ref), l_PreviewConstants_0 (ref), v3 (ref)
        local v80 = v73(v76, v79);
        local v81 = if l_ItemCharacteristics_0.isClothes(v79) then l_PreviewConstants_0.TABS_KEYS.Clothing else if l_ItemCharacteristics_0.isAvatar(v79) then l_PreviewConstants_0.TABS_KEYS.Avatars else nil;
        if v80 and v81 then
            local v82 = v76.props.SelectedAssets[v81];
            if v82 and v3.List.find(v82, v80.uniqueId) then
                return true;
            end;
        end;
        return false;
    end;
    v76.onValidSelection = function(v83, v84) --[[ Line: 219 ]]
        -- upvalues: l_ItemCharacteristics_0 (ref), l_PreviewConstants_0 (ref), v76 (copy), v73 (ref), v65 (ref)
        local v85 = if l_ItemCharacteristics_0.isClothes(v83) then l_PreviewConstants_0.TABS_KEYS.Clothing else if l_ItemCharacteristics_0.isAvatar(v83) then l_PreviewConstants_0.TABS_KEYS.Avatars else nil;
        if not v85 then
            return;
        else
            v76.props.SelectPreviewTab(v85);
            local v86 = v73(v76, v83);
            if not v86 then
                v76.props.AddUserAddedAssetForPreview(v85, v83, function(v87) --[[ Line: 228 ]]
                    -- upvalues: v65 (ref), v76 (ref), v84 (copy), v85 (copy)
                    v65(v76, v87, v84, v85);
                end);
                return;
            else
                v65(v76, v86, v84, v85);
                return;
            end;
        end;
    end;
end;
v25.getOrCreatePreviewFolder = function(v88) --[[ Line: 237 ]] --[[ Name: getOrCreatePreviewFolder ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v23 (copy)
    v88.previewFolder = l_ReplicatedStorage_0:FindFirstChild(v23.PREVIEW_FOLDER_NAME);
    if not v88.previewFolder then
        v88.previewFolder = Instance.new("Folder");
        v88.previewFolder.Name = v23.PREVIEW_FOLDER_NAME;
        v88.previewFolder.Archivable = true;
        v88.previewFolder.Parent = l_ReplicatedStorage_0;
    end;
end;
v25.render = function(v89) --[[ Line: 247 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_GetFFlagAFTSelectHandleOnly_0 (copy), l_PreviewItemSelector_0 (copy)
    local l_props_2 = v89.props;
    local l_WorkspacePreviewSelectionEnabled_0 = l_props_2.WorkspacePreviewSelectionEnabled;
    local l_Localization_0 = l_props_2.Localization;
    local v93 = l_props_2.StudioServiceWrapper:get();
    v89:getOrCreatePreviewFolder();
    local l_v93_UserId_0 = v93:GetUserId();
    return v2.createElement(v2.Portal, {
        target = v89.previewFolder
    }, {
        [l_v93_UserId_0] = v2.createElement("Folder", {
            [v2.Ref] = v89.folderRef, 
            Archivable = true
        }, {
            PreviewSelector = if not l_GetFFlagAFTSelectHandleOnly_0() or l_WorkspacePreviewSelectionEnabled_0 then v2.createElement(l_PreviewItemSelector_0, {
                IsSelectedInstanceValid = v89.isSelectedInstanceValid, 
                IsEquipped = v89.isEquipped, 
                OnValidSelection = v89.onValidSelection, 
                TooltipText = l_Localization_0:getText("Preview", "Tooltip")
            }) else nil
        })
    });
end;
v25.didUpdate = function(v95, v96) --[[ Line: 276 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_PreviewConstants_0 (copy), v43 (copy), v56 (copy)
    if v96.SelectedAssets[l_PreviewConstants_0.TABS_KEYS.Avatars] ~= v95.props.SelectedAssets[l_PreviewConstants_0.TABS_KEYS.Avatars] or v96.SelectedAssets[l_PreviewConstants_0.TABS_KEYS.Clothing] ~= v95.props.SelectedAssets[l_PreviewConstants_0.TABS_KEYS.Clothing] then
        local l_wrap_0 = coroutine.wrap;
        local v98 = true;
        l_wrap_0(function() --[[ Line: 131 ]]
            -- upvalues: v95 (copy), v98 (copy), v43 (ref), v56 (ref)
            while v95.isUpdateInProgress do
                wait();
            end;
            v95.isUpdateInProgress = true;
            if v98 then
                v43(v95);
            end;
            v56(v95, v98);
            if v98 then
                v95.props.PreviewContext:updatePreviewModel();
            end;
            v95.isUpdateInProgress = false;
        end)();
        return;
    else
        local l_wrap_1 = coroutine.wrap;
        local v100 = false;
        l_wrap_1(function() --[[ Line: 131 ]]
            -- upvalues: v95 (copy), v100 (copy), v43 (ref), v56 (ref)
            while v95.isUpdateInProgress do
                wait();
            end;
            v95.isUpdateInProgress = true;
            if v100 then
                v43(v95);
            end;
            v56(v95, v100);
            if v100 then
                v95.props.PreviewContext:updatePreviewModel();
            end;
            v95.isUpdateInProgress = false;
        end)();
        return;
    end;
end;
local function v105(v101, _) --[[ Line: 289 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_GetFFlagAFTSelectHandleOnly_0 (copy)
    local l_previewStatus_0 = v101.previewStatus;
    local l_selectItem_0 = v101.selectItem;
    return {
        AttachmentPoint = l_selectItem_0.attachmentPoint, 
        AccessoryTypeInfo = l_selectItem_0.accessoryTypeInfo, 
        ItemSize = l_selectItem_0.size, 
        MeshScale = l_selectItem_0.meshScale, 
        SelectedAssets = l_previewStatus_0.selectedAssets, 
        EditingCage = l_selectItem_0.editingCage, 
        UserAddedAssets = l_previewStatus_0.userAddedAssets, 
        WorkspacePreviewSelectionEnabled = if l_GetFFlagAFTSelectHandleOnly_0() then l_previewStatus_0.workspacePreviewSelectionEnabled else nil
    };
end;
local function v113(v106) --[[ Line: 307 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v17 (copy), v18 (copy), v16 (copy)
    return {
        UpdatePreviewAssetsSelected = function(v107, v108) --[[ Line: 309 ]] --[[ Name: UpdatePreviewAssetsSelected ]]
            -- upvalues: v106 (copy), v17 (ref)
            v106(v17(v107, v108));
        end, 
        AddUserAddedAssetForPreview = function(v109, v110, v111) --[[ Line: 313 ]] --[[ Name: AddUserAddedAssetForPreview ]]
            -- upvalues: v106 (copy), v18 (ref)
            v106(v18(v109, v110, v111));
        end, 
        SelectPreviewTab = function(v112) --[[ Line: 317 ]] --[[ Name: SelectPreviewTab ]]
            -- upvalues: v106 (copy), v16 (ref)
            v106(v16(v112));
        end
    };
end;
v25 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    EditingItemContext = l_EditingItemContext_0, 
    PreviewContext = l_PreviewContext_0, 
    AssetServiceWrapper = l_AssetServiceWrapper_0, 
    Localization = l_ContextServices_0.Localization, 
    StudioServiceWrapper = l_StudioServiceWrapper_0
})(v25);
return v4.connect(v105, v113)(v25);