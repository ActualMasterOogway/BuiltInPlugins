local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.SharedFlags.getFFlagModelPreviewThumbnailFallback);
local v6 = require(l_Parent_0.Util.Typecheck);
local v7 = require(l_Parent_0.Util.AssetRenderUtil);
local l_AssetRenderType_0 = v7.AssetRenderType;
local v9 = require(l_Parent_0.Parent.Cryo);
local v10 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v10.join;
local v12 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v13 = require(l_Parent_0.UI.Components.Container);
local v14 = require(l_Parent_0.UI.Components.HoverArea);
local v15 = require(l_Parent_0.UI.Components.LoadingIndicator);
local v16 = require(l_Parent_0.UI.Components.Pane);
local v17 = require(l_Parent_0.UI.Components.InstanceTreeView);
local v18 = require(l_Parent_0.UI.Components.TextLabel);
local v19 = require(l_Parent_0.UI.Components.AudioPlayer);
local v20 = require(l_Parent_0.UI.Components.VideoPlayer);
local v21 = require(l_Parent_0.UI.Components.AssetRenderImage);
local v22 = require(l_Parent_0.UI.Components.AssetRenderModel);
local v23 = require(l_Parent_0.UI.Components.AssetRenderThumbnail);
local v24 = require(l_Parent_0.UI.Components.ImageCarousel);
local v25 = v2.PureComponent:extend("AssetRender");
v6.wrap(v25, script);
v25.init = function(v26) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy)
    v26.state = {
        treeViewSelection = {}, 
        treeViewExpansion = {}, 
        treeViewVisible = false, 
        isFontLoaded = false
    };
    v26.memoizedTreeViewInstances = {};
    v26.toggleTreeViewVisible = function() --[[ Line: 86 ]]
        -- upvalues: v26 (copy)
        v26:setState(function(v27) --[[ Line: 87 ]]
            return {
                treeViewVisible = not v27.treeViewVisible
            };
        end);
    end;
    v26.onTreeViewExpansionChange = function(v28) --[[ Line: 94 ]]
        -- upvalues: v26 (copy), l_join_0 (ref)
        v26:setState({
            treeViewExpansion = l_join_0(v26.state.treeViewExpansion, v28)
        });
    end;
    v26.onTreeViewSelectionChange = function(v29) --[[ Line: 100 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            treeViewSelection = v29
        });
    end;
end;
v25.loadFontForTextLabelAndSetStateWhenDone = function(v30) --[[ Line: 109 ]] --[[ Name: loadFontForTextLabelAndSetStateWhenDone ]]
    -- upvalues: l_TextService_0 (copy)
    local l_props_0 = v30.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    task.spawn(function() --[[ Line: 113 ]]
        -- upvalues: l_props_0 (copy), l_Stylizer_0 (copy), l_TextService_0 (ref), v30 (copy)
        local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
        l_GetTextBoundsParams_0.Font = Font.fromId(l_props_0.AssetData.Asset.Id);
        l_GetTextBoundsParams_0.Text = l_Stylizer_0.RenderView.FontRenderView.Text;
        local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
        v30:setState({
            isFontLoaded = true
        });
    end);
end;
v25.didMount = function(v35) --[[ Line: 124 ]] --[[ Name: didMount ]]
    if v35.props.AssetData.Asset.TypeId == Enum.AssetType.FontFamily.Value then
        v35:loadFontForTextLabelAndSetStateWhenDone();
    end;
