local _ = game:GetService("InsertService");
local _ = game:GetService("HttpService");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Workspace_0 = game.Workspace;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Packages.Cryo);
local v6 = require(l_Parent_0.Packages.Roact);
local v7 = require(l_Parent_0.Packages.RoactRodux);
local v8 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v8.Util.AccessoryAndBodyToolShared;
local l_Mannequin_0 = l_AccessoryAndBodyToolShared_0.Mannequin;
local _ = l_AccessoryAndBodyToolShared_0.PreviewUtil;
local l_AvatarUtil_0 = l_AccessoryAndBodyToolShared_0.AvatarUtil;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_EditingItemContext_0 = v8.Contexts.EditingItemContext;
local l_LuaMeshEditingModuleContext_0 = v8.Contexts.LuaMeshEditingModuleContext;
local l_MannequinContext_0 = v8.Contexts.MannequinContext;
local v18 = require(l_Parent_0.Src.Actions.SetAccessoryTypeInfo);
local v19 = require(l_Parent_0.Src.Thunks.VerifyBounds);
local v20 = require(l_Parent_0.Src.Thunks.SelectEditingItem);
local v21 = require(l_Parent_0.Src.Util.Constants);
local v22 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v23 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v23.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Typecheck_0 = v23.Util.Typecheck;
local l_GetFFlagUseModelCageForAccessoryFittingTool_0 = v8.Flags.GetFFlagUseModelCageForAccessoryFittingTool;
local v28 = v6.PureComponent:extend("SelectedEditingItem");
l_Typecheck_0.wrap(v28, script);
local function v32(v29) --[[ Line: 54 ]] --[[ Name: onMeshDataChanged ]]
    -- upvalues: v22 (copy), v21 (copy)
    local l_Analytics_0 = v29.props.Analytics;
    local l_v22_0 = v22;
    l_v22_0.CageEdits = l_v22_0.CageEdits + 1;
    if not v22.FirstAction then
        v22.FirstAction = v21.ACTIONS.EditCage;
        l_Analytics_0:getHandler("FirstAction")(v22.FirstAction);
    end;
    v29:setState({
        temp = {}
    });
end;
local function v37(v33) --[[ Line: 65 ]] --[[ Name: connectCageDataChanged ]]
    -- upvalues: v32 (copy)
    local l_LuaMeshEditingModuleContext_1 = v33.props.LuaMeshEditingModuleContext;
    local v35 = l_LuaMeshEditingModuleContext_1:getOuterCageContext();
    local v36 = l_LuaMeshEditingModuleContext_1:getInnerCageContext();
    if v35 then
        if v33.outerCageDataChanged then
            v33.outerCageDataChanged:Disconnect();
        end;
        v33.outerCageDataChanged = v35:getMeshDataChangedSignal():Connect(function() --[[ Line: 74 ]]
            -- upvalues: v32 (ref), v33 (copy)
            v32(v33);
        end);
    end;
    if v36 then
        if v33.innerCageDataChanged then
            v33.innerCageDataChanged:Disconnect();
        end;
        v33.innerCageDataChanged = v36:getMeshDataChangedSignal():Connect(function() --[[ Line: 83 ]]
            -- upvalues: v32 (ref), v33 (copy)
            v32(v33);
        end);
    end;
