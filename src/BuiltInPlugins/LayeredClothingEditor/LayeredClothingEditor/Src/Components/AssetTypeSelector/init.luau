local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Components_0 = v7.Components;
local _ = l_Components_0.FlowScreenLayout;
local l_RadioButtonListDropdown_0 = l_Components_0.RadioButtonListDropdown;
local l_AccessoryAndBodyToolShared_0 = v7.Util.AccessoryAndBodyToolShared;
local l_AssetTypeAttachmentInfo_0 = l_AccessoryAndBodyToolShared_0.AssetTypeAttachmentInfo;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local _ = l_AccessoryAndBodyToolShared_0.Constants;
local l_UI_0 = v4.UI;
local _ = l_UI_0.Pane;
local _ = l_UI_0.SelectInput;
local _ = l_UI_0.TextLabel;
local v19 = require(l_Parent_0.Src.Actions.SetAccessoryTypeInfo);
local v20 = require(l_Parent_0.Src.Actions.SetAttachmentPoint);
local v21 = require(l_Parent_0.Src.Util.findLocalizedStringKey);
local v22 = require(l_Parent_0.Src.Util.makeDropdownList);
local v23 = require(l_Parent_0.Src.Util.makeRadioButtonList);
local l_EditingItemContext_0 = v7.Contexts.EditingItemContext;
local l_Util_0 = v4.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local _ = l_Util_0.StyleModifier;
local v29 = v1.PureComponent:extend("AssetTypeSelector");
l_Typecheck_0.wrap(v29, script);
local function _(v30) --[[ Line: 58 ]] --[[ Name: hasMultipleAttachments ]]
    -- upvalues: v3 (copy)
    return #v3.Dictionary.values(v30.Attachments) > 1;
end;
v29.getInitialRadioButtonListKey = function(v32) --[[ Line: 62 ]] --[[ Name: getInitialRadioButtonListKey ]]
    -- upvalues: l_AssetTypeAttachmentInfo_0 (copy)
    local l_AccessoryTypeInfo_0 = v32.props.AccessoryTypeInfo;
    if not l_AccessoryTypeInfo_0 then
        return;
    else
        local l_AssetType_0 = l_AccessoryTypeInfo_0.AssetType;
        if l_AssetTypeAttachmentInfo_0.Accessory[l_AssetType_0] then
            v32.initialRadioButtonListKey = "Accessory";
            return;
        else
            if l_AssetTypeAttachmentInfo_0.Clothing[l_AssetType_0] then
                v32.initialRadioButtonListKey = "Clothing";
            end;
            return;
        end;
    end;
end;
v29.setInitialSelectionInfo = function(v35, v36, v37) --[[ Line: 79 ]] --[[ Name: setInitialSelectionInfo ]]
    -- upvalues: v3 (copy), v22 (copy)
    local l_Localization_0 = v35.props.Localization;
    if #v3.Dictionary.values(v37.Attachments) > 1 then
        v35.attachmentListItems = v22(l_Localization_0, "AssetType", v37.Attachments);
        v35.initialMultiAttachmentAsset = {
            [v36] = v37
        };
    end;
end;
v29.initWithPreviousAssetTypeInfo = function(v39) --[[ Line: 91 ]] --[[ Name: initWithPreviousAssetTypeInfo ]]
    -- upvalues: l_AssetTypeAttachmentInfo_0 (copy), v3 (copy)
    local l_props_0 = v39.props;
    local l_AccessoryTypeInfo_1 = l_props_0.AccessoryTypeInfo;
    if not l_AccessoryTypeInfo_1 then
        return;
    else
        local l_AssetType_1 = l_AccessoryTypeInfo_1.AssetType;
        local v43 = l_props_0.Localization:getText("AssetType", l_AssetType_1);
        local v44 = l_AssetTypeAttachmentInfo_0.Accessory[l_AssetType_1];
        local v45 = l_AssetTypeAttachmentInfo_0.Clothing[l_AssetType_1];
        if v44 then
            v39:setInitialSelectionInfo(l_AssetType_1, v44);
            v39.initialSelectedAccessoryIndex = v3.List.find(v39.accessoryItemList, v43);
        elseif v45 then
            v39:setInitialSelectionInfo(l_AssetType_1, v45);
            v39.initialSelectedClothingIndex = v3.List.find(v39.clothingItemList, v43);
        end;
        if v39.attachmentListItems then
            local v46 = l_props_0.Localization:getText("AssetType", l_AccessoryTypeInfo_1.AssetSubType);
            v39.initialSelectedAttachmentIndex = v3.List.find(v39.attachmentListItems, v46);
        end;
        return;
    end;
