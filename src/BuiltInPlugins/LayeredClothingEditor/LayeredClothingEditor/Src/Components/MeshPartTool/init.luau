local l_CoreGui_0 = game:GetService("CoreGui");
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v6.Util.AccessoryAndBodyToolShared;
local l_Constants_0 = l_AccessoryAndBodyToolShared_0.Constants;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local v11 = require(l_Parent_0.Src.Actions.SetAttachmentPoint);
local v12 = require(l_Parent_0.Src.Actions.SetItemSize);
local v13 = require(l_Parent_0.Src.Actions.SetMeshScale);
local v14 = require(l_Parent_0.Src.Thunks.VerifyBounds);
local v15 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerActivity);
local v16 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerMessage);
local v17 = require(l_Parent_0.Src.Actions.SetWorkspacePreviewSelectionEnabled);
local l_EditingItemContext_0 = v6.Contexts.EditingItemContext;
local l_Signals_0 = v6.Contexts.Signals;
local v20 = require(l_Parent_0.Src.Util.Constants);
local v21 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetFFlagAFTSelectHandleOnly_0 = v6.Flags.GetFFlagAFTSelectHandleOnly;
local v25 = v4.PureComponent:extend("MeshPartTool");
v25.getHandleAttachment = function(v26) --[[ Line: 44 ]] --[[ Name: getHandleAttachment ]]
    local l_props_0 = v26.props;
    return l_props_0.EditingItemContext:getItem():FindFirstChild(l_props_0.AccessoryTypeInfo.Name);