end;
local function v60(v38, v39) --[[ Line: 89 ]] --[[ Name: onMannequinChanged ]]
    -- upvalues: l_ItemCharacteristics_0 (copy), l_AvatarUtil_0 (copy), l_AccessoryUtil_0 (copy), v37 (copy), l_ChangeHistoryService_0 (copy)
    local l_props_0 = v38.props;
    local l_ItemSize_0 = l_props_0.ItemSize;
    local l_MeshScale_0 = l_props_0.MeshScale;
    local l_AttachmentPoint_0 = l_props_0.AttachmentPoint;
    local l_AccessoryTypeInfo_0 = l_props_0.AccessoryTypeInfo;
    local l_VerifyBounds_0 = l_props_0.VerifyBounds;
    local _ = l_props_0.EditingCage;
    local _ = l_props_0.EditingItemContext;
    local l_LuaMeshEditingModuleContext_2 = l_props_0.LuaMeshEditingModuleContext;
    local v49 = l_LuaMeshEditingModuleContext_2:getOuterCageContext();
    local v50 = l_LuaMeshEditingModuleContext_2:getInnerCageContext();
    local l_Analytics_1 = l_props_0.Analytics;
    local l_model_0 = v38.mannequin.model;
    local l_sourceDisplayItem_0 = v38.mannequin.sourceDisplayItem;
    local l_displayItem_0 = v38.mannequin.displayItem;
    if not l_ItemCharacteristics_0.hasAnyCage(l_displayItem_0) then
        l_model_0.Archivable = true;
        l_displayItem_0.Archivable = true;
    end;
    l_AvatarUtil_0:positionAvatarNextTo(l_model_0, l_sourceDisplayItem_0, true, function() --[[ Line: 115 ]]
        -- upvalues: v39 (copy), l_ItemSize_0 (copy), l_displayItem_0 (copy), l_MeshScale_0 (copy), l_AccessoryUtil_0 (ref), l_AccessoryTypeInfo_0 (copy), l_AttachmentPoint_0 (copy), v38 (copy), v49 (copy), v50 (copy), l_VerifyBounds_0 (copy), l_LuaMeshEditingModuleContext_2 (copy), l_Analytics_1 (copy), l_AvatarUtil_0 (ref), l_model_0 (copy), v37 (ref), l_ChangeHistoryService_0 (ref)
        local v55 = if v39 then l_ItemSize_0 else l_displayItem_0.Size;
        local v56 = nil;
        v56 = if v39 then l_MeshScale_0 else l_AccessoryUtil_0:getSpecialMeshScale(l_displayItem_0);
        local v57 = if l_AccessoryTypeInfo_0 then l_AccessoryTypeInfo_0.Name else "";
        local l_AttachmentCFrame_0 = l_AttachmentPoint_0.AttachmentCFrame;
        local l_ItemCFrame_0 = l_AttachmentPoint_0.ItemCFrame;
        if v38.itemCFrameLocalToAttachmentPoint then
            l_AttachmentCFrame_0 = v38.itemCFrameLocalToAttachmentPoint:inverse();
            l_ItemCFrame_0 = v38.itemCFrameLocalToAttachmentPoint;
            v38.itemCFrameLocalToAttachmentPoint = nil;
        end;
        v38.mannequin:transformLayer(1, v55, l_AttachmentCFrame_0, l_ItemCFrame_0, v57, v56);
        if v49 then
            v38.mannequin:deformLayer(1, v49:getVertexData(), Enum.CageType.Outer);
        end;
        if v50 then
            v38.mannequin:deformLayer(1, v50:getVertexData(), Enum.CageType.Inner);
        end;
        v38.props.EditingItemContext:setEditingItem(l_displayItem_0);
        l_VerifyBounds_0(l_displayItem_0);
        if not v39 then
            v38.props.SelectEditingItem(l_LuaMeshEditingModuleContext_2, l_displayItem_0, l_Analytics_1);
            l_AvatarUtil_0:focusCameraOnAvatar(l_model_0);
            v37(v38);
        end;
        l_LuaMeshEditingModuleContext_2:updateCageLocationsFromInstance(l_displayItem_0);
        l_ChangeHistoryService_0:ResetWaypoints();
    end);
