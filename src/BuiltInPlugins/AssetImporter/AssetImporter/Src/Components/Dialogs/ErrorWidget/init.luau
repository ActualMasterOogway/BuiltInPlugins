local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetShowError);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAssetImportPlugin);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportDialogButtonsAndStyling);
local v16 = v2.PureComponent:extend("ErrorWidget");
local function _(v17, v18) --[[ Line: 26 ]] --[[ Name: getErrorMessage ]]
    -- upvalues: v4 (copy)
    if not v18 then
        return "";
    else
        local v19 = v4.values(v18:GetStatuses());
        if #v19 >= 1 then
            return v17:getText("Error", v19[1].Type);
        else
            return v17:getText("Error", "DefaultNoStatus");
        end;
    end;
end;
v16.init = function(v21) --[[ Line: 37 ]] --[[ Name: init ]]
    v21.onClose = function() --[[ Line: 38 ]]
        -- upvalues: v21 (copy)
        v21.props.SetShowError(false);
    end;
end;
v16.render = function(v22) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_StyledDialog_0 (copy), v15 (copy), v14 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v4 (copy)
    local l_Localization_1 = v22.props.Localization;
    local l_props_0 = v22.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_ErrorWidget_0 = l_Stylizer_1.ErrorWidget;
    local l_createElement_0 = v2.createElement;
    local l_l_StyledDialog_0_0 = l_StyledDialog_0;
    local v29 = {
        Buttons = {
            {
                Key = "ok", 
                Text = l_Localization_1:getText("Error", "OK"), 
                Style = v15() and "RoundPrimary" or nil
            }
        }, 
        Enabled = l_props_0.ShowError, 
        MinContentSize = Vector2.new(l_ErrorWidget_0.Width, l_ErrorWidget_0.Height), 
        Modal = not v14(), 
        OnButtonPressed = v22.onClose, 
        OnClose = v22.onClose, 
        Resizable = false, 
        Style = v15() and "ImportDialog" or "Alert", 
        Title = l_props_0.Title
    };
    local v30 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v33 = {
        Layout = Enum.FillDirection.Horizontal, 
        Size = UDim2.new(1, 0, 1, 0), 
        Spacing = l_ErrorWidget_0.IconSpacing
    };
    local v34 = {
        Image = v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = l_Stylizer_1.ErrorIcon.Image, 
            Size = UDim2.fromOffset(l_ErrorWidget_0.IconSize, l_ErrorWidget_0.IconSize), 
            LayoutOrder = 1
        })
    };
    local l_createElement_2 = v2.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v37 = {
        Layout = Enum.FillDirection.Vertical, 
        Size = UDim2.new(0.6, 0, 1, 0), 
        LayoutOrder = 2
    };
    local v38 = {
        Header = v2.createElement(l_TextLabel_0, {
            Text = l_Localization_1:getText("Error", "Header"), 
            TextSize = l_ErrorWidget_0.TextSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0.35, 0), 
            LayoutOrder = 1
        })
    };
    local l_createElement_3 = v2.createElement;
    local l_l_TextLabel_0_0 = l_TextLabel_0;
    local v41 = {};
    local l_AssetImportSession_0 = l_props_0.AssetImportSession;
    local v43;
    if not l_AssetImportSession_0 then
        v43 = "";
    else
        local v44 = v4.values(l_AssetImportSession_0:GetStatuses());
        v43 = if #v44 >= 1 then l_Localization_1:getText("Error", v44[1].Type) else l_Localization_1:getText("Error", "DefaultNoStatus");
    end;
    v41.Text = v43;
    v41.TextSize = l_ErrorWidget_0.SubtextSize;
    v41.TextXAlignment = Enum.TextXAlignment.Left;
    v41.Size = UDim2.new(1, 0, 0.35, 0);
    v41.LayoutOrder = 2;
    v38.SubtextSize = l_createElement_3(l_l_TextLabel_0_0, v41);
    v34.TextPane = l_createElement_2(l_l_Pane_0_1, v37, v38);
    v30.Content = l_createElement_1(l_l_Pane_0_0, v33, v34);
    return l_createElement_0(l_l_StyledDialog_0_0, v29, v30);
end;
v16 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v16);
return v3.connect(function(v45) --[[ Line: 115 ]] --[[ Name: mapStateToProps ]]
    return {
        ImportTree = v45.Preview.importTree, 
        AssetImportSession = v45.Preview.assetImportSession, 
        ImportDataCheckedCount = v45.Preview.importDataCheckedCount, 
        ErrorNodeChecked = v45.Preview.errorNodeChecked, 
        HasInvalidPackageId = v45.Preview.hasInvalidPackageId, 
        ShowError = v45.Dialogs.showError
    };
end, function(v46) --[[ Line: 107 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy)
    return {
        SetShowError = function(v47) --[[ Line: 109 ]] --[[ Name: SetShowError ]]
            -- upvalues: v46 (copy), v13 (ref)
            v46(v13(v47));
        end
    };
end)(v16);