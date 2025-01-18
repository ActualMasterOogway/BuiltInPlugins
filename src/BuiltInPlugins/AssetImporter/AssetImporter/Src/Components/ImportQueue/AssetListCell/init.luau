local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_UI_0 = v2.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v16 = require(l_Components_0.Presets.PresetSelector);
local v17 = require(l_Components_0.Properties.Types.UploadDestinationProperty);
local v18 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v19 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v20 = require(l_script_FirstAncestor_0.Src.Controllers.QueueController);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueGroupSelection);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
local v23 = v1.PureComponent:extend("AssetListCell");
v23.init = function(v24) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: l_showContextMenu_0 (copy)
    v24.openImportPreview = function() --[[ Line: 35 ]]
        -- upvalues: v24 (copy)
        v24.props.FileController:requestPreview(v24.props.Row);
    end;
    v24.reopenFileSelection = function() --[[ Line: 39 ]]
        -- upvalues: v24 (copy)
        v24.props.FileController:requestFileSwap(v24.props.Row.filepath);
    end;
    v24.getModelIcon = function() --[[ Line: 43 ]]
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 44 ]]
            return game:GetService("StudioService"):GetClassIcon("Model");
        end);
        if l_status_0 and next(l_result_0) ~= nil then
            return l_result_0;
        else
            return {
                Image = "rbxasset://textures/ClassImages.png", 
                ImageRectOffset = Vector2.new(0, 0), 
                ImageRectSize = Vector2.new(16, 16)
            };
        end;
    end;
    v24.toggleCheckbox = function() --[[ Line: 60 ]]
        -- upvalues: v24 (copy)
        local l_props_0 = v24.props;
        if not l_props_0.CellProps.Uploading then
            l_props_0.CellProps.OnCheckboxToggle(l_props_0.Row.filepath);
        end;
    end;
    v24.updateCreator = function(v28) --[[ Line: 68 ]]
        -- upvalues: v24 (copy)
        local l_Row_0 = v24.props.Row;
        v24.props.CellProps.UpdateCreator(l_Row_0.filepath, v28);
    end;
    v24.onStatusClicked = function() --[[ Line: 74 ]]
        -- upvalues: v24 (copy)
        local l_props_1 = v24.props;
        l_props_1.CellProps.ShowUploadWidget(l_props_1.Row);
    end;
    local function v33() --[[ Line: 79 ]]
        -- upvalues: v24 (copy)
        local l_props_2 = v24.props;
        local l_currentPreset_0 = l_props_2.Row.currentPreset;
        l_props_2.PresetController:applyPresetToAllSessions(l_currentPreset_0);
    end;
    local function v34() --[[ Line: 85 ]]
        -- upvalues: v24 (copy)
        v24.props.QueueController:removeSelectedQueuedFile(v24.props.Row);
    end;
    v24.showContextMenu = function() --[[ Line: 89 ]]
        -- upvalues: v24 (copy), v33 (copy), v34 (copy), l_showContextMenu_0 (ref)
        local l_props_3 = v24.props;
        local v36 = l_props_3.Plugin:get();
        local l_Localization_1 = l_props_3.Localization;
        local v38 = {
            {
                Text = l_Localization_1:getText("AssetImportTree", "RightClickApplyToAll"), 
                OnItemClicked = v33
            }, 
            {
                Text = l_Localization_1:getText("ImportQueue", "RemoveFromQueue"), 
                OnItemClicked = v34
            }
        };
        l_showContextMenu_0(v36, v38);
    end;
    v24.isDisabled = function() --[[ Line: 108 ]]
        -- upvalues: v24 (copy)
        local l_Row_1 = v24.props.Row;
        local l_Parsing_0 = v24.props.CellProps.Parsing;
        return not l_Row_1.enabled or l_Row_1.uploaded or l_Row_1.importDataError or l_Parsing_0;
    end;
    v24.isInactive = function() --[[ Line: 114 ]]
        -- upvalues: v24 (copy)
        local l_Row_2 = v24.props.Row;
        local l_Parsing_1 = v24.props.CellProps.Parsing;
        return l_Row_2.uploaded or not l_Row_2.validSession or l_Parsing_1;
    end;
    v24.showCheckbox = function() --[[ Line: 120 ]]
        -- upvalues: v24 (copy)
        return v24.props.Row.validSession;
    end;
    v24.disableCheckbox = function() --[[ Line: 125 ]]
        -- upvalues: v24 (copy)
        local l_Row_3 = v24.props.Row;
        return l_Row_3.uploaded or l_Row_3.importDataError or v24.props.CellProps.Uploading;
    end;
