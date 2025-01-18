local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v3.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_UI_0 = v3.UI;
local l_DragSource_0 = l_UI_0.DragSource;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v13 = require(l_Parent_0.Src.Components.PopUpButton);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local v16 = require(l_Parent_0.Src.Actions.SetEditingAssets);
local v17 = require(l_Parent_0.Src.Actions.ChangeAssetAlias);
local v18 = require(l_Parent_0.Src.Thunks.GetAssetPreviewData);
local v19 = require(l_Parent_0.Src.Thunks.OnAssetDoubleClick);
local v20 = require(l_Parent_0.Src.Thunks.OnAssetRightClick);
local v21 = require(l_Parent_0.Src.Thunks.OnAssetSingleClick);
local v22 = require(l_Parent_0.Src.Util.ReviewStatus);
local v23 = require(l_Parent_0.Src.Util.ModerationUtil);
local v24 = require(l_Parent_0.Src.Util.ModernIcons);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v27 = v1.PureComponent:extend("Tile");
local function _(v28) --[[ Line: 40 ]] --[[ Name: stripText ]]
    local v29 = string.gsub(v28, "%s+", "");
    v29 = string.gsub(v29, "\n", "");
    return (string.gsub(v29, "\t", ""));
end;
v27.init = function(v31) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_StyleModifier_0 (copy), l_AssetManagerService_0 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), l_ContentProvider_0 (copy)
    v31.state = {
        StyleModifier = nil, 
        assetFetchStatus = nil, 
        assetPreviewButtonHovered = false, 
        editText = ""
    };
    v31.editing = false;
    v31.textBoxRef = v1.createRef();
    v31.onMouseEnter = function() --[[ Line: 62 ]]
        -- upvalues: v31 (copy), l_StyleModifier_0 (ref)
        if not v31.props.Enabled then
            return;
        else
            if v31.state.StyleModifier == nil then
                v31:setState({
                    StyleModifier = l_StyleModifier_0.Hover
                });
            end;
            v31:setState({
                assetPreviewButtonHovered = true
            });
            local l_AssetData_0 = v31.props.AssetData;
            local v33 = l_AssetData_0.ClassName == "Folder";
            local v34 = l_AssetData_0.assetType == Enum.AssetType.Place;
            if not v33 and not v34 and type(v31.props.AssetsTable.assetPreviewData[l_AssetData_0.id]) ~= "table" then
                v31.props.dispatchGetAssetPreviewData(v31.props.API:get(), {
                    l_AssetData_0.id
                });
            end;
            return;
        end;
    end;
    v31.onMouseLeave = function() --[[ Line: 87 ]]
        -- upvalues: v31 (copy), l_StyleModifier_0 (ref), v1 (ref)
        if not v31.props.Enabled then
            return;
        else
            if v31.state.StyleModifier == l_StyleModifier_0.Hover then
                v31:setState({
                    StyleModifier = v1.None
                });
            end;
            v31:setState({
                assetPreviewButtonHovered = false
            });
            return;
        end;
    end;
    v31.onClick = function(v35, v36) --[[ Line: 102 ]]
        -- upvalues: v31 (copy)
        local l_props_0 = v31.props;
        if not l_props_0.Enabled then
            return;
        else
            local l_AssetData_1 = l_props_0.AssetData;
            if v36 == 0 then
                l_props_0.dispatchOnAssetSingleClick(v35, l_AssetData_1);
                return;
            else
                if v36 == 1 then
                    l_props_0.dispatchOnAssetDoubleClick(l_props_0.Analytics, l_AssetData_1);
                end;
                return;
            end;
        end;
    end;
    v31.onDragBegan = function(_) --[[ Line: 115 ]]
        -- upvalues: v31 (copy)
        local l_props_1 = v31.props;
        local l_AssetData_2 = l_props_1.AssetData;
        l_props_1.OnAssetDrag(l_AssetData_2);
    end;
    v31.onRightClick = function() --[[ Line: 121 ]]
        -- upvalues: v31 (copy)
        local l_props_2 = v31.props;
        if not l_props_2.Enabled then
            return;
        else
            local l_AssetData_3 = l_props_2.AssetData;
            if l_AssetData_3.ClassName == "Folder" then
                if not l_props_2.SelectedAssets[l_AssetData_3.Screen.LayoutOrder] then
                    l_props_2.dispatchOnAssetSingleClick(nil, l_AssetData_3);
                end;
            elseif not l_props_2.SelectedAssets[l_AssetData_3.key] then
                l_props_2.dispatchOnAssetSingleClick(nil, l_AssetData_3);
            end;
            l_props_2:dispatchOnAssetRightClick();
            return;
        end;
    end;
    v31.openAssetPreview = function() --[[ Line: 140 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            assetPreviewButtonHovered = false
        });
        local l_AssetData_4 = v31.props.AssetData;
        v31.props.OnOpenAssetPreview(l_AssetData_4);
    end;
    v31.onTextChanged = function(v45) --[[ Line: 148 ]]
        -- upvalues: v31 (copy)
        local l_Text_0 = v45.Text;
        if l_Text_0 ~= v31.props.AssetData.name then
            v31:setState({
                editText = l_Text_0
            });
        end;
    end;
    v31.onTextBoxFocusLost = function(_, _, _) --[[ Line: 157 ]]
        -- upvalues: v31 (copy), l_AssetManagerService_0 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref)
        local l_props_3 = v31.props;
        local l_AssetData_5 = l_props_3.AssetData;
        local l_editText_0 = v31.state.editText;
        if utf8.len(l_editText_0) ~= 0 then
            local l_len_0 = utf8.len;
            local v54 = string.gsub(l_editText_0, "%s+", "");
            v54 = string.gsub(v54, "\n", "");
            if l_len_0((string.gsub(v54, "\t", ""))) ~= 0 then
                if l_AssetData_5.assetType == Enum.AssetType.Place then
                    l_AssetManagerService_0:RenamePlace(l_AssetData_5.id, l_editText_0);
                elseif l_AssetData_5.assetType == Enum.AssetType.Image or l_AssetData_5.assetType == Enum.AssetType.MeshPart or l_enableAudioImport_0() and l_AssetData_5.assetType == Enum.AssetType.Audio or l_enableVideoImport_0() and l_AssetData_5.assetType == Enum.AssetType.Video then
                    l_len_0 = nil;
                    if l_AssetData_5.assetType == Enum.AssetType.Image then
                        l_len_0 = "Images/";
                    elseif l_AssetData_5.assetType == Enum.AssetType.MeshPart then
                        l_len_0 = "Meshes/";
                    elseif l_enableAudioImport_0() and l_AssetData_5.assetType == Enum.AssetType.Audio then
                        l_len_0 = "Audio/";
                    elseif l_enableVideoImport_0() and l_AssetData_5.assetType == Enum.AssetType.Video then
                        l_len_0 = "Video/";
                    elseif l_AssetData_5.assetType == Enum.AssetType.Model then
                        l_len_0 = "Models/";
                    end;
                    l_AssetManagerService_0:RenameAlias(l_AssetData_5.assetType.Value, l_AssetData_5.id, l_len_0 .. l_AssetData_5.name, l_len_0 .. l_editText_0);
                end;
            end;
        end;
        l_props_3.dispatchSetEditingAssets({});
        l_props_3.dispatchChangeAssetAlias(tostring(l_AssetData_5.id), l_editText_0);
        v31:setState({
            editText = l_props_3.AssetData.name
        });
        v31.editing = false;
    end;
    local l_AssetData_6 = v31.props.AssetData;
    local v56 = l_AssetData_6.ClassName == "Folder";
    local l_id_0 = l_AssetData_6.id;
    if not v56 then
        if l_AssetData_6.assetType == Enum.AssetType.Place then
            v31.thumbnailUrl = string.format("rbxthumb://type=AutoGeneratedAsset&id=%i&w=%i&h=%i", l_id_0, 150, 150);
        else
            v31.thumbnailUrl = string.format("rbxthumb://type=Asset&id=%i&w=%i&h=%i", l_id_0, 150, 150);
        end;
        spawn(function() --[[ Line: 212 ]]
            -- upvalues: v31 (copy), l_ContentProvider_0 (ref)
            local v58 = {
                v31.thumbnailUrl
            };
            l_ContentProvider_0:PreloadAsync(v58, function(_, v60) --[[ Line: 214 ]] --[[ Name: setStatus ]]
                -- upvalues: v31 (ref)
                v31:setState({
                    assetFetchStatus = v60
                });
            end);
        end);
    end;
