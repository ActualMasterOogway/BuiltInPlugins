local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v3.Util.AccessoryAndBodyToolShared;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_Components_0 = v3.Components;
local l_ConfirmDialog_0 = l_Components_0.ConfirmDialog;
local l_ConfirmCancelDialog_0 = l_Components_0.ConfirmCancelDialog;
local l_InstanceSelector_0 = l_Components_0.InstanceSelector;
local v11 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v11.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local v15 = require(l_Parent_0.Src.Actions.SetToolMode);
local v16 = require(l_Parent_0.Src.Thunks.AddUserAddedAssetForPreview);
local v17 = require(l_Parent_0.Src.Components.SelectFrame);
local v18 = require(l_Parent_0.Src.Util.ShowDialog);
local v19 = require(l_Parent_0.Src.Util.Constants);
local v20 = v1.PureComponent:extend("SelectItemScreen");
v11.Util.Typecheck.wrap(v20, script);
v20.init = function(v21) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: l_ItemCharacteristics_0 (copy), l_PreviewConstants_0 (copy), v19 (copy), v18 (copy), l_ConfirmCancelDialog_0 (copy), v1 (copy), l_ConfirmDialog_0 (copy)
    v21.state = {
        selectedPart = nil, 
        invalidSelected = false
    };
    v21.checkForPreviewAvatar = function(v22) --[[ Line: 58 ]]
        -- upvalues: v21 (copy), l_ItemCharacteristics_0 (ref), l_PreviewConstants_0 (ref)
        local l_props_0 = v21.props;
        if not l_ItemCharacteristics_0.isClothes(v22) then
            return;
        else
            local l_Parent_1 = v22.Parent;
            if not l_Parent_1 then
                return;
            elseif not l_ItemCharacteristics_0.isAvatar(l_Parent_1) then
                return;
            else
                local v25 = l_Parent_1:Clone();
                for _, v27 in ipairs(v25:GetChildren()) do
                    if v27.Name == v22.Name then
                        v27:Destroy();
                    end;
                end;
                l_props_0.AddUserAddedAssetForPreview(l_PreviewConstants_0.TABS_KEYS.Avatars, v25);
                return;
            end;
        end;
    end;
    v21.setSourceItem = function(v28) --[[ Line: 84 ]]
        -- upvalues: v21 (copy), v19 (ref)
        v21.props.EditingItemContext:setSourceItem(v28);
        v21.checkForPreviewAvatar(v28);
        v21.props.SetToolMode(v19.TOOL_MODE.None);
        v21.props.GoToNext();
    end;
    v21.onSelectNewItem = function(v29) --[[ Line: 91 ]]
        -- upvalues: v21 (copy), v18 (ref), l_ConfirmCancelDialog_0 (ref)
        local l_props_1 = v21.props;
        v18(l_props_1.Plugin, l_props_1.Localization, l_ConfirmCancelDialog_0, {
            Text = v21.props.Localization:getText("Select", "LoseChanges"), 
            OnConfirm = function() --[[ Line: 96 ]] --[[ Name: OnConfirm ]]
                -- upvalues: v21 (ref), v29 (copy)
                v21.setSourceItem(v29);
            end
        });
    end;
    v21.onConfirmSelection = function() --[[ Line: 102 ]]
        -- upvalues: v21 (copy), v1 (ref), v18 (ref), l_ConfirmDialog_0 (ref)
        local l_state_0 = v21.state;
        local l_props_2 = v21.props;
        local l_selectedPart_0 = l_state_0.selectedPart;
        if not v21.isSelectedInstanceValid(l_selectedPart_0) then
            v21:setState({
                invalidSelected = true, 
                selectedPart = v1.None
            });
            v18(l_props_2.Plugin, l_props_2.Localization, l_ConfirmDialog_0, {
                Text = v21.props.Localization:getText("Select", "Invalid"), 
                OnClose = function() --[[ Line: 117 ]] --[[ Name: OnClose ]]

                end
            });
            return;
        else
            if l_selectedPart_0 then
                local v34 = l_props_2.EditingItemContext:getSourceItem();
                if not v34 or v34 == l_selectedPart_0 then
                    v21.setSourceItem(l_selectedPart_0);
                    return;
                else
                    v21.onSelectNewItem(l_selectedPart_0);
                end;
            end;
            return;
        end;
    end;
    v21.isSelectedInstanceValid = function(v35) --[[ Line: 134 ]]
        -- upvalues: v21 (copy), l_ItemCharacteristics_0 (ref)
        local v36 = v21.props.EditingItemContext:getItem();
        if not l_ItemCharacteristics_0.isPotentialLayeredClothingItem(v35) then
            return false;
        elseif l_ItemCharacteristics_0.hasInvalidCage(v35) then
            return false;
        else
            local v37 = l_ItemCharacteristics_0.isAvatar(v35);
            local v38 = v35:IsA("MeshPart") and v35:FindFirstChildWhichIsA("WrapTarget");
            if v37 or v38 then
                return false;
            else
                local v39 = v35:FindFirstAncestor("LayeredClothingEditorPreview") ~= nil;
                local v40 = v35 == v36;
                local v41 = v36 and v35 == v36.Parent;
                local v42 = v36 and v35:FindFirstAncestor(v36.Name);
                local v43 = v35 and v36 and v35.Parent == v36.Parent;
                return not (v39 or v40 or v41 or v43 or v42);
            end;
        end;
    end;
    v21.onSelectValidInstance = function(v44) --[[ Line: 162 ]]
        -- upvalues: v21 (copy), l_ItemCharacteristics_0 (ref), v1 (ref)
        v21:setState({
            selectedPart = l_ItemCharacteristics_0.getHandle(v44), 
            invalidSelected = false
        });
        if v21.ancestryChangedHandle then
            v21.ancestryChangedHandle:Disconnect();
        end;
        v21.ancestryChangedHandle = v44.AncestryChanged:Connect(function() --[[ Line: 172 ]]
            -- upvalues: v21 (ref), v1 (ref)
            v21:setState({
                selectedPart = v1.None, 
                invalidSelected = false
            });
            v21.ancestryChangedHandle:Disconnect();
            v21.ancestryChangedHandle = nil;
        end);
    end;
    v21.onInvalidSelectionInstance = function() --[[ Line: 182 ]]
        -- upvalues: v21 (copy), v1 (ref)
        v21:setState({
            invalidSelected = true, 
            selectedPart = v1.None
        });
    end;