end;
v23.renderCheckboxCell = function(v44) --[[ Line: 131 ]] --[[ Name: renderCheckboxCell ]]
    -- upvalues: v1 (copy), l_Checkbox_0 (copy)
    local l_props_4 = v44.props;
    local l_Row_4 = l_props_4.Row;
    local v47 = l_Row_4.enabled or l_Row_4.uploaded;
    if v44.showCheckbox() then
        return (v1.createFragment({
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Checkbox = v1.createElement(l_Checkbox_0, {
                OnClick = v44.toggleCheckbox, 
                Key = l_props_4.RowIndex, 
                Checked = v47, 
                Disabled = v44.disableCheckbox()
            })
        }));
    else
        return nil;
    end;
end;
v23.renderAssetCell = function(v48) --[[ Line: 154 ]] --[[ Name: renderAssetCell ]]
    -- upvalues: l_TextLabel_0 (copy), l_LinkText_0 (copy), v1 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    local l_props_5 = v48.props;
    local l_Localization_2 = l_props_5.Localization;
    local l_Style_0 = l_props_5.Style;
    local l_ImportQueue_0 = l_Style_0.ImportQueue;
    local l_Padding_0 = l_ImportQueue_0.Padding;
    local l_DisabledTransparancy_0 = l_ImportQueue_0.DisabledTransparancy;
    local l_Row_5 = l_props_5.Row;
    local v56 = l_Row_5.errors + l_Row_5.warnings;
    local v57 = v48.getModelIcon();
    local l_X_0 = v57.ImageRectSize.X;
    local l_StatusIconSize_0 = l_props_5.CellProps.StatusIconSize;
    local v60 = if v56 > 0 then l_StatusIconSize_0 + l_Padding_0 else 0;
    local v61 = if l_Row_5.errors > 0 then l_Style_0.ErrorIcon else l_Style_0.WarningIcon;
    local v62 = if l_Row_5.errors > 0 then l_Row_5.errors else l_Row_5.warnings;
    local v63 = if l_Row_5.errors > 0 then l_Localization_2:getText("AssetImportTree", "Errors") else l_Localization_2:getText("AssetImportTree", "Warnings");
    local v64 = l_Localization_2:getText("AssetImportTree", "DescendantsContain2", {
        statusCount = tostring(v62), 
        statusType = v63
    });
    local v65 = l_X_0 + l_Padding_0 + v60;
    local v66 = v48.isInactive();
    local v67 = v48.isDisabled();
    local l_Uploading_0 = l_props_5.CellProps.Uploading;
    local l_Parsing_2 = l_props_5.CellProps.Parsing;
    local v70 = if v66 then l_TextLabel_0 else l_LinkText_0;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Padding = {
            Left = l_Padding_0, 
            Right = l_Padding_0
        }, 
        Spacing = l_Padding_0
    }, {
        Icon = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v57.ImageRectSize.X, v57.ImageRectSize.Y), 
            Image = v57.Image, 
            ImageTransparency = if v67 then l_DisabledTransparancy_0 else 0
        }), 
        AssetName = v1.createElement(v70, {
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            OnClick = if not not v66 or l_Uploading_0 then nil else v48.openImportPreview, 
            Text = l_Row_5.assetName, 
            Size = UDim2.new(1, -v65, 1, 0), 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            Style = if not v67 or v66 then nil else "Disabled"
        }), 
        Status = if not (v56 > 0) or l_Row_5.uploaded or l_Parsing_2 then nil else v1.createElement(l_Image_0, {
            LayoutOrder = 3, 
            Style = {
                Image = v61.Image
            }, 
            Size = v61.Size
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = v64
            })
        })
    });
end;
v23.renderPresetCell = function(v71) --[[ Line: 235 ]] --[[ Name: renderPresetCell ]]
    -- upvalues: v1 (copy), v16 (copy), l_TextLabel_0 (copy), v22 (copy)
    local l_props_6 = v71.props;
    local l_Row_6 = l_props_6.Row;
    local l_Style_1 = l_props_6.Style;
    local v75 = l_props_6.Localization:getText("Error", "WindowTitle");
    local v76 = not v71.isInactive() and not l_props_6.CellProps.Uploading and not l_props_6.CellProps.Parsing;
    return v1.createFragment({
        PresetSelector = if v76 then v1.createElement(v16, {
            QueueItem = l_Row_6, 
            Enabled = true
        }) else v1.createElement(l_TextLabel_0, {
            Text = if l_Row_6.validSession then l_Row_6.currentPreset else v75, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = if v22() then Enum.TextTruncate.AtEnd else nil
        }), 
        Padding = v1.createElement("UIPadding", l_Style_1.AssetListCell.Padding)
    });
