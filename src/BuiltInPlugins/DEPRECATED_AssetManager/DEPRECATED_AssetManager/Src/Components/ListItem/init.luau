local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_DragSource_0 = l_UI_0.DragSource;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Util_0 = v4.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local _ = l_Util_0.FitFrame.FitFrameOnAxis;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local v16 = require(l_Parent_0.Src.Actions.SetEditingAssets);
local v17 = require(l_Parent_0.Src.Actions.ChangeAssetAlias);
local v18 = require(l_Parent_0.Src.Thunks.GetAssetPreviewData);
local v19 = require(l_Parent_0.Src.Thunks.OnAssetDoubleClick);
local v20 = require(l_Parent_0.Src.Thunks.OnAssetRightClick);
local v21 = require(l_Parent_0.Src.Thunks.OnAssetSingleClick);
local v22 = require(l_Parent_0.Src.Thunks.OnRecentAssetRightClick);
local v23 = require(l_Parent_0.Src.Util.ReviewStatus);
local v24 = require(l_Parent_0.Src.Util.ModerationUtil);
local v25 = require(l_Parent_0.Src.Util.ModernIcons);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_StudioService_0 = game:GetService("StudioService");
local v29 = v2.PureComponent:extend("ListItem");
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local function _(v32) --[[ Line: 47 ]] --[[ Name: stripText ]]
    local v33 = string.gsub(v32, "%s+", "");
    v33 = string.gsub(v33, "\n", "");
    return (string.gsub(v33, "\t", ""));
end;
local function v37(v35) --[[ Line: 54 ]] --[[ Name: getClassIcon ]]
    -- upvalues: l_StudioService_0 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy)
    local l_assetType_0 = v35.assetType;
    if l_assetType_0 == Enum.AssetType.Place then
        if v35.isRootPlace then
            return l_StudioService_0:GetClassIcon("SpawnLocation");
        else
            return l_StudioService_0:GetClassIcon("Workspace");
        end;
    elseif l_assetType_0 == Enum.AssetType.Package then
        return l_StudioService_0:GetClassIcon("Model");
    elseif l_assetType_0 == Enum.AssetType.Image then
        return l_StudioService_0:GetClassIcon("Decal");
    elseif l_assetType_0 == Enum.AssetType.MeshPart then
        return l_StudioService_0:GetClassIcon("MeshPart");
    elseif l_enableAudioImport_0() and l_assetType_0 == Enum.AssetType.Audio then
        return l_StudioService_0:GetClassIcon("Sound");
    elseif l_enableVideoImport_0() and l_assetType_0 == Enum.AssetType.Video then
        return l_StudioService_0:GetClassIcon("VideoFrame");
    elseif l_assetType_0 == Enum.AssetType.Model then
        return l_StudioService_0:GetClassIcon("Model");
    else
        return;
    end;
end;
v29.isFolder = function(v38) --[[ Line: 77 ]] --[[ Name: isFolder ]]
    return v38.props.AssetData.ClassName == "Folder";