end;
v20.didMount = function(v45) --[[ Line: 190 ]] --[[ Name: didMount ]]
    local v46 = v45.props.EditingItemContext:getSourceItem();
    if v46 then
        v45:setState({
            selectedPart = v46
        });
    end;
end;
v20.render = function(v47) --[[ Line: 199 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v17 (copy), l_InstanceSelector_0 (copy)
    local l_props_3 = v47.props;
    local l_state_1 = v47.state;
    local v50 = l_state_1.selectedPart and l_state_1.selectedPart.Name or "";
    local l_invalidSelected_0 = l_state_1.invalidSelected;
    local v52 = v50 ~= "";
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_Localization_0 = l_props_3.Localization;
    local v55 = l_invalidSelected_0 and l_Localization_0:getText("Select", "Invalid") or v50;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderSizePixel = 0
    }, {
        SelectFrame = v1.createElement(v17, {
            PartName = v55, 
            ButtonEnabled = v52, 
            OnConfirmSelection = v47.onConfirmSelection
        }), 
        InstanceSelector = v1.createElement(l_InstanceSelector_0, {
            IsSelectedInstanceValid = v47.isSelectedInstanceValid, 
            OnValidSelection = v47.onSelectValidInstance, 
            OnInvalidSelection = v47.onInvalidSelectionInstance
        })
    });
end;
v20.willUnmount = function(v56) --[[ Line: 230 ]] --[[ Name: willUnmount ]]
    if v56.ancestryChangedHandle then
        v56.ancestryChangedHandle:Disconnect();
        v56.ancestryChangedHandle = nil;
    end;
end;
v20 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0
})(v20);
return v2.connect(nil, function(v57) --[[ Line: 244 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), v16 (copy)
    return {
        SetToolMode = function(v58) --[[ Line: 246 ]] --[[ Name: SetToolMode ]]
            -- upvalues: v57 (copy), v15 (ref)
            v57(v15(v58));
        end, 
        AddUserAddedAssetForPreview = function(v59, v60) --[[ Line: 250 ]] --[[ Name: AddUserAddedAssetForPreview ]]
            -- upvalues: v57 (copy), v16 (ref)
            v57(v16(v59, v60));
        end
    };
end)(v20);