end;
v25.init = function(v28) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagAFTSelectHandleOnly_0 (copy), l_Selection_0 (copy), l_ChangeHistoryService_0 (copy), v21 (copy), v20 (copy), l_ItemCharacteristics_0 (copy), l_AccessoryUtil_0 (copy)
    v28.state = {
        matchingAttachment = nil
    };
    if l_GetFFlagAFTSelectHandleOnly_0() then
        v28.editingItemIsSelected = function() --[[ Line: 58 ]]
            -- upvalues: v28 (copy), l_Selection_0 (ref)
            local v29 = v28.props.EditingItemContext:getItem();
            for _, v31 in (l_Selection_0:Get()) do
                if v31 == v29 then
                    return true;
                end;
            end;
            return false;
        end;
        v28.onUndoRedo = function() --[[ Line: 71 ]]
            -- upvalues: v28 (copy)
            v28.placeAndScaleItem();
            v28.selectMeshPart();
        end;
        v28.onSelectionChanged = function() --[[ Line: 76 ]]
            -- upvalues: v28 (copy), l_ChangeHistoryService_0 (ref)
            local l_props_1 = v28.props;
            local v33 = v28.editingItemIsSelected();
            if not v33 and v28.active then
                v28:deactivate();
                l_ChangeHistoryService_0:ResetWaypoints();
                l_props_1.SetControlsPanelBlockerMessage(l_props_1.Localization:getText("Editor", "ResumeEditingRigid"));
                l_props_1.SetControlsPanelBlockerActivity(true);
                l_props_1.SetWorkspacePreviewSelectionEnabled(false);
                return;
            else
                if v33 and not v28.active then
                    v28:activate();
                    l_ChangeHistoryService_0:ResetWaypoints();
                    l_props_1.SetControlsPanelBlockerActivity(false);
                    l_props_1.SetWorkspacePreviewSelectionEnabled(true);
                end;
                return;
            end;
        end;
    end;
    v28.selectMeshPart = function() --[[ Line: 94 ]]
        -- upvalues: v28 (copy), l_Selection_0 (ref)
        local v34 = v28.props.EditingItemContext:getItem();
        if not v34 then
            return;
        else
            l_Selection_0:Set({
                v34
            });
            return;
        end;
    end;
    v28.adjustItem = function() --[[ Line: 106 ]]
        -- upvalues: v28 (copy), v21 (ref), v20 (ref)
        local l_Analytics_0 = v28.props.Analytics;
        if not v21.FirstAction then
            v21.FirstAction = v20.ACTIONS.AdjustAccessory;
            l_Analytics_0:getHandler("FirstAction")(v21.FirstAction);
        end;
        v28.placeAndScaleItem();
    end;
    v28.placeAndScaleItem = function() --[[ Line: 115 ]]
        -- upvalues: v28 (copy), l_ItemCharacteristics_0 (ref), l_AccessoryUtil_0 (ref)
        local l_props_2 = v28.props;
        local l_state_0 = v28.state;
        local v38 = l_props_2.EditingItemContext:getItem();
        local l_AccessoryTypeInfo_0 = l_props_2.AccessoryTypeInfo;
        if not v38 or not l_AccessoryTypeInfo_0 then
            return;
        else
            local l_matchingAttachment_0 = l_state_0.matchingAttachment;
            local l_v38_FirstChild_0 = v38:FindFirstChild(l_AccessoryTypeInfo_0.Name);
            if not l_v38_FirstChild_0 or not l_matchingAttachment_0 then
                return;
            else
                local l_WorldCFrame_0 = l_matchingAttachment_0.WorldCFrame;
                l_v38_FirstChild_0.CFrame = (l_WorldCFrame_0:inverse() * v38.CFrame):inverse();
                v28.props.SetAttachmentPoint({
                    ItemCFrame = l_WorldCFrame_0:inverse() * v38.CFrame, 
                    AttachmentCFrame = l_v38_FirstChild_0.CFrame
                });
                if l_ItemCharacteristics_0.isLegacyAccessory(v38) then
                    v28.props.SetMeshScale(l_AccessoryUtil_0:getSpecialMeshScale(v38));
                end;
                v28.props.SetItemSize(v38.Size);
                v28.props.VerifyBounds(v38, v28:getHandleAttachment());
                return;
            end;
        end;
    end;
    v28.onEditingItemChanged = function() --[[ Line: 147 ]]
        -- upvalues: v28 (copy), l_GetFFlagAFTSelectHandleOnly_0 (ref), l_AccessoryUtil_0 (ref), l_Selection_0 (ref)
        local v43 = v28.props.EditingItemContext:getItem();
        local l_AccessoryTypeInfo_1 = v28.props.AccessoryTypeInfo;
        if l_GetFFlagAFTSelectHandleOnly_0() then
            if v28.CFrameChanged then
                v28.CFrameChanged:Disconnect();
                v28.CFrameChanged = nil;
            end;
            if v28.SizeChanged then
                v28.SizeChanged:Disconnect();
                v28.SizeChanged = nil;
            end;
            if not v43 then
                return;
            elseif not v43:FindFirstChild(l_AccessoryTypeInfo_1.Name) then
                return;
            else
                local v45 = l_AccessoryUtil_0:findAvatarAttachmentByName(v43.Parent, l_AccessoryTypeInfo_1.Name);
                if not v45 then
                    return;
                else
                    v28:setState({
                        matchingAttachment = v45
                    });
                end;
            end;
        elseif not v43 then
            if v28.CFrameChanged then
                v28.CFrameChanged:Disconnect();
                v28.CFrameChanged = nil;
            end;
            if v28.SizeChanged then
                v28.SizeChanged:Disconnect();
                v28.SizeChanged = nil;
            end;
            return;
        else
            local l_v43_FirstChild_0 = v43:FindFirstChild(l_AccessoryTypeInfo_1.Name);
            local l_Weld_0 = v43:FindFirstChildWhichIsA("Weld");
            if not l_v43_FirstChild_0 or not l_Weld_0 then
                return;
            else
                local l_Part1_0 = l_Weld_0.Part1;
                if not l_Part1_0 then
                    return;
                else
                    local l_l_Part1_0_FirstChild_0 = l_Part1_0:FindFirstChild(l_v43_FirstChild_0.Name);
                    if not l_l_Part1_0_FirstChild_0 then
                        return;
                    else
                        v28:setState({
                            matchingAttachment = l_l_Part1_0_FirstChild_0
                        });
                    end;
                end;
            end;
        end;
        v28.CFrameChanged = v43:GetPropertyChangedSignal("CFrame"):Connect(v28.adjustItem);
        v28.SizeChanged = v43:GetPropertyChangedSignal("Size"):Connect(v28.adjustItem);
        l_Selection_0:Set({
            v43
        });
    end;