end;
v28.init = function(v61) --[[ Line: 160 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagUseModelCageForAccessoryFittingTool_0 (copy), l_Mannequin_0 (copy), l_Workspace_0 (copy), v60 (copy), v5 (copy)
    v61.mannequin = nil;
    v61.editingItem = nil;
    v61.sourceItemWithUniqueDeformerNames = nil;
    v61.onSourceItemChanged = function(v62) --[[ Line: 165 ]]
        -- upvalues: v61 (copy), l_GetFFlagUseModelCageForAccessoryFittingTool_0 (ref), l_Mannequin_0 (ref), l_Workspace_0 (ref), v60 (ref), v5 (ref)
        if v62 ~= v61.sourceItem then
            if v61.mannequin then
                v61.mannequin:destroy();
                v61.mannequin = nil;
            end;
            v61.props.EditingItemContext:setSourceItemWithUniqueDeformerNames(nil);
            if v62 then
                local v63 = nil;
                v63 = if l_GetFFlagUseModelCageForAccessoryFittingTool_0() then v61.props.MannequinContext:createMannequinForClothing(v62) else v61.props.MannequinContext:createMannequinModel();
                v61.mannequin = l_Mannequin_0.new(v62, v63, l_Workspace_0, function() --[[ Line: 180 ]]
                    -- upvalues: v60 (ref), v61 (ref)
                    v60(v61, true);
                end);
                v61.props.EditingItemContext:setSourceItemWithUniqueDeformerNames(v61.mannequin.sourceDisplayItem);
                v61.props.SetAccessoryTypeInfo(v5.None);
                v60(v61, false);
            end;
        end;
        v61.sourceItem = v62;
    end;
end;
v28.render = function(v64) --[[ Line: 194 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy)
    local l_props_1 = v64.props;
    local l_EditingCage_1 = l_props_1.EditingCage;
    if l_EditingCage_1 == v21.EDIT_MODE.Mesh then
        return nil;
    else
        local l_LuaMeshEditingModuleContext_3 = l_props_1.LuaMeshEditingModuleContext;
        local v68 = if l_EditingCage_1 == Enum.CageType.Outer then l_LuaMeshEditingModuleContext_3:getOuterCageContext() else l_LuaMeshEditingModuleContext_3:getInnerCageContext();
        if v68 and v64.mannequin then
            v64.mannequin:deformLayer(1, v68:getVertexData(), l_EditingCage_1);
        end;
        return nil;
    end;
end;
v28.didMount = function(v69) --[[ Line: 213 ]] --[[ Name: didMount ]]
    v69.SourceItemChangedHandle = v69.props.EditingItemContext:getSourceItemChangedSignal():Connect(v69.onSourceItemChanged);
end;
v28.didUpdate = function(v70, v71) --[[ Line: 219 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ItemCharacteristics_0 (copy), l_AccessoryUtil_0 (copy)
    local l_AccessoryTypeInfo_1 = v70.props.AccessoryTypeInfo;
    if l_AccessoryTypeInfo_1 and v71.AccessoryTypeInfo ~= l_AccessoryTypeInfo_1 and v70.mannequin then
        if l_AccessoryTypeInfo_1 then
            local v73 = v70.sourceItem and v70.sourceItem.Parent;
            if v73 and l_ItemCharacteristics_0.isAvatar(v73) then
                v70.itemCFrameLocalToAttachmentPoint = l_AccessoryUtil_0:getItemCFrameRelativeToAttachmentPoint(l_AccessoryTypeInfo_1.Name, v73, v70.sourceItem);
            end;
        end;
        v70.mannequin:reset();
    end;
end;
v28.willUnmount = function(v74) --[[ Line: 236 ]] --[[ Name: willUnmount ]]
    if v74.mannequin then
        v74.mannequin:destroy();
        v74.mannequin = nil;
    end;
    v74.sourceItem = nil;
    if v74.SourceItemChangedHandle then
        v74.SourceItemChangedHandle:Disconnect();
        v74.SourceItemChangedHandle = nil;
    end;
    if v74.outerCageDataChanged then
        v74.outerCageDataChanged:Disconnect();
        v74.outerCageDataChanged = nil;
    end;
    if v74.innerCageDataChanged then
        v74.innerCageDataChanged:Disconnect();
        v74.innerCageDataChanged = nil;
    end;
end;
local function v78(v75, _) --[[ Line: 259 ]] --[[ Name: mapStateToProps ]]
    local l_selectItem_0 = v75.selectItem;
    return {
        AccessoryTypeInfo = l_selectItem_0.accessoryTypeInfo, 
        AttachmentPoint = l_selectItem_0.attachmentPoint, 
        ItemSize = l_selectItem_0.size, 
        MeshScale = l_selectItem_0.meshScale, 
        EditingCage = l_selectItem_0.editingCage
    };
end;
local function v85(v79) --[[ Line: 271 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v20 (copy), v19 (copy)
    return {
        SetAccessoryTypeInfo = function(v80) --[[ Line: 273 ]] --[[ Name: SetAccessoryTypeInfo ]]
            -- upvalues: v79 (copy), v18 (ref)
            v79(v18(v80));
        end, 
        SelectEditingItem = function(v81, v82, v83) --[[ Line: 276 ]] --[[ Name: SelectEditingItem ]]
            -- upvalues: v79 (copy), v20 (ref)
            v79(v20(v81, v82, v83));
        end, 
        VerifyBounds = function(v84) --[[ Line: 279 ]] --[[ Name: VerifyBounds ]]
            -- upvalues: v79 (copy), v19 (ref)
            v79(v19(v84));
        end
    };
end;
v28 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    EditingItemContext = l_EditingItemContext_0, 
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0, 
    MannequinContext = l_MannequinContext_0
})(v28);
return v7.connect(v78, v85)(v28);