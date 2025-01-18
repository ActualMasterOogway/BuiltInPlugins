local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.SharedFlags.getFFlagModelPreviewThumbnailFallback);
local v6 = require(l_Parent_0.SharedFlags.getFFlagAssetPreviewThumbnailContext);
local v7 = require(l_Parent_0.Util.Typecheck);
local v8 = require(l_Parent_0.Util.AssetRenderUtil);
local l_AssetRenderType_0 = v8.AssetRenderType;
local v10 = require(l_Parent_0.Parent.Cryo);
local v11 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v11.join;
local v13 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v14 = require(l_Parent_0.UI.Components.Container);
local v15 = require(l_Parent_0.UI.Components.HoverArea);
local v16 = require(l_Parent_0.UI.Components.LoadingIndicator);
local v17 = require(l_Parent_0.UI.Components.Pane);
local v18 = require(l_Parent_0.UI.Components.InstanceTreeView);
local v19 = require(l_Parent_0.UI.Components.TextLabel);
local v20 = require(l_Parent_0.UI.Components.AudioPlayer);
local v21 = require(l_Parent_0.UI.Components.VideoPlayer);
local v22 = require(l_Parent_0.UI.Components.AssetRenderImage);
local v23 = require(l_Parent_0.UI.Components.AssetRenderModel);
local v24 = require(l_Parent_0.UI.Components.AssetRenderThumbnail);
local v25 = require(l_Parent_0.UI.Components.ImageCarousel);
local v26 = v2.PureComponent:extend("AssetRender");
v7.wrap(v26, script);
local v27 = v6() and "rbxthumb://type=CreatorContextAsset&id=%d&w=%d&h=%d" or "rbxthumb://type=Asset&id=%d&w=%d&h=%d";
v26.init = function(v28) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy)
    v28.state = {
        treeViewSelection = {}, 
        treeViewExpansion = {}, 
        treeViewVisible = false, 
        isFontLoaded = false
    };
    v28.memoizedTreeViewInstances = {};
    v28.toggleTreeViewVisible = function() --[[ Line: 89 ]]
        -- upvalues: v28 (copy)
        v28:setState(function(v29) --[[ Line: 90 ]]
            return {
                treeViewVisible = not v29.treeViewVisible
            };
        end);
    end;
    v28.onTreeViewExpansionChange = function(v30) --[[ Line: 97 ]]
        -- upvalues: v28 (copy), l_join_0 (ref)
        v28:setState({
            treeViewExpansion = l_join_0(v28.state.treeViewExpansion, v30)
        });
    end;
    v28.onTreeViewSelectionChange = function(v31) --[[ Line: 103 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            treeViewSelection = v31
        });
    end;
end;
v26.loadFontForTextLabelAndSetStateWhenDone = function(v32) --[[ Line: 112 ]] --[[ Name: loadFontForTextLabelAndSetStateWhenDone ]]
    -- upvalues: l_TextService_0 (copy)
    local l_props_0 = v32.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    task.spawn(function() --[[ Line: 116 ]]
        -- upvalues: l_props_0 (copy), l_Stylizer_0 (copy), l_TextService_0 (ref), v32 (copy)
        local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
        l_GetTextBoundsParams_0.Font = Font.fromId(l_props_0.AssetData.Asset.Id);
        l_GetTextBoundsParams_0.Text = l_Stylizer_0.RenderView.FontRenderView.Text;
        local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
        v32:setState({
            isFontLoaded = true
        });
    end);
end;
v26.didMount = function(v37) --[[ Line: 127 ]] --[[ Name: didMount ]]
    if v37.props.AssetData.Asset.TypeId == Enum.AssetType.FontFamily.Value then
        v37:loadFontForTextLabelAndSetStateWhenDone();
    end;