end;
v29.getAssetTypeDropdownProps = function(v47) --[[ Line: 117 ]] --[[ Name: getAssetTypeDropdownProps ]]
    local l_state_0 = v47.state;
    local v49 = {};
    local l_radioButtonListKey_0 = l_state_0.radioButtonListKey;
    local l_selectedAccessoryIndex_0 = l_state_0.selectedAccessoryIndex;
    local l_selectedClothingIndex_0 = l_state_0.selectedClothingIndex;
    if l_radioButtonListKey_0 == "Accessory" then
        v49.Items = v47.accessoryItemList;
        v49.OnItemActivated = v47.onClickAccessoryType;
        v49.SelectedIndex = l_selectedAccessoryIndex_0;
        return v49;
    else
        if l_radioButtonListKey_0 == "Clothing" then
            v49.Items = v47.clothingItemList;
            v49.OnItemActivated = v47.onClickClothingType;
            v49.SelectedIndex = l_selectedClothingIndex_0;
        end;
        return v49;
    end;
end;
v29.getAttachmentDropdownProps = function(v53) --[[ Line: 139 ]] --[[ Name: getAttachmentDropdownProps ]]
    local l_state_1 = v53.state;
    local l_multiAttachmentAsset_0 = l_state_1.multiAttachmentAsset;
    local l_selectedAttachmentIndex_0 = l_state_1.selectedAttachmentIndex;
    local v57 = {};
    if l_multiAttachmentAsset_0 then
        local v58, v59 = next(l_multiAttachmentAsset_0);
        v57.SubListItems = v53.attachmentListItems;
        v57.OnSubListItemActivated = function(v60, v61) --[[ Line: 149 ]]
            -- upvalues: v53 (copy), v58 (copy), v59 (copy)
            v53.onClickAttachment(v58, v60, v59);
            v53:setState({
                selectedAttachmentIndex = v61
            });
        end;
        v57.SubListSelectedIndex = l_selectedAttachmentIndex_0;
    end;
    return v57;
end;
v29.didMount = function(v62) --[[ Line: 161 ]] --[[ Name: didMount ]]
    -- upvalues: v22 (copy), l_AssetTypeAttachmentInfo_0 (copy)
    local l_Localization_1 = v62.props.Localization;
    v62.accessoryItemList = v22(l_Localization_1, "AssetType", l_AssetTypeAttachmentInfo_0.Accessory);
    v62.clothingItemList = v22(l_Localization_1, "AssetType", l_AssetTypeAttachmentInfo_0.Clothing);
    v62:initWithPreviousAssetTypeInfo();
    v62:setState({
        multiAttachmentAsset = v62.initialMultiAttachmentAsset, 
        selectedAttachmentIndex = v62.initialSelectedAttachmentIndex, 
        selectedAccessoryIndex = v62.initialSelectedAccessoryIndex, 
        selectedClothingIndex = v62.initialSelectedClothingIndex
    });
