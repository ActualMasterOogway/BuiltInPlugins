local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local v5 = require(l_script_FirstAncestor_0.Src.Utility.GetLocalizedString);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_join_0 = v4.join;
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetUploadWidgetItem);
local v17 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportDialogButtonsAndStyling);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportErrorMessageDialog);
local v21 = v2.PureComponent:extend("FailureWidget");
local function v32(v22, v23, v24, v25) --[[ Line: 37 ]] --[[ Name: DEPRECATED_generateErrorSections ]]
    -- upvalues: v5 (copy), v2 (copy), l_TextLabel_0 (copy)
    local v26 = {};
    local v27 = 1;
    for v28, v29 in pairs(v22) do
        local _ = nil;
        local v31 = nil;
        v31 = ("%*: %*"):format(v28, (if v29 == "500" and v24:GetImportTree().ExistingPackageId ~= "" then v5(v25, "HttpError", "PackageError") else v5(v25, "HttpError", v29)) or string.format("%s %s", v25:getText("HttpError", "UnknownStatusCode"), v29));
        v26[v28] = v2.createElement(l_TextLabel_0, {
            LayoutOrder = v27, 
            Text = v31, 
            TextSize = v23.SubtextSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            TextWrapped = true
        });
        v27 = v27 + 1;
    end;
    return v26;
end;
if v19() and not v20() then
    v21._generateErrorSections = function(v33) --[[ Line: 72 ]] --[[ Name: _generateErrorSections ]]
        -- upvalues: v5 (copy), v2 (copy), l_TextLabel_0 (copy)
        local l_props_0 = v33.props;
        local l_UploadWidget_0 = l_props_0.Stylizer.UploadWidget;
        local l_ErrorMap_0 = l_props_0.ErrorMap;
        local l_Localization_1 = l_props_0.Localization;
        local l_ExistingPackageId_0 = l_props_0.ExistingPackageId;
        local v39 = {};
        local v40 = 1;
        for v41, v42 in l_ErrorMap_0 do
            local _ = nil;
            local v44 = nil;
            v44 = ("%*: %*"):format(v41, (if v42 == "500" and l_ExistingPackageId_0 ~= "" then v5(l_Localization_1, "HttpError", "PackageError") else v5(l_Localization_1, "HttpError", v42)) or string.format("%s %s", l_Localization_1:getText("HttpError", "UnknownStatusCode"), v42));
            v39[v41] = v2.createElement(l_TextLabel_0, {
                LayoutOrder = v40, 
                Text = v44, 
                TextSize = l_UploadWidget_0.SubtextSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                TextWrapped = true
            });
            v40 = v40 + 1;
        end;
        return v39;
    end;
end;
if v20() then
    v21._getErrorSections = function(v45) --[[ Line: 114 ]] --[[ Name: _getErrorSections ]]
        -- upvalues: v2 (copy), l_ExpandablePane_0 (copy), v17 (copy), l_join_0 (copy), l_TextLabel_0 (copy)
        local l_props_1 = v45.props;
        local l_Stylizer_1 = l_props_1.Stylizer;
        local l_Dropdown_0 = l_Stylizer_1.ErrorWidget.Dropdown;
        local l_UploadWidget_1 = l_Stylizer_1.UploadWidget;
        local v50 = {};
        local v51 = 1;
        for v52, v53 in pairs(l_props_1.ErrorMap) do
            local l_v51_0 = v51;
            local l_UploadWidgetItem_0 = l_props_1.UploadWidgetItem;
            v50[v52] = v2.createElement(l_ExpandablePane_0, {
                Expanded = l_UploadWidgetItem_0.uploadErrorsExpanded[l_v51_0], 
                OnExpandedChanged = function() --[[ Line: 127 ]] --[[ Name: OnExpandedChanged ]]
                    -- upvalues: l_UploadWidgetItem_0 (copy), v17 (ref), l_join_0 (ref), l_v51_0 (copy), l_props_1 (copy)
                    local l_uploadErrorsExpanded_0 = l_UploadWidgetItem_0.uploadErrorsExpanded;
                    local v57 = v17.update(l_UploadWidgetItem_0, {
                        uploadErrorsExpanded = l_join_0(l_uploadErrorsExpanded_0, {
                            [l_v51_0] = not l_uploadErrorsExpanded_0[l_v51_0]
                        })
                    });
                    l_props_1.SetUploadWidgetItem(v57);
                end, 
                LayoutOrder = v51, 
                Layout = Enum.FillDirection.Vertical, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Style = l_Dropdown_0, 
                Text = v52
            }, {
                ErrorDetails = v2.createElement(l_TextLabel_0, {
                    Text = v53, 
                    TextWrapped = true, 
                    TextSelectable = true, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextSize = l_UploadWidget_1.SubtextSize, 
                    Style = "Error"
                })
            });
            v51 = v51 + 1;
        end;
        return v50;
    end;