end;
v29.init = function(v39) --[[ Line: 83 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_StyleModifier_0 (copy), l_AssetManagerService_0 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), l_ContentProvider_0 (copy)
    v39.state = {
        StyleModifier = nil, 
        assetFetchStatus = nil, 
        editText = ""
    };
    v39.editing = false;
    v39.textBoxRef = v2.createRef();
    v39.onMouseEnter = function() --[[ Line: 95 ]]
        -- upvalues: v39 (copy), l_StyleModifier_0 (ref)
        if not v39.props.Enabled then
            return;
        else
            if v39.state.StyleModifier == nil then
                v39:setState({
                    StyleModifier = l_StyleModifier_0.Hover
                });
            end;
            local l_AssetData_0 = v39.props.AssetData;
            local v41 = l_AssetData_0.ClassName == "Folder";
            local v42 = l_AssetData_0.assetType == Enum.AssetType.Place;
            if not v41 and not v42 and type(v39.props.AssetsTable.assetPreviewData[l_AssetData_0.id]) ~= "table" then
                v39.props.dispatchGetAssetPreviewData(v39.props.API:get(), {
                    l_AssetData_0.id
                });
            end;
            return;
        end;
    end;
    v39.onMouseLeave = function() --[[ Line: 117 ]]
        -- upvalues: v39 (copy), l_StyleModifier_0 (ref), v2 (ref)
        if not v39.props.Enabled then
            return;
        else
            if v39.state.StyleModifier == l_StyleModifier_0.Hover then
                v39:setState({
                    StyleModifier = v2.None
                });
            end;
            return;
        end;
    end;
    v39.onClick = function(v43, v44) --[[ Line: 129 ]]
        -- upvalues: v39 (copy)
        local l_props_0 = v39.props;
        if not l_props_0.Enabled then
            return;
        else
            local l_AssetData_1 = l_props_0.AssetData;
            if v44 == 0 then
                l_props_0.dispatchOnAssetSingleClick(v43, l_AssetData_1);
                return;
            else
                if v44 == 1 then
                    l_props_0.dispatchOnAssetDoubleClick(l_props_0.Analytics, l_AssetData_1);
                end;
                return;
            end;
        end;
    end;
    v39.onDragBegan = function(_) --[[ Line: 142 ]]
        -- upvalues: v39 (copy)
        if v39:isFolder() then
            return;
        else
            local l_props_1 = v39.props;
            if not l_props_1.OnAssetDrag then
                return;
            else
                local l_AssetData_2 = l_props_1.AssetData;
                l_props_1.OnAssetDrag(l_AssetData_2);
                return;
            end;
        end;
    end;
    v39.onRightClick = function() --[[ Line: 154 ]]
        -- upvalues: v39 (copy)
        local l_props_2 = v39.props;
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
            if l_props_2.RecentListItem then
                l_props_2:dispatchOnRecentAssetRightClick();
                return;
            else
                l_props_2:dispatchOnAssetRightClick();
                return;
            end;
        end;
    end;
    v39.onTextChanged = function(v52) --[[ Line: 177 ]]
        -- upvalues: v39 (copy)
        local l_Text_0 = v52.Text;
        if l_Text_0 ~= v39.props.AssetData.name then
            v39:setState({
                editText = l_Text_0
            });
        end;
    end;
    v39.onTextBoxFocusLost = function(_, _, _) --[[ Line: 186 ]]
        -- upvalues: v39 (copy), l_AssetManagerService_0 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref)
        local l_props_3 = v39.props;
        local l_AssetData_4 = l_props_3.AssetData;
        local l_editText_0 = v39.state.editText;
        if utf8.len(l_editText_0) ~= 0 then
            local l_len_0 = utf8.len;
            local v61 = string.gsub(l_editText_0, "%s+", "");
            v61 = string.gsub(v61, "\n", "");
            if l_len_0((string.gsub(v61, "\t", ""))) ~= 0 then
                if l_AssetData_4.assetType == Enum.AssetType.Place then
                    l_AssetManagerService_0:RenamePlace(l_AssetData_4.id, l_editText_0);
                elseif l_AssetData_4.assetType == Enum.AssetType.Image or l_AssetData_4.assetType == Enum.AssetType.MeshPart or l_enableAudioImport_0() and l_AssetData_4.assetType == Enum.AssetType.Audio or l_enableVideoImport_0() and l_AssetData_4.assetType == Enum.AssetType.Video then
                    l_len_0 = nil;
                    if l_AssetData_4.assetType == Enum.AssetType.Image then
                        l_len_0 = "Images/";
                    elseif l_AssetData_4.assetType == Enum.AssetType.MeshPart then
                        l_len_0 = "Meshes/";
                    elseif l_enableAudioImport_0() and l_AssetData_4.assetType == Enum.AssetType.Audio then
                        l_len_0 = "Audio/";
                    elseif l_enableVideoImport_0() and l_AssetData_4.assetType == Enum.AssetType.Video then
                        l_len_0 = "Video/";
                    elseif l_AssetData_4.assetType == Enum.AssetType.Model then
                        l_len_0 = "Models/";
                    end;
                    l_AssetManagerService_0:RenameAlias(l_AssetData_4.assetType.Value, l_AssetData_4.id, l_len_0 .. l_AssetData_4.name, l_len_0 .. l_editText_0);
                end;
            end;
        end;
        l_props_3.dispatchSetEditingAssets({});
        l_props_3.dispatchChangeAssetAlias(tostring(l_AssetData_4.id), l_editText_0);
        v39:setState({
            editText = l_props_3.AssetData.name
        });
        v39.editing = false;
    end;
    local l_AssetData_5 = v39.props.AssetData;
    local v63 = l_AssetData_5.ClassName == "Folder";
    local l_id_0 = l_AssetData_5.id;
    if not v63 then
        if l_AssetData_5.assetType == Enum.AssetType.Place then
            v39.thumbnailUrl = string.format("rbxthumb://type=AutoGeneratedAsset&id=%i&w=%i&h=%i", l_id_0, 150, 150);
        else
            v39.thumbnailUrl = string.format("rbxthumb://type=Asset&id=%i&w=%i&h=%i", l_id_0, 150, 150);
        end;
        spawn(function() --[[ Line: 241 ]]
            -- upvalues: v39 (copy), l_ContentProvider_0 (ref)
            local v65 = {
                v39.thumbnailUrl
            };
            l_ContentProvider_0:PreloadAsync(v65, function(_, v67) --[[ Line: 243 ]] --[[ Name: setStatus ]]
                -- upvalues: v39 (ref)
                v39:setState({
                    assetFetchStatus = v67
                });
            end);
        end);
    end;