end;
v25.didUpdate = function(v36, v37, v38) --[[ Line: 135 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v36.props;
    local l_state_0 = v36.state;
    if v37 == l_props_1 and v38 == l_state_0 then
        return;
    else
        if l_props_1.AssetData.Asset.TypeId == Enum.AssetType.FontFamily.Value and l_props_1.AssetData.Asset.Id ~= v37.AssetData.Asset.Id then
            v36:setState({
                isFontLoaded = false
            });
            v36:loadFontForTextLabelAndSetStateWhenDone();
        end;
        return;
    end;
end;
v25.getMemoizedTreeViewInstances = function(v41, v42) --[[ Line: 153 ]] --[[ Name: getMemoizedTreeViewInstances ]]
    local v43 = v41.memoizedTreeViewInstances[v42];
    if v43 == nil then
        v43 = {
            v42
        };
        v41.memoizedTreeViewInstances[v42] = v43;
    end;
    return v43;
end;
v25.getAssetThumbnailUrl = function(_, v45, v46, v47) --[[ Line: 163 ]] --[[ Name: getAssetThumbnailUrl ]]
    return string.format("rbxthumb://type=Asset&id=%d&w=%d&h=%d", v45, v46, v47);
end;
v25.getImagesForCarousel = function(v48, v49) --[[ Line: 167 ]] --[[ Name: getImagesForCarousel ]]
    -- upvalues: v9 (copy), v10 (copy)
    local l_props_2 = v48.props;
    local v51 = v9.List.join({
        l_props_2.AssetData.Asset.Id
    }, l_props_2.AssetData.Asset.AssetMediaIds);
    return v10.map(v51, function(v52) --[[ Line: 171 ]]
        -- upvalues: v48 (copy), v49 (copy)
        return v48:getAssetThumbnailUrl(v52, v49, v49);
    end);
end;
v25.render = function(v53) --[[ Line: 176 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v7 (copy), v5 (copy), v2 (copy), v24 (copy), v21 (copy), v16 (copy), v18 (copy), v15 (copy), l_AssetRenderType_0 (copy), v22 (copy), v19 (copy), v20 (copy), v23 (copy), v13 (copy), v12 (copy), v14 (copy), v17 (copy)
    local l_props_3 = v53.props;
    local l_state_1 = v53.state;
    local l_Stylizer_1 = v53.props.Stylizer;
    local l_Width_0 = l_props_3.Width;
    local l_Id_0 = l_props_3.AssetData.Asset.Id;
    local l_AssetInstance_0 = l_props_3.AssetInstance;
    local v60 = v9.Dictionary.keys(l_state_1.treeViewSelection)[1];
    local v61 = v60 or l_props_3.AssetInstance;
    local v62 = v7:getRenderType(v61);
    local v63 = if v5() then l_props_3.AssetData.Asset.TypeId == Enum.AssetType.Model.Value and not l_props_3.AssetInstance else nil;
    local v64 = l_props_3.AssetData.Asset.TypeId == Enum.AssetType.Plugin.Value;
    local v65 = l_props_3.AssetData.Asset.TypeId == Enum.AssetType.FontFamily.Value;
    local v66 = if v5() then not l_props_3.DisableTreeView and l_AssetInstance_0 and not v64 and not v65 and not v63 else not l_props_3.DisableTreeView and l_AssetInstance_0 and not v64 and not v65;
    local v67 = v66 and l_state_1.treeViewVisible;
    local l_Size_0 = l_Stylizer_1.RenderView.Size;
    local l_Size_1 = l_Stylizer_1.TreeView.Size;
    local v70 = l_Size_0.Y.Offset * 2 < l_Width_0;
    if v67 and v70 then
        l_Size_1 = l_Stylizer_1.TreeView.HorizontalSize;
        l_Size_0 = UDim2.new(l_Size_0.X - l_Size_1.X, l_Size_0.Y);
    end;
    local v71 = not (not v67 or v70) and l_Size_0.Y + l_Size_1.Y or l_Size_0.Y;
    local v72 = nil;
    if l_props_3.UseImageCarousel then
        v72 = v2.createElement(v24, {
            AutoAdvance = true, 
            AutoAdvanceTimer = l_props_3.ImageCarouselAutoAdvanceTimer, 
            ImageStrings = v53:getImagesForCarousel(l_Stylizer_1.Thumbnail.Size), 
            OnImageChange = l_props_3.OnImageCarouselImageChanged, 
            OnImageChangeTransparencyThreshold = l_props_3.ImageCarouselTransparencyThreshold, 
            OnSetImages = l_props_3.OnSetImageCarouselImages, 
            PaneStyle = l_Stylizer_1.ImageCarousel.PaneStyle, 
            ShowNavigationOnHover = true
        });
    elseif if v5() then v63 or v64 else v64 then
        v72 = v2.createElement(v21, {
            Image = v53:getAssetThumbnailUrl(l_Id_0, l_Stylizer_1.Thumbnail.Size, l_Stylizer_1.Thumbnail.Size)
        });
    elseif v65 then
        v72 = if l_state_1.isFontLoaded then v2.createElement(v16, {
            BackgroundTransparency = 0, 
            BackgroundColor = l_Stylizer_1.RenderView.FontRenderView.FontRenderViewBackgroundColor, 
            Padding = l_Stylizer_1.RenderView.FontRenderView.Padding, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            fontTextLabel = v2.createElement(v18, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                FontFace = Font.fromId(l_Id_0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_Stylizer_1.RenderView.FontRenderView.Text, 
                TextSelectable = false, 
                TextSize = 40, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }) else v2.createElement(v15, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(0.5, 0.5)
        });
    elseif v62 == nil then
        v72 = v2.createElement(v15, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(0.5, 0.5)
        });
    elseif v62 == l_AssetRenderType_0.Model then
        v72 = v2.createElement(v22, {
            Model = v61, 
            OnMouseEnter = l_props_3.OnMouseEnter, 
            OnMouseLeave = l_props_3.OnMouseLeave, 
            ShouldMuteModelSounds = l_props_3.ShouldMuteModelSounds
        });
    elseif v62 == l_AssetRenderType_0.Sound then
        v72 = v2.createElement(v19, {
            OnPlay = l_props_3.OnPlaySound, 
            OnPause = l_props_3.OnPauseSound, 
            SoundId = v60 and v60.SoundId or string.format("rbxassetid://%d", l_Id_0), 
            Style = v66 and l_Stylizer_1.AudioPlayerWithTreeViewButton or l_Stylizer_1.AudioPlayer, 
            UsageContext = l_props_3.UsageContext
        });
    elseif v62 == l_AssetRenderType_0.Video then
        v72 = v2.createElement(v20, {
            OnPlay = l_props_3.OnPlayVideo, 
            OnPause = l_props_3.OnPauseVideo, 
            VideoId = v60 and v60.Video or string.format("rbxassetid://%d", l_Id_0), 
            Style = v66 and l_Stylizer_1.VideoPlayerWithTreeViewButton or l_Stylizer_1.VideoPlayer
        });
    elseif v62 == l_AssetRenderType_0.Image then
        v72 = v2.createElement(v21, {
            Image = v61
        });
    elseif v62 == l_AssetRenderType_0.Script or v62 == l_AssetRenderType_0.Other then
        v72 = v2.createElement(v23, {
            Instance = v61, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(0.5, 0.5)
        });
    else
        error(string.format("Unhandled AssetRenderType: %s", (tostring(v62))));
    end;
    return v2.createElement(v13, {
        LayoutOrder = l_props_3.LayoutOrder, 
        Position = l_props_3.Position, 
        Margin = l_props_3.Margin, 
        Padding = l_props_3.Padding, 
        Size = UDim2.new(UDim.new(0, l_Width_0), v71), 
        Background = l_Stylizer_1.Background, 
        BackgroundStyle = l_Stylizer_1.BackgroundStyle
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = v70 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        RenderView = v2.createElement(v13, {
            LayoutOrder = 1, 
            Size = l_Size_0
        }, {
            AssetRenderView = v72, 
            TreeViewButton = v66 and v2.createElement(v12, {
                Style = l_Stylizer_1.RenderView.TreeViewButton, 
                OnClick = v53.toggleTreeViewVisible, 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, -7, 1, -7), 
                ZIndex = 2
            }, {
                v2.createElement(v14, {
                    Cursor = "PointingHand"
                })
            })
        }), 
        TreeView = v67 and v2.createElement(v17, {
            LayoutOrder = 2, 
            Size = l_Size_1, 
            Instances = v53:getMemoizedTreeViewInstances(l_AssetInstance_0), 
            Expansion = l_state_1.treeViewExpansion, 
            Selection = l_state_1.treeViewSelection, 
            OnExpansionChange = v53.onTreeViewExpansionChange, 
            OnSelectionChange = v53.onTreeViewSelectionChange, 
            Style = "BorderBox"
        })
    });
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v25));