end;
v21.render = function(v58) --[[ Line: 158 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), v20 (copy), v32 (copy), v2 (copy), l_Pane_0 (copy), v18 (copy), l_TextLabel_0 (copy), l_ScrollingFrame_0 (copy)
    local l_props_2 = v58.props;
    local l_Localization_2 = v58.props.Localization;
    local l_UploadWidget_2 = l_props_2.Stylizer.UploadWidget;
    local v62 = l_UploadWidget_2.TextSize + l_UploadWidget_2.SubtextSize + 10;
    local v63 = if next(l_props_2.ErrorMap) == nil then l_Localization_2:getText("Upload", "FailureDescriptionNoError") else l_Localization_2:getText("Upload", "FailureDescription");
    local v64 = if v19() and v20() then v58:_getErrorSections() else if v19() then v58:_generateErrorSections() else v32(l_props_2.ErrorMap, l_UploadWidget_2, l_props_2.AssetImportSession, l_Localization_2);
    return v2.createElement(l_Pane_0, {
        AutomaticSize = if not v18() or v20() then nil else Enum.AutomaticSize.Y, 
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = if v18() then Enum.HorizontalAlignment.Center else nil, 
        Size = if v20 then UDim2.new(1, 0, 1, 0) else nil, 
        Padding = if v18() then l_UploadWidget_2.FailureWidget.Padding else nil
    }, {
        Title = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = if v20() then Enum.HorizontalAlignment.Center else nil, 
            Size = if v18() then nil else UDim2.new(1, 0, 0, v62), 
            AutomaticSize = if v18() then Enum.AutomaticSize.Y else nil, 
            LayoutOrder = 1
        }, {
            Text = v2.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                Size = l_UploadWidget_2.TextLabelSize, 
                Text = l_Localization_2:getText("Upload", "Failure"), 
                TextSize = l_UploadWidget_2.TextSize, 
                TextXAlignment = l_UploadWidget_2.TextAlignment, 
                TextColor = l_UploadWidget_2.FailureColor
            }), 
            Description = v2.createElement(l_TextLabel_0, {
                LayoutOrder = 2, 
                Size = l_UploadWidget_2.TextLabelSize, 
                Text = v63, 
                TextSize = l_UploadWidget_2.SubtextSize, 
                TextXAlignment = l_UploadWidget_2.TextAlignment, 
                Font = l_UploadWidget_2.BoldFont
            })
        }), 
        Messages = v2.createElement(l_ScrollingFrame_0, {
            LayoutOrder = 2, 
            AutomaticSize = if not v18() or v20() then nil else Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 1, -v62), 
            CanvasSize = if not v18() or v20() then UDim2.new(1, 0, 1, 0) else nil, 
            OnCanvasResize = if v20() then nil else v58.onContentResize, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical
        }, v64)
    });
end;
v21 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v21);
return v3.connect(function(v65) --[[ Line: 250 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v19 (copy), v20 (copy)
    return {
        AssetImportSession = if not v19() then v65.Preview.assetImportSession else nil, 
        UploadWidgetItem = if v19() and v20() then v65.Dialogs.uploadWidgetItem else nil
    };
end, function(v66) --[[ Line: 239 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v20 (copy), v16 (copy)
    return {
        SetUploadWidgetItem = v19() and v20() and function(v67) --[[ Line: 243 ]]
            -- upvalues: v66 (copy), v16 (ref)
            v66(v16(v67));
        end or nil
    };
end)(v21);