end;
v29.didMount = function(v68) --[[ Line: 253 ]] --[[ Name: didMount ]]
    v68:setState({
        editText = v68.props.AssetData.name
    });
end;
v29.didUpdate = function(v69, _, _) --[[ Line: 259 ]] --[[ Name: didUpdate ]]
    local l_props_4 = v69.props;
    local l_AssetData_6 = l_props_4.AssetData;
    if l_props_4.EditingAssets[l_AssetData_6.id] then
        if l_props_4.RecentListItem then
            return;
        elseif v69.textBoxRef and v69.textBoxRef.current and not v69.editing then
            local l_current_0 = v69.textBoxRef.current;
            l_current_0:CaptureFocus();
            l_current_0.SelectionStart = 1;
            l_current_0.CursorPosition = #l_current_0.Text + 1;
            v69.editing = true;
        end;
    end;
end;
v29.render = function(v75) --[[ Line: 277 ]] --[[ Name: render ]]
    -- upvalues: v25 (copy), v37 (copy), l_GetTextSize_0 (copy), l_LayoutOrderIterator_0 (copy), v23 (copy), v24 (copy), v2 (copy), l_DragSource_0 (copy), l_Pane_0 (copy), v1 (copy), l_Tooltip_0 (copy)
    local l_props_5 = v75.props;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_Localization_0 = l_props_5.Localization;
    local l_Enabled_0 = l_props_5.Enabled;
    local l_Size_0 = l_Stylizer_0.Size;
    local l_AssetData_7 = l_props_5.AssetData;
    local l_BackgroundColor_0 = l_Stylizer_0.BackgroundColor;
    local l_BackgroundTransparency_0 = l_Stylizer_0.BackgroundTransparency;
    local l_Spacing_0 = l_Stylizer_0.Spacing;
    local v85 = {};
    local v86 = l_AssetData_7.ClassName == "Folder";
    if v86 then
        if l_AssetData_7.Screen.Image == nil then
            v85.Image = v25.getIconForCurrentTheme(v25.IconEnums.BlankFolder);
        else
            v85.Image = v25.getIconForCurrentTheme(l_AssetData_7.Screen.Image);
        end;
    elseif v75.state.assetFetchStatus == Enum.AssetFetchStatus.Success then
        if l_AssetData_7.assetType == Enum.AssetType.Place and l_AssetData_7.isRootPlace then
            v85 = v37(l_AssetData_7);
        else
            v85.Image = v75.thumbnailUrl;
        end;
    elseif v75.state.assetFetchStatus == Enum.AssetFetchStatus.Failure or l_props_5.RecentListItem then
        v85 = v37(l_AssetData_7);
    end;
    local l_FrameSize_0 = l_Stylizer_0.Image.FrameSize;
    local l_ImageSize_0 = l_Stylizer_0.Image.ImageSize;
    local l_ImagePosition_0 = l_Stylizer_0.Image.ImagePosition;
    local l_ImageAnchorPosition_0 = l_Stylizer_0.Image.ImageAnchorPosition;
    local l_BackgroundColor_1 = l_Stylizer_0.Image.BackgroundColor;
    local l_Color_0 = l_Stylizer_0.Text.Color;
    local l_Font_0 = l_Stylizer_0.Font;
    local l_Size_1 = l_Stylizer_0.Text.Size;
    local l_BackgroundTransparency_1 = l_Stylizer_0.Text.BackgroundTransparency;
    local l_TextTruncate_0 = l_Stylizer_0.Text.TextTruncate;
    local l_XAlignment_0 = l_Stylizer_0.Text.XAlignment;
    local l_YAlignment_0 = l_Stylizer_0.Text.YAlignment;
    local l_Size_2 = l_Stylizer_0.Text.Frame.Size;
    local l_editText_1 = v75.state.editText;
    local v101 = l_props_5.EditingAssets[l_AssetData_7.id];
    local l_TextPadding_0 = l_Stylizer_0.EditText.TextPadding;
    local l_ClearTextOnFocus_0 = l_Stylizer_0.EditText.ClearTextOnFocus;
    local l_XAlignment_1 = l_Stylizer_0.Text.XAlignment;
    local l_BackgroundColor_2 = l_Stylizer_0.EditText.Frame.BackgroundColor;
    local l_BorderColor_0 = l_Stylizer_0.EditText.Frame.BorderColor;
    local v107 = l_GetTextSize_0(l_editText_1, l_Size_1, l_Font_0, Vector2.new(l_Stylizer_0.Size.X.Offset, 1e999));
    local l_name_0 = l_AssetData_7.name;
    local l_name_1 = l_AssetData_7.name;
    if l_GetTextSize_0(l_AssetData_7.name, l_Size_1, l_Font_0, Vector2.new(l_Size_2.X.Offset, 1e999)).Y > l_Size_2.Y.Offset then
        l_name_1 = string.sub(l_AssetData_7.name, 1, 12) .. "..." .. string.sub(l_AssetData_7.name, string.len(l_AssetData_7.name) - 5);
    end;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local v111 = l_LayoutOrderIterator_0.new();
    local v112 = nil;
    local v113 = nil;
    local v114 = nil;
    l_Size_2 = UDim2.new(1, l_Stylizer_0.Text.Frame.XOffset, 0, l_Stylizer_0.Text.Frame.YOffset);
    if not v86 then
        local l_ModerationData_0 = l_props_5.ModerationData;
        if l_ModerationData_0 and next(l_ModerationData_0) ~= nil then
            local v116 = l_ModerationData_0.reviewStatus == v23.Pending;
            local v117 = v24.isApprovedAsset(l_ModerationData_0);
            v113 = v116 or not v117;
            if v113 then
                if v116 then
                    v112 = l_Stylizer_0.Image.ModerationStatus.Pending;
                elseif not v117 then
                    v112 = l_Stylizer_0.Image.ModerationStatus.Rejected;
                end;
                l_Size_2 = UDim2.new(1, 2 * l_Stylizer_0.Text.Frame.XOffset - l_Stylizer_0.Text.Frame.Padding, 0, l_Stylizer_0.Text.Frame.YOffset);
                v114 = v24.getModerationTooltip(l_Localization_0, l_ModerationData_0);
            end;
        end;
    end;
    return v2.createElement(l_DragSource_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = v75.onClick, 
        OnRightClick = v75.onRightClick, 
        OnDragBegan = v75.onDragBegan
    }, {
        ListItem = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor = l_BackgroundColor_0, 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_Spacing_0, 
            Transparency = l_BackgroundTransparency_0, 
            [v2.Event.MouseEnter] = v75.onMouseEnter, 
            [v2.Event.MouseLeave] = v75.onMouseLeave
        }, {
            ImageFrame = v2.createElement("Frame", {
                Size = l_FrameSize_0, 
                LayoutOrder = v111:getNextOrder(), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_BackgroundColor_1, 
                BorderSizePixel = 0
            }, {
                Image = v2.createElement("ImageLabel", v1.Dictionary.join(v85, {
                    Size = l_ImageSize_0, 
                    Position = l_ImagePosition_0, 
                    AnchorPoint = l_ImageAnchorPosition_0, 
                    BackgroundTransparency = 1
                }))
            }), 
            Name = not v101 and v2.createElement("TextLabel", {
                Size = l_Size_2, 
                LayoutOrder = v111:getNextOrder(), 
                Text = l_name_1, 
                TextColor3 = l_Color_0, 
                Font = l_Font_0, 
                TextSize = l_Size_1, 
                BackgroundTransparency = l_BackgroundTransparency_1, 
                TextXAlignment = l_XAlignment_0, 
                TextYAlignment = l_YAlignment_0, 
                TextTruncate = l_TextTruncate_0, 
                TextWrapped = true
            }, {
                NameTooltip = v2.createElement(l_Tooltip_0, {
                    Text = l_name_0, 
                    Enabled = l_Enabled_0
                })
            }), 
            RenameTextBox = v101 and v2.createElement("TextBox", {
                Size = UDim2.new(0, v107.X + l_TextPadding_0, 0, l_Size_2.Y.Offset), 
                LayoutOrder = v111:getNextOrder(), 
                BackgroundColor3 = l_BackgroundColor_2, 
                BorderColor3 = l_BorderColor_0, 
                Text = l_editText_1, 
                TextColor3 = l_Color_0, 
                Font = l_Font_0, 
                TextSize = l_Size_1, 
                TextXAlignment = l_XAlignment_1, 
                ClearTextOnFocus = l_ClearTextOnFocus_0, 
                [v2.Ref] = v75.textBoxRef, 
                [v2.Change.Text] = v75.onTextChanged, 
                [v2.Event.FocusLost] = v75.onTextBoxFocusLost
            }), 
            ModerationImageFrame = v113 and v2.createElement("Frame", {
                Size = l_FrameSize_0, 
                LayoutOrder = v111:getNextOrder(), 
                BackgroundTransparency = 1
            }, {
                Image = v2.createElement("ImageLabel", {
                    Image = v112, 
                    Size = l_ImageSize_0, 
                    Position = l_ImagePosition_0, 
                    AnchorPoint = l_ImageAnchorPosition_0, 
                    BackgroundTransparency = 1
                }), 
                ModerationTooltip = v2.createElement(l_Tooltip_0, {
                    Text = v114, 
                    Enabled = l_Enabled_0
                })
            })
        })
    });