end;
v26.didUpdate = function(v38, v39, v40) --[[ Line: 138 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v38.props;
    local l_state_0 = v38.state;
    if v39 == l_props_1 and v40 == l_state_0 then
        return;
    else
        if l_props_1.AssetData.Asset.TypeId == Enum.AssetType.FontFamily.Value and l_props_1.AssetData.Asset.Id ~= v39.AssetData.Asset.Id then
            v38:setState({
                isFontLoaded = false
            });
            v38:loadFontForTextLabelAndSetStateWhenDone();
        end;
        return;
    end;
end;
v26.getMemoizedTreeViewInstances = function(v43, v44) --[[ Line: 156 ]] --[[ Name: getMemoizedTreeViewInstances ]]
    local v45 = v43.memoizedTreeViewInstances[v44];
    if v45 == nil then
        v45 = {
            v44
        };
        v43.memoizedTreeViewInstances[v44] = v45;
    end;
    return v45;
end;
v26.getAssetThumbnailUrl = function(_, v47, v48, v49) --[[ Line: 166 ]] --[[ Name: getAssetThumbnailUrl ]]
    -- upvalues: v27 (copy)
    return string.format(v27, v47, v48, v49);
end;
v26.getImagesForCarousel = function(v50, v51) --[[ Line: 170 ]] --[[ Name: getImagesForCarousel ]]
    -- upvalues: v10 (copy), v11 (copy)
    local l_props_2 = v50.props;
    local v53 = v10.List.join({
        l_props_2.AssetData.Asset.Id
    }, l_props_2.AssetData.Asset.AssetMediaIds);
    return v11.map(v53, function(v54) --[[ Line: 174 ]]
        -- upvalues: v50 (copy), v51 (copy)
        return v50:getAssetThumbnailUrl(v54, v51, v51);
    end);
end;
v26.render = function(v55) --[[ Line: 179 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v8 (copy), v5 (copy), v2 (copy), v25 (copy), v22 (copy), v17 (copy), v19 (copy), v16 (copy), l_AssetRenderType_0 (copy), v23 (copy), v20 (copy), v21 (copy), v24 (copy), v14 (copy), v13 (copy), v15 (copy), v18 (copy)
    local l_props_3 = v55.props;
    local l_state_1 = v55.state;
    local l_Stylizer_1 = v55.props.Stylizer;
    local l_Width_0 = l_props_3.Width;
    local l_Id_0 = l_props_3.AssetData.Asset.Id;
    local l_AssetInstance_0 = l_props_3.AssetInstance;
    local v62 = v10.Dictionary.keys(l_state_1.treeViewSelection)[1];
    local v63 = v62 or l_props_3.AssetInstance;
    local v64 = v8:getRenderType(v63);
    local v65 = if v5() then l_props_3.AssetData.Asset.TypeId == Enum.AssetType.Model.Value and not l_props_3.AssetInstance else nil;
    local v66 = l_props_3.AssetData.Asset.TypeId == Enum.AssetType.Plugin.Value;
    local v67 = l_props_3.AssetData.Asset.TypeId == Enum.AssetType.FontFamily.Value;
    local v68 = if v5() then not l_props_3.DisableTreeView and l_AssetInstance_0 and not v66 and not v67 and not v65 else not l_props_3.DisableTreeView and l_AssetInstance_0 and not v66 and not v67;
    local v69 = v68 and l_state_1.treeViewVisible;
    local l_Size_0 = l_Stylizer_1.RenderView.Size;
    local l_Size_1 = l_Stylizer_1.TreeView.Size;
    local v72 = l_Size_0.Y.Offset * 2 < l_Width_0;
    if v69 and v72 then
        l_Size_1 = l_Stylizer_1.TreeView.HorizontalSize;
        l_Size_0 = UDim2.new(l_Size_0.X - l_Size_1.X, l_Size_0.Y);
    end;
    local v73 = not (not v69 or v72) and l_Size_0.Y + l_Size_1.Y or l_Size_0.Y;
    local v74 = nil;
    if l_props_3.UseImageCarousel then
        v74 = v2.createElement(v25, {
            AutoAdvance = true, 
            AutoAdvanceTimer = l_props_3.ImageCarouselAutoAdvanceTimer, 
            ImageStrings = v55:getImagesForCarousel(l_Stylizer_1.Thumbnail.Size), 
            OnImageChange = l_props_3.OnImageCarouselImageChanged, 
            OnImageChangeTransparencyThreshold = l_props_3.ImageCarouselTransparencyThreshold, 
            OnSetImages = l_props_3.OnSetImageCarouselImages, 
            PaneStyle = l_Stylizer_1.ImageCarousel.PaneStyle, 
            ShowNavigationOnHover = true
        });
    elseif if v5() then v65 or v66 else v66 then
        v74 = v2.createElement(v22, {
            Image = v55:getAssetThumbnailUrl(l_Id_0, l_Stylizer_1.Thumbnail.Size, l_Stylizer_1.Thumbnail.Size)
        });
    elseif v67 then
        v74 = if l_state_1.isFontLoaded then v2.createElement(v17, {
            BackgroundTransparency = 0, 
            BackgroundColor = l_Stylizer_1.RenderView.FontRenderView.FontRenderViewBackgroundColor, 
            Padding = l_Stylizer_1.RenderView.FontRenderView.Padding, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            fontTextLabel = v2.createElement(v19, {
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
        }) else v2.createElement(v16, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(0.5, 0.5)
        });
    elseif v64 == nil then
        v74 = v2.createElement(v16, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(0.5, 0.5)
        });
    elseif v64 == l_AssetRenderType_0.Model then
        v74 = v2.createElement(v23, {
            Model = v63, 
            OnMouseEnter = l_props_3.OnMouseEnter, 
            OnMouseLeave = l_props_3.OnMouseLeave, 
            ShouldMuteModelSounds = l_props_3.ShouldMuteModelSounds
        });
    elseif v64 == l_AssetRenderType_0.Sound then
        v74 = v2.createElement(v20, {
            OnPlay = l_props_3.OnPlaySound, 
            OnPause = l_props_3.OnPauseSound, 
            SoundId = v62 and v62.SoundId or string.format("rbxassetid://%d", l_Id_0), 
            Style = v68 and l_Stylizer_1.AudioPlayerWithTreeViewButton or l_Stylizer_1.AudioPlayer, 
            UsageContext = l_props_3.UsageContext
        });
    elseif v64 == l_AssetRenderType_0.Video then
        v74 = v2.createElement(v21, {
            OnPlay = l_props_3.OnPlayVideo, 
            OnPause = l_props_3.OnPauseVideo, 
            VideoId = v62 and v62.Video or string.format("rbxassetid://%d", l_Id_0), 
            Style = v68 and l_Stylizer_1.VideoPlayerWithTreeViewButton or l_Stylizer_1.VideoPlayer
        });
    elseif v64 == l_AssetRenderType_0.Image then
        v74 = v2.createElement(v22, {
            Image = v63
        });
    elseif v64 == l_AssetRenderType_0.Script or v64 == l_AssetRenderType_0.Other then
        v74 = v2.createElement(v24, {
            Instance = v63, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(0.5, 0.5)
        });
    else
        error(string.format("Unhandled AssetRenderType: %s", (tostring(v64))));
    end;
    return v2.createElement(v14, {
        LayoutOrder = l_props_3.LayoutOrder, 
        Position = l_props_3.Position, 
        Margin = l_props_3.Margin, 
        Padding = l_props_3.Padding, 
        Size = UDim2.new(UDim.new(0, l_Width_0), v73), 
        Background = l_Stylizer_1.Background, 
        BackgroundStyle = l_Stylizer_1.BackgroundStyle
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = v72 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        RenderView = v2.createElement(v14, {
            LayoutOrder = 1, 
            Size = l_Size_0
        }, {
            AssetRenderView = v74, 
            TreeViewButton = v68 and v2.createElement(v13, {
                Style = l_Stylizer_1.RenderView.TreeViewButton, 
                OnClick = v55.toggleTreeViewVisible, 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, -7, 1, -7), 
                ZIndex = 2
            }, {
                v2.createElement(v15, {
                    Cursor = "PointingHand"
                })
            })
        }), 
        TreeView = v69 and v2.createElement(v18, {
            LayoutOrder = 2, 
            Size = l_Size_1, 
            Instances = v55:getMemoizedTreeViewInstances(l_AssetInstance_0), 
            Expansion = l_state_1.treeViewExpansion, 
            Selection = l_state_1.treeViewSelection, 
            OnExpansionChange = v55.onTreeViewExpansionChange, 
            OnSelectionChange = v55.onTreeViewSelectionChange, 
            Style = "BorderBox"
        })
    });
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v26));