end;
v27.didMount = function(v61) --[[ Line: 224 ]] --[[ Name: didMount ]]
    v61:setState({
        editText = v61.props.AssetData.name
    });
end;
v27.didUpdate = function(v62, _, _) --[[ Line: 230 ]] --[[ Name: didUpdate ]]
    local l_props_4 = v62.props;
    local l_AssetData_7 = l_props_4.AssetData;
    if l_props_4.EditingAssets[l_AssetData_7.id] then
        if l_props_4.RecentListItem then
            return;
        elseif v62.textBoxRef and v62.textBoxRef.current and not v62.editing then
            local l_current_0 = v62.textBoxRef.current;
            l_current_0:CaptureFocus();
            l_current_0.SelectionStart = 1;
            l_current_0.CursorPosition = #l_current_0.Text + 1;
            v62.editing = true;
        end;
    end;
end;
v27.render = function(v68) --[[ Line: 248 ]] --[[ Name: render ]]
    -- upvalues: l_GetTextSize_0 (copy), v24 (copy), v22 (copy), v23 (copy), v1 (copy), l_DragSource_0 (copy), l_Pane_0 (copy), v13 (copy), l_Tooltip_0 (copy)
    local l_props_5 = v68.props;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_Localization_0 = l_props_5.Localization;
    local l_Enabled_0 = l_props_5.Enabled;
    local l_Size_0 = l_Stylizer_0.Size;
    local l_AssetData_8 = l_props_5.AssetData;
    local l_BackgroundColor_0 = l_Stylizer_0.BackgroundColor;
    local l_BackgroundTransparency_0 = l_Stylizer_0.BackgroundTransparency;
    local _ = l_Stylizer_0.BorderSizePixel;
    local l_Color_0 = l_Stylizer_0.Text.Color;
    local l_Font_0 = l_Stylizer_0.Font;
    local l_Size_1 = l_Stylizer_0.Text.Size;
    local l_BackgroundTransparency_1 = l_Stylizer_0.Text.BackgroundTransparency;
    local l_TextTruncate_0 = l_Stylizer_0.Text.TextTruncate;
    local l_XAlignment_0 = l_Stylizer_0.Text.XAlignment;
    local l_YAlignment_0 = l_Stylizer_0.Text.YAlignment;
    local l_Size_2 = l_Stylizer_0.Text.Frame.Size;
    local l_Position_0 = l_Stylizer_0.Text.Frame.Position;
    local l_editText_1 = v68.state.editText;
    local v88 = l_props_5.EditingAssets[l_AssetData_8.id];
    local l_TextWrapped_0 = l_Stylizer_0.EditText.TextWrapped;
    local l_ClearTextOnFocus_0 = l_Stylizer_0.EditText.ClearTextOnFocus;
    local l_XAlignment_1 = l_Stylizer_0.Text.XAlignment;
    local l_BackgroundColor_1 = l_Stylizer_0.EditText.Frame.BackgroundColor;
    local l_BorderColor_0 = l_Stylizer_0.EditText.Frame.BorderColor;
    local v94 = l_GetTextSize_0(l_editText_1, l_Size_1, l_Font_0, Vector2.new(l_Stylizer_0.Size.X.Offset, 1e999));
    local v95 = nil;
    v95 = if v94.X < l_Stylizer_0.Size.X.Offset then l_Stylizer_0.EditText.TextPadding else 0;
    local l_name_0 = l_AssetData_8.name;
    local l_name_1 = l_AssetData_8.name;
    if l_GetTextSize_0(l_AssetData_8.name, l_Size_1, l_Font_0, Vector2.new(l_Size_2.X.Offset, 1e999)).Y > l_Size_2.Y.Offset then
        l_name_1 = string.sub(l_AssetData_8.name, 1, 12) .. "..." .. string.sub(l_AssetData_8.name, string.len(l_AssetData_8.name) - 5);
    end;
    local v98 = l_AssetData_8.ClassName == "Folder";
    local v99 = l_AssetData_8.assetType == Enum.AssetType.Place;
    local v100 = nil;
    v100 = if v98 then v24.getIconForCurrentTheme(l_AssetData_8.Screen.Image) else v68.state.assetFetchStatus == Enum.AssetFetchStatus.Success and v68.thumbnailUrl or l_Stylizer_0.Image.PlaceHolder;
    local l_FrameSize_0 = l_Stylizer_0.Image.FrameSize;
    local l_ImageSize_0 = l_Stylizer_0.Image.ImageSize;
    local l_Position_1 = l_Stylizer_0.Image.Position;
    local l_FolderPosition_0 = l_Stylizer_0.Image.FolderPosition;
    local l_FolderAnchorPosition_0 = l_Stylizer_0.Image.FolderAnchorPosition;
    local l_BackgroundColor_2 = l_Stylizer_0.Image.BackgroundColor;
    local v107 = not v98 and not v99;
    local l_assetPreviewButtonHovered_0 = v68.state.assetPreviewButtonHovered;
    local v109 = v24.getIconForCurrentTheme(v24.IconEnums.Zoom);
    local l_Offset_0 = l_Stylizer_0.AssetPreview.Button.Offset;
    local l_isRootPlace_0 = l_AssetData_8.isRootPlace;
    local l_Size_3 = l_Stylizer_0.Image.StartingPlace.Size;
    local v113 = v24.getIconForCurrentTheme(v24.IconEnums.Spawn);
    local l_XOffset_0 = l_Stylizer_0.Image.StartingPlace.XOffset;
    local l_YOffset_0 = l_Stylizer_0.Image.StartingPlace.YOffset;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local v117 = v98 and "Frame" or "ImageLabel";
    local v118 = {
        Size = l_FrameSize_0, 
        Position = l_Position_1, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_BackgroundColor_2, 
        BorderSizePixel = 0
    };
    if not v98 then
        v118.Image = v100;
    end;
    local v119 = nil;
    local v120 = nil;
    local v121 = nil;
    local v122 = nil;
    local v123 = nil;
    local v124 = nil;
    if not v98 then
        local l_ModerationData_0 = l_props_5.ModerationData;
        if l_ModerationData_0 and next(l_ModerationData_0) ~= nil then
            local v126 = l_ModerationData_0.reviewStatus == v22.Pending;
            local v127 = v23.isApprovedAsset(l_ModerationData_0);
            v119 = v126 or not v127;
            if v119 then
                if v126 then
                    v120 = l_Stylizer_0.Image.ModerationStatus.Pending;
                elseif not v127 then
                    v120 = l_Stylizer_0.Image.ModerationStatus.Rejected;
                end;
                v121 = l_Stylizer_0.Image.ModerationStatus.Size;
                v122 = l_Stylizer_0.Image.ModerationStatus.XOffset;
                v123 = l_Stylizer_0.Image.ModerationStatus.YOffset;
                v124 = v23.getModerationTooltip(l_Localization_0, l_ModerationData_0);
            end;
        end;
    end;
    return v1.createElement(l_DragSource_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = v68.onClick, 
        OnRightClick = v68.onRightClick, 
        OnDragBegan = v68.onDragBegan
    }, {
        Button = v1.createElement(l_Pane_0, {
            BackgroundColor = l_BackgroundColor_0, 
            Size = l_Size_0, 
            Transparency = l_BackgroundTransparency_0, 
            [v1.Event.MouseEnter] = v68.onMouseEnter, 
            [v1.Event.MouseLeave] = v68.onMouseLeave
        }, {
            ThumbnailContainer = v1.createElement(v117, v118, {
                AssetPreviewButton = v107 and v1.createElement(v13, {
                    Position = UDim2.new(1, -l_Offset_0, 0, l_Offset_0), 
                    Image = v109, 
                    ShowIcon = l_assetPreviewButtonHovered_0, 
                    OnClick = v68.openAssetPreview, 
                    OnRightClick = v68.onRightClick
                }), 
                RootPlaceImage = l_isRootPlace_0 and v1.createElement("ImageLabel", {
                    Size = UDim2.new(0, l_Size_3, 0, l_Size_3), 
                    Position = UDim2.new(0, l_XOffset_0, 0, l_YOffset_0), 
                    Image = v113, 
                    BackgroundTransparency = 1
                }), 
                ModerationStatusImage = v119 and v1.createElement("ImageLabel", {
                    Size = UDim2.new(0, v121, 0, v121), 
                    Position = UDim2.new(0, v122, 0, v123), 
                    Image = v120, 
                    BackgroundTransparency = 1
                }, {
                    ModerationTooltip = v1.createElement(l_Tooltip_0, {
                        Text = v124, 
                        Enabled = l_Enabled_0
                    })
                }), 
                FolderImage = v98 and v1.createElement("ImageLabel", {
                    Size = l_ImageSize_0, 
                    Image = v100, 
                    Position = l_FolderPosition_0, 
                    AnchorPoint = l_FolderAnchorPosition_0, 
                    BackgroundTransparency = 1
                })
            }), 
            Name = not v88 and v1.createElement("TextLabel", {
                Size = l_Size_2, 
                Position = l_Position_0, 
                Text = l_name_1, 
                TextColor3 = l_Color_0, 
                Font = l_Font_0, 
                TextSize = l_Size_1, 
                BackgroundTransparency = l_BackgroundTransparency_1, 
                TextXAlignment = l_XAlignment_0, 
                TextYAlignment = l_YAlignment_0, 
                TextTruncate = l_TextTruncate_0, 
                TextWrapped = true
            }), 
            RenameTextBox = v88 and v1.createElement("TextBox", {
                Size = UDim2.new(0, v94.X + v95, 0, v94.Y), 
                Position = l_Position_0, 
                BackgroundColor3 = l_BackgroundColor_1, 
                BorderColor3 = l_BorderColor_0, 
                Text = l_editText_1, 
                TextColor3 = l_Color_0, 
                Font = l_Font_0, 
                TextSize = l_Size_1, 
                TextXAlignment = l_XAlignment_1, 
                TextTruncate = Enum.TextTruncate.None, 
                TextWrapped = l_TextWrapped_0, 
                ClearTextOnFocus = l_ClearTextOnFocus_0, 
                [v1.Ref] = v68.textBoxRef, 
                [v1.Change.Text] = v68.onTextChanged, 
                [v1.Event.FocusLost] = v68.onTextBoxFocusLost
            }), 
            NameTooltip = v1.createElement(l_Tooltip_0, {
                Text = l_name_0, 
                Enabled = l_Enabled_0
            }), 
            DEPRECATED_Tooltip = l_Enabled_0 and v1.createElement(l_Tooltip_0, {
                Text = l_name_0, 
                Enabled = true
            })
        })
    });