end;
v29 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    API = l_ContextServices_0.API, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v29);
return v3.connect(function(v118, _) --[[ Line: 494 ]] --[[ Name: mapStateToProps ]]
    local l_AssetManagerReducer_0 = v118.AssetManagerReducer;
    return {
        AssetsTable = l_AssetManagerReducer_0.assetsTable, 
        EditingAssets = l_AssetManagerReducer_0.editingAssets, 
        SelectedAssets = l_AssetManagerReducer_0.selectedAssets
    };
end, function(v121) --[[ Line: 503 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v16 (copy), v17 (copy)
    return {
        dispatchGetAssetPreviewData = function(v122, v123) --[[ Line: 505 ]] --[[ Name: dispatchGetAssetPreviewData ]]
            -- upvalues: v121 (copy), v18 (ref)
            v121(v18(v122, v123));
        end, 
        dispatchOnAssetDoubleClick = function(v124, v125) --[[ Line: 508 ]] --[[ Name: dispatchOnAssetDoubleClick ]]
            -- upvalues: v121 (copy), v19 (ref)
            v121(v19(v124, v125));
        end, 
        dispatchOnAssetRightClick = function(v126) --[[ Line: 511 ]] --[[ Name: dispatchOnAssetRightClick ]]
            -- upvalues: v121 (copy), v20 (ref)
            v121(v20(v126));
        end, 
        dispatchOnAssetSingleClick = function(v127, v128) --[[ Line: 514 ]] --[[ Name: dispatchOnAssetSingleClick ]]
            -- upvalues: v121 (copy), v21 (ref)
            v121(v21(v127, v128));
        end, 
        dispatchOnRecentAssetRightClick = function(v129) --[[ Line: 517 ]] --[[ Name: dispatchOnRecentAssetRightClick ]]
            -- upvalues: v121 (copy), v22 (ref)
            v121(v22(v129));
        end, 
        dispatchSetEditingAssets = function(v130) --[[ Line: 520 ]] --[[ Name: dispatchSetEditingAssets ]]
            -- upvalues: v121 (copy), v16 (ref)
            v121(v16(v130));
        end, 
        dispatchChangeAssetAlias = function(v131, v132) --[[ Line: 523 ]] --[[ Name: dispatchChangeAssetAlias ]]
            -- upvalues: v121 (copy), v17 (ref)
            v121(v17(v131, v132));
        end
    };
end)(v29);