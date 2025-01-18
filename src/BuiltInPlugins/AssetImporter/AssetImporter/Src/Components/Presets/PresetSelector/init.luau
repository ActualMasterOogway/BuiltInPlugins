local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_findIndex_0 = v4.findIndex;
local v17 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetCurrentPreset);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUploadWidgetCleanup);
local v21 = v1.PureComponent:extend("PresetSelector");
local function _(v22) --[[ Line: 35 ]]
    if string.sub(v22, -1) == "*" then
        v22 = string.sub(v22, 1, -2);
    end;
    return v22;
end;
if v19() then
    v21.defaultProps = {
        Enabled = true, 
        Size = UDim2.new(1, 0, 1, 0)
    };
end;
v21.init = function(v24) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: l_StyleModifier_0 (copy), v1 (copy), l_Button_0 (copy), l_TextLabel_0 (copy), v19 (copy)
    v24.renderDropdownItem = function(v25, v26, v27, v28) --[[ Line: 50 ]]
        -- upvalues: v24 (copy), l_StyleModifier_0 (ref), v1 (ref), l_Button_0 (ref), l_TextLabel_0 (ref)
        local l_TopBar_0 = v24.props.Stylizer.TopBar;
        local l_PresetController_0 = v24.props.PresetController;
        local v31 = nil;
        local l_v25_0 = v25;
        if string.sub(l_v25_0, -1) == "*" then
            l_v25_0 = string.sub(l_v25_0, 1, -2);
        end;
        local l_l_v25_0_0 = l_v25_0;
        v31 = l_PresetController_0:isStudioDefault(l_l_v25_0_0) and 1 or l_PresetController_0:isLastImport(l_l_v25_0_0) and 2 or 2 + v26;
        l_v25_0 = if v28 then l_StyleModifier_0.Hover else nil;
        return v1.createElement(l_Button_0, {
            LayoutOrder = v31, 
            OnClick = v27, 
            Size = l_TopBar_0.MenuItemSize, 
            StyleModifier = l_v25_0
        }, {
            TextLabel = v1.createElement(l_TextLabel_0, {
                Text = l_l_v25_0_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.fromScale(1, 1), 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                StyleModifier = l_v25_0
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_TopBar_0.Padding.Left), 
                    PaddingRight = UDim.new(0, l_TopBar_0.Padding.Right)
                })
            })
        });
    end;
    v24.onItemActivated = function(v34, _) --[[ Line: 86 ]]
        -- upvalues: v19 (ref), v24 (copy)
        if v19() then
            local l_props_0 = v24.props;
            l_props_0.PresetController:resolvePreset(v34, l_props_0.QueueItem);
            return;
        else
            v24.props.SetCurrentPreset(v34);
            v24.props.PresetController:DEPRECATED_resolvePreset(v34);
            return;
        end;
    end;
end;
v21.render = function(v37) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), v20 (copy), l_findIndex_0 (copy), v1 (copy), l_SelectInput_0 (copy), l_Pane_0 (copy), l_Tooltip_0 (copy)
    local l_props_1 = v37.props;
    local l_TopBar_1 = l_props_1.Stylizer.TopBar;
    local v40 = if v19() then l_props_1.QueueItem.currentPreset else l_props_1.CurrentPreset;
    local v41 = if v20() then l_props_1.QueueItem.currentPreset else l_props_1.SettingsChanged;
    local v42 = l_props_1.PresetController:getNameList(v40, l_props_1.QueueItem);
    local v43 = l_props_1.PresetController:isLastImport(v40);
    local v44 = nil;
    if v43 then
        v44 = l_props_1.Localization:getText("Templates", "LastImportTooltip");
    end;
    if v41 then
        v44 = l_props_1.Localization:getText("Templates", "ModifiedTemplateTooltip");
    end;
    local v47 = l_findIndex_0(v42, function(v45) --[[ Line: 121 ]]
        -- upvalues: v40 (copy)
        local l_v45_0 = v45;
        if string.sub(l_v45_0, -1) == "*" then
            l_v45_0 = string.sub(l_v45_0, 1, -2);
        end;
        return l_v45_0 == v40;
    end);
    local v48 = v1.createElement(l_SelectInput_0, {
        Items = v42, 
        LayoutOrder = l_props_1.LayoutOrder, 
        OnRenderItem = v37.renderDropdownItem, 
        OnItemActivated = v37.onItemActivated, 
        SelectedIndex = v47, 
        Size = if v19() then l_props_1.Size else nil, 
        Width = if not v19() then l_TopBar_1.TemplateDropDown.X.Offset else nil, 
        Enabled = if v19() then l_props_1.Enabled else nil, 
        TextTruncate = Enum.TextTruncate.AtEnd
    });
    if not v19() and v44 then
        return v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            Size = l_TopBar_1.TemplateDropDown
        }, {
            v1.createElement(l_Tooltip_0, {
                Text = v44, 
                Child = v48
            })
        });
    else
        return v48;
    end;
end;
v21 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    PresetController = v17
})(v21);
return v2.connect(function(v49) --[[ Line: 166 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v19 (copy)
    return {
        CurrentPreset = if not v19() then v49.Preview.currentPreset else nil, 
        SettingsChanged = if not v19() then v49.Preview.settingsChanged else nil, 
        Checked = if not v19() then v49.Preview.importDataChecked or {} else nil
    };
end, function(v50) --[[ Line: 176 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v18 (copy)
    return {
        SetCurrentPreset = not v19() and function(v51) --[[ Line: 179 ]]
            -- upvalues: v50 (copy), v18 (ref)
            v50(v18(v51));
        end or nil
    };
end)(v21);