end;
v29.init = function(v64) --[[ Line: 179 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v3 (copy), l_AccessoryUtil_0 (copy), v21 (copy), v22 (copy), l_AssetTypeAttachmentInfo_0 (copy)
    v64:getInitialRadioButtonListKey();
    v64.state = {
        multiAttachmentAsset = nil, 
        radioButtonListKey = v64.initialRadioButtonListKey, 
        selectedAttachmentIndex = nil, 
        selectedAccessoryIndex = nil, 
        selectedClothingIndex = nil
    };
    v64.onRadioButtonClick = function(v65) --[[ Line: 189 ]]
        -- upvalues: v64 (copy), v1 (ref)
        local l_state_2 = v64.state;
        local l_selectedAccessoryIndex_1 = l_state_2.selectedAccessoryIndex;
        local l_selectedClothingIndex_1 = l_state_2.selectedClothingIndex;
        v64:setState({
            radioButtonListKey = v65 or v1.None, 
            multiAttachmentAsset = v1.None
        });
        if v65 == "Accessory" and l_selectedAccessoryIndex_1 then
            v64.onClickAccessoryType(v64.accessoryItemList[l_selectedAccessoryIndex_1], l_selectedAccessoryIndex_1);
            return;
        else
            if v65 == "Clothing" and l_selectedClothingIndex_1 then
                v64.onClickClothingType(v64.clothingItemList[l_selectedClothingIndex_1], l_selectedClothingIndex_1);
            end;
            return;
        end;
    end;
    v64.setAttachment = function(v69, v70, v71) --[[ Line: 207 ]]
        -- upvalues: v64 (copy), v3 (ref), l_AccessoryUtil_0 (ref)
        if not v70 then
            return;
        else
            local v72 = v64.props.EditingItemContext:getItem();
            if not v72 then
                return;
            else
                local v73 = v71[v70];
                v64.props.SetAccessoryTypeInfo(v3.Dictionary.join(v73, {
                    AssetType = v69, 
                    AssetSubType = v70
                }));
                local v74 = l_AccessoryUtil_0:getExistingAttachmentPoint(v72, v72.Parent, v73.Name);
                if v74 then
                    v64.props.SetAttachmentPoint(v74);
                end;
                return;
            end;
        end;
    end;
    v64.onClickAttachment = function(v75, v76, v77) --[[ Line: 230 ]]
        -- upvalues: v64 (copy), v21 (ref)
        local l_props_1 = v64.props;
        if not v77 then
            return;
        else
            local v79 = v21(l_props_1.Localization, "AssetType", v76, v77.Attachments);
            v64.setAttachment(v75, v79, v77.Attachments);
            return;
        end;
    end;
    v64.onClickAssetType = function(v80, v81) --[[ Line: 241 ]]
        -- upvalues: v64 (copy), v3 (ref), v1 (ref), v22 (ref)
        local l_props_2 = v64.props;
        local l_state_3 = v64.state;
        local l_Localization_2 = l_props_2.Localization;
        if not v80 or not v81 then
            return;
        else
            local v85 = v81[v80];
            if not (#v3.Dictionary.values(v85.Attachments) > 1) then
                local v86 = next(v85.Attachments);
                v64.setAttachment(v80, v86, v85.Attachments);
                v64:setState({
                    multiAttachmentAsset = v1.None
                });
                return;
            else
                local l_selectedAttachmentIndex_1 = l_state_3.selectedAttachmentIndex;
                v64.attachmentListItems = v22(l_Localization_2, "AssetType", v85.Attachments);
                v64:setState({
                    multiAttachmentAsset = {
                        [v80] = v85
                    }
                });
                if l_selectedAttachmentIndex_1 then
                    v64.onClickAttachment(v80, v64.attachmentListItems[l_selectedAttachmentIndex_1], v85);
                end;
                return;
            end;
        end;
    end;
    v64.onClickAccessoryType = function(v88, v89) --[[ Line: 272 ]]
        -- upvalues: v64 (copy), v21 (ref), l_AssetTypeAttachmentInfo_0 (ref)
        local l_props_3 = v64.props;
        local v91 = v21(l_props_3.Localization, "AssetType", v88, l_AssetTypeAttachmentInfo_0.Accessory);
        v64.onClickAssetType(v91, l_AssetTypeAttachmentInfo_0.Accessory);
        v64:setState({
            selectedAccessoryIndex = v89
        });
    end;
    v64.onClickClothingType = function(v92, v93) --[[ Line: 281 ]]
        -- upvalues: v64 (copy), v21 (ref), l_AssetTypeAttachmentInfo_0 (ref)
        local l_props_4 = v64.props;
        local v95 = v21(l_props_4.Localization, "AssetType", v92, l_AssetTypeAttachmentInfo_0.Clothing);
        v64.onClickAssetType(v95, l_AssetTypeAttachmentInfo_0.Clothing);
        v64:setState({
            selectedClothingIndex = v93
        });
    end;
end;
v29.render = function(v96) --[[ Line: 291 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v23 (copy), l_AssetTypeAttachmentInfo_0 (copy), v3 (copy), v1 (copy), l_RadioButtonListDropdown_0 (copy)
    local l_props_5 = v96.props;
    local l_state_4 = v96.state;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local l_Localization_3 = l_props_5.Localization;
    local l_radioButtonListKey_1 = l_state_4.radioButtonListKey;
    local _ = l_LayoutOrderIterator_0.new();
    local v103 = v96:getAssetTypeDropdownProps();
    local v104 = v96:getAttachmentDropdownProps();
    local v105 = {
        LayoutOrder = l_LayoutOrder_0, 
        Buttons = v23(l_Localization_3, "AssetType", l_AssetTypeAttachmentInfo_0), 
        OnRadioButtonClick = v96.onRadioButtonClick, 
        InitialSelectedKey = l_radioButtonListKey_1
    };
    v105 = v3.Dictionary.join(v105, v103, v104);
    return v1.createElement(l_RadioButtonListDropdown_0, v105);
end;
v29 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0
})(v29);
return v2.connect(function(v106, _) --[[ Line: 319 ]] --[[ Name: mapStateToProps ]]
    return {
        AccessoryTypeInfo = v106.selectItem.accessoryTypeInfo
    };
end, function(v108) --[[ Line: 327 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v20 (copy)
    return {
        SetAccessoryTypeInfo = function(v109) --[[ Line: 329 ]] --[[ Name: SetAccessoryTypeInfo ]]
            -- upvalues: v108 (copy), v19 (ref)
            v108(v19(v109));
        end, 
        SetAttachmentPoint = function(v110) --[[ Line: 333 ]] --[[ Name: SetAttachmentPoint ]]
            -- upvalues: v108 (copy), v20 (ref)
            v108(v20(v110));
        end
    };
end)(v29);