end;
v25.activate = function(v50) --[[ Line: 221 ]] --[[ Name: activate ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    v50.active = true;
    v50.onEditingItemChanged();
    v50.OnRedo = l_ChangeHistoryService_0.OnRedo:Connect(v50.onUndoRedo);
    v50.OnUndo = l_ChangeHistoryService_0.OnUndo:Connect(v50.onUndoRedo);
end;
v25.didMount = function(v51) --[[ Line: 229 ]] --[[ Name: didMount ]]
    -- upvalues: l_GetFFlagAFTSelectHandleOnly_0 (copy), l_ChangeHistoryService_0 (copy), v20 (copy), l_Selection_0 (copy)
    local l_props_3 = v51.props;
    v51.EditingItemChanged = l_props_3.EditingItemContext:getEditingItemChangedSignal():Connect(function(_) --[[ Line: 232 ]]
        -- upvalues: v51 (copy)
        v51.onEditingItemChanged();
    end);
    if l_GetFFlagAFTSelectHandleOnly_0() then
        v51:activate();
    else
        v51.onEditingItemChanged();
        v51.OnRedo = l_ChangeHistoryService_0.OnRedo:Connect(v51.placeAndScaleItem);
        v51.OnUndo = l_ChangeHistoryService_0.OnUndo:Connect(v51.placeAndScaleItem);
    end;
    v51.OnPluginWindowFocusedHandle = l_props_3.Signals:get(v20.SIGNAL_KEYS.PluginWindowFocused):Connect(v51.selectMeshPart);
    if l_GetFFlagAFTSelectHandleOnly_0() then
        v51.SelectionChangedHandle = l_Selection_0.SelectionChanged:Connect(v51.onSelectionChanged);
    end;
end;
v25.didUpdate = function(v54, v55, v56) --[[ Line: 253 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagAFTSelectHandleOnly_0 (copy)
    if v54.state.matchingAttachment ~= v56.matchingAttachment then
        v54.placeAndScaleItem();
    end;
    if l_GetFFlagAFTSelectHandleOnly_0() and v54.props.IsControlsPanelBlockerActive ~= v55.IsControlsPanelBlockerActive and not v54.props.IsControlsPanelBlockerActive then
        v54.selectMeshPart();
    end;
end;
v25.renderLinks = function(_, v58, v59, v60, v61, v62) --[[ Line: 267 ]] --[[ Name: renderLinks ]]
    -- upvalues: l_Constants_0 (copy), v4 (copy)
    local v63 = {};
    for _, v65 in ipairs(l_Constants_0.CUBE_EDGES) do
        local v66 = v65[1] * v59 + v61 + v60;
        local v67 = v65[2] * v59 + v61 + v60;
        local l_Magnitude_0 = (v66 - v67).Magnitude;
        local v69 = CFrame.new(Vector3.new(0, 0, 0, 0), (v67 - v66).Unit) + v66;
        table.insert(v63, v4.createElement("LineHandleAdornment", {
            Length = l_Magnitude_0, 
            CFrame = v69, 
            Adornee = v62, 
            Transparency = 0, 
            Color3 = v58.LineColor, 
            Thickness = v58.LineThickness, 
            ZIndex = 1, 
            Archivable = false, 
            AlwaysOnTop = false
        }));
    end;
    return v63;
end;
v25.renderBorderedBox = function(v70, v71, v72, v73, v74) --[[ Line: 295 ]] --[[ Name: renderBorderedBox ]]
    -- upvalues: v4 (copy)
    local l_props_4 = v70.props;
    local l_Stylizer_0 = l_props_4.Stylizer;
    local v77 = l_props_4.InBounds and l_Stylizer_0.InBoundsColor or l_Stylizer_0.OutBoundsColor;
    local v78 = v70:renderLinks(l_Stylizer_0, v71, v72, v73, v74);
    return v4.createElement("BoxHandleAdornment", {
        Adornee = v74, 
        CFrame = CFrame.new(v73 + v72), 
        Size = v71, 
        Transparency = l_Stylizer_0.Transparency, 
        Color3 = v77, 
        Archivable = false
    }, v78);
end;
v25.render = function(v79) --[[ Line: 312 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_CoreGui_0 (copy)
    local l_props_5 = v79.props;
    local l_state_1 = v79.state;
    local l_AccessoryTypeInfo_2 = l_props_5.AccessoryTypeInfo;
    local l_matchingAttachment_1 = l_state_1.matchingAttachment;
    if not l_matchingAttachment_1 or not l_AccessoryTypeInfo_2 then
        return nil;
    else
        local l_Bounds_0 = l_AccessoryTypeInfo_2.Bounds;
        local l_Offset_0 = l_AccessoryTypeInfo_2.Offset;
        local v86 = v79:getHandleAttachment();
        if not v86 then
            return nil;
        else
            local l_Parent_1 = l_matchingAttachment_1.Parent;
            local l_Position_0 = (v86.WorldCFrame * l_Parent_1.CFrame:inverse()).Position;
            return v4.createElement(v4.Portal, {
                target = l_CoreGui_0
            }, {
                BoundingBox = v79:renderBorderedBox(l_Bounds_0, l_Offset_0, l_Position_0, l_Parent_1)
            });
        end;
    end;
end;
v25.deactivate = function(v89) --[[ Line: 340 ]] --[[ Name: deactivate ]]
    v89.active = false;
    if v89.CFrameChanged then
        v89.CFrameChanged:Disconnect();
        v89.CFrameChanged = nil;
    end;
    if v89.SizeChanged then
        v89.SizeChanged:Disconnect();
        v89.SizeChanged = nil;
    end;
    if v89.OnRedo then
        v89.OnRedo:Disconnect();
        v89.OnRedo = nil;
    end;
    if v89.OnUndo then
        v89.OnUndo:Disconnect();
        v89.OnUndo = nil;
    end;
end;
v25.willUnmount = function(v90) --[[ Line: 363 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_GetFFlagAFTSelectHandleOnly_0 (copy)
    if v90.EditingItemChanged then
        v90.EditingItemChanged:Disconnect();
        v90.EditingItemChanged = nil;
    end;
    if l_GetFFlagAFTSelectHandleOnly_0() then
        v90:deactivate();
    else
        if v90.CFrameChanged then
            v90.CFrameChanged:Disconnect();
            v90.CFrameChanged = nil;
        end;
        if v90.SizeChanged then
            v90.SizeChanged:Disconnect();
            v90.SizeChanged = nil;
        end;
        if v90.OnRedo then
            v90.OnRedo:Disconnect();
            v90.OnRedo = nil;
        end;
        if v90.OnUndo then
            v90.OnUndo:Disconnect();
            v90.OnUndo = nil;
        end;
    end;
    if v90.OnPluginWindowFocusedHandle then
        v90.OnPluginWindowFocusedHandle:Disconnect();
        v90.OnPluginWindowFocusedHandle = nil;
    end;
    if l_GetFFlagAFTSelectHandleOnly_0() and v90.SelectionChangedHandle then
        v90.SelectionChangedHandle:Disconnect();
        v90.SelectionChangedHandle = nil;
    end;
end;
v25 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = if l_GetFFlagAFTSelectHandleOnly_0() then l_ContextServices_0.Localization else nil, 
    EditingItemContext = l_EditingItemContext_0, 
    Signals = l_Signals_0
})(v25);
return v5.connect(function(v91, _) --[[ Line: 412 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_GetFFlagAFTSelectHandleOnly_0 (copy)
    local l_selectItem_0 = v91.selectItem;
    local l_controlsPanelBlocker_0 = v91.controlsPanelBlocker;
    return {
        AccessoryTypeInfo = l_selectItem_0.accessoryTypeInfo, 
        InBounds = l_selectItem_0.inBounds, 
        IsControlsPanelBlockerActive = if l_GetFFlagAFTSelectHandleOnly_0() then l_controlsPanelBlocker_0.isActive else nil
    };
end, function(v95) --[[ Line: 423 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_GetFFlagAFTSelectHandleOnly_0 (copy), v15 (copy), v16 (copy), v17 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy)
    return {
        SetControlsPanelBlockerActivity = l_GetFFlagAFTSelectHandleOnly_0() and function(v96) --[[ Line: 426 ]]
            -- upvalues: v95 (copy), v15 (ref)
            v95(v15(v96));
        end or nil, 
        SetControlsPanelBlockerMessage = l_GetFFlagAFTSelectHandleOnly_0() and function(v97) --[[ Line: 432 ]]
            -- upvalues: v95 (copy), v16 (ref)
            v95(v16(v97));
        end or nil, 
        SetWorkspacePreviewSelectionEnabled = l_GetFFlagAFTSelectHandleOnly_0() and function(v98) --[[ Line: 438 ]]
            -- upvalues: v95 (copy), v17 (ref)
            v95(v17(v98));
        end or nil, 
        SetAttachmentPoint = function(v99) --[[ Line: 443 ]] --[[ Name: SetAttachmentPoint ]]
            -- upvalues: v95 (copy), v11 (ref)
            v95(v11(v99));
        end, 
        SetItemSize = function(v100) --[[ Line: 447 ]] --[[ Name: SetItemSize ]]
            -- upvalues: v95 (copy), v12 (ref)
            v95(v12(v100));
        end, 
        SetMeshScale = function(v101) --[[ Line: 451 ]] --[[ Name: SetMeshScale ]]
            -- upvalues: v95 (copy), v13 (ref)
            v95(v13(v101));
        end, 
        VerifyBounds = function(v102, v103) --[[ Line: 455 ]] --[[ Name: VerifyBounds ]]
            -- upvalues: v95 (copy), v14 (ref)
            v95(v14(v102, v103));
        end
    };
end)(v25);