end;
v27 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    API = l_ContextServices_0.API, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v27);
return v2.connect(function(v128, _) --[[ Line: 491 ]] --[[ Name: mapStateToProps ]]
    local l_AssetManagerReducer_0 = v128.AssetManagerReducer;
    return {
        AssetsTable = l_AssetManagerReducer_0.assetsTable, 
        EditingAssets = l_AssetManagerReducer_0.editingAssets, 
        SelectedAssets = l_AssetManagerReducer_0.selectedAssets
    };
end, function(v131) --[[ Line: 500 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v19 (copy), v20 (copy), v21 (copy), v16 (copy), v17 (copy)
    return {
        dispatchGetAssetPreviewData = function(v132, v133) --[[ Line: 502 ]] --[[ Name: dispatchGetAssetPreviewData ]]
            -- upvalues: v131 (copy), v18 (ref)
            v131(v18(v132, v133));
        end, 
        dispatchOnAssetDoubleClick = function(v134, v135) --[[ Line: 505 ]] --[[ Name: dispatchOnAssetDoubleClick ]]
            -- upvalues: v131 (copy), v19 (ref)
            v131(v19(v134, v135));
        end, 
        dispatchOnAssetRightClick = function(v136) --[[ Line: 508 ]] --[[ Name: dispatchOnAssetRightClick ]]
            -- upvalues: v131 (copy), v20 (ref)
            v131(v20(v136));
        end, 
        dispatchOnAssetSingleClick = function(v137, v138) --[[ Line: 511 ]] --[[ Name: dispatchOnAssetSingleClick ]]
            -- upvalues: v131 (copy), v21 (ref)
            v131(v21(v137, v138));
        end, 
        dispatchSetEditingAssets = function(v139) --[[ Line: 514 ]] --[[ Name: dispatchSetEditingAssets ]]
            -- upvalues: v131 (copy), v16 (ref)
            v131(v16(v139));
        end, 
        dispatchChangeAssetAlias = function(v140, v141) --[[ Line: 517 ]] --[[ Name: dispatchChangeAssetAlias ]]
            -- upvalues: v131 (copy), v17 (ref)
            v131(v17(v140, v141));
        end
    };
end)(v27);