end;
v23.renderCreatorCell = function(v77) --[[ Line: 260 ]] --[[ Name: renderCreatorCell ]]
    -- upvalues: v1 (copy), v17 (copy), l_TextLabel_0 (copy)
    local l_props_7 = v77.props;
    local l_Row_7 = l_props_7.Row;
    local l_Style_2 = l_props_7.Style;
    local l_creatorId_0 = v77.props.Row.creatorId;
    local l_GetCreatorNameById_0 = l_props_7.CellProps.GetCreatorNameById;
    local v83 = not v77.isInactive() and not l_props_7.CellProps.Uploading and not l_props_7.CellProps.Parsing;
    return v1.createFragment({
        PresetSelector = if v83 then v1.createElement(v17, {
            Localization = v77.props.Localization, 
            OnSetItem = v77.updateCreator, 
            Value = l_creatorId_0
        }) else v1.createElement(l_TextLabel_0, {
            Text = if l_Row_7.validSession then l_GetCreatorNameById_0(l_creatorId_0) else "", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        Padding = v1.createElement("UIPadding", l_Style_2.AssetListCell.Padding)
    });
end;
v23.renderPathCell = function(v84) --[[ Line: 284 ]] --[[ Name: renderPathCell ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_LinkText_0 (copy)
    local l_props_8 = v84.props;
    local l_Padding_1 = l_props_8.Style.ImportQueue.Padding;
    local v87 = l_props_8.Width or UDim.new(1 / #l_props_8.Columns, 0);
    local l_Uploading_1 = l_props_8.CellProps.Uploading;
    local l_Parsing_3 = l_props_8.CellProps.Parsing;
    return v1.createFragment({
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Padding_1), 
            PaddingRight = UDim.new(0, l_Padding_1)
        }), 
        Path = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = l_Padding_1, 
            ClipsDescendants = true
        }, {
            PathText = v1.createElement(l_LinkText_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(v87.Scale, v87.Offset, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = l_props_8.Row.filepath, 
                TextWrapped = false, 
                OnClick = if not not l_Uploading_1 or l_Parsing_3 then nil else v84.reopenFileSelection, 
                Style = v84.isDisabled() and "Disabled" or nil
            })
        })
    });
end;
v23.renderStatusCell = function(v90) --[[ Line: 320 ]] --[[ Name: renderStatusCell ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy)
    local l_props_9 = v90.props;
    local l_Row_8 = l_props_9.Row;
    if l_Row_8.uploadResults == nil then
        return nil;
    else
        local l_Style_3 = l_props_9.Style;
        local l_SuccessIconSolid_0 = l_Style_3.Icons.SuccessIconSolid;
        local l_ErrorIcon_0 = l_Style_3.Icons.ErrorIcon;
        local l_SmallLength_0 = l_Style_3.Icons.SmallLength;
        local l_IconButtonSize_0 = l_Style_3.ImportQueue.IconButtonSize;
        local v98 = if l_Row_8.uploadResults.Succeeded then l_SuccessIconSolid_0 else l_ErrorIcon_0;
        return v1.createFragment({
            Layout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Alert = v1.createElement(l_IconButton_0, {
                IconSize = l_SmallLength_0, 
                LeftIcon = v98, 
                OnClick = v90.onStatusClicked, 
                Style = "IconOnly", 
                Size = UDim2.fromOffset(l_IconButtonSize_0, l_IconButtonSize_0), 
                LayoutOrder = 2
            })
        });
    end;
end;
v23.getContent = function(v99) --[[ Line: 352 ]] --[[ Name: getContent ]]
    -- upvalues: v21 (copy)
    local l_props_10 = v99.props;
    local l_Key_0 = l_props_10.Columns[l_props_10.ColumnIndex].Key;
    if l_Key_0 == "Checkbox" then
        return v99:renderCheckboxCell();
    elseif l_Key_0 == "Asset" then
        return v99:renderAssetCell();
    elseif l_Key_0 == "Preset" then
        return v99:renderPresetCell();
    elseif v21() and l_Key_0 == "Creator" then
        return v99:renderCreatorCell();
    elseif l_Key_0 == "Path" then
        return v99:renderPathCell();
    elseif l_Key_0 == "Status" then
        return v99:renderStatusCell();
    else
        return nil;
    end;
end;
v23.render = function(v102) --[[ Line: 373 ]] --[[ Name: render ]]
    -- upvalues: l_StyleModifier_0 (copy), v1 (copy), l_Pane_0 (copy)
    local l_props_11 = v102.props;
    local l_Style_4 = l_props_11.Style;
    local v105 = l_props_11.Width or UDim.new(1 / #l_props_11.Columns, 0);
    local v106 = if l_props_11.StyleModifier == l_StyleModifier_0.Hover then l_props_11.CellProps.ActionSelectedOverride else l_props_11.BackgroundOdd;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_11.ColumnIndex, 
        BackgroundColor3 = v106, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_4.Border, 
        Size = UDim2.new(v105.Scale, v105.Offset, 1, 0), 
        ClipsDescendants = true, 
        OnRightClick = v102.showContextMenu
    }, {
        Content = v102:getContent()
    });
end;
return (l_ContextServices_0.withContext({
    Localization = l_Localization_0, 
    FileController = v18, 
    PresetController = v19, 
    QueueController = v20, 
    Plugin = l_ContextServices_0.Plugin
})(v23));