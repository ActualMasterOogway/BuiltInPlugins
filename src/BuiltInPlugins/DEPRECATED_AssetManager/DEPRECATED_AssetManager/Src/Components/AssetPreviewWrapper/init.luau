local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_AssetPreview_0 = v3.UI.AssetPreview;
local v7 = require(l_Parent_0.Src.Thunks.OnAssetDoubleClick);
local v8 = require(l_Parent_0.Src.Thunks.OnAssetRightClick);
local v9 = require(l_Parent_0.Src.Thunks.GetAssetFavorited);
local v10 = require(l_Parent_0.Src.Thunks.GetAssetFavoriteCount);
local v11 = require(l_Parent_0.Src.Thunks.ToggleFavoriteStatus);
local l_StudioService_0 = game:GetService("StudioService");
local v13 = v1.PureComponent:extend("AssetPreviewWrapper");
v13.init = function(v14) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: l_StudioService_0 (copy), v1 (copy)
    v14.state = {
        selectedPreviewInstance = nil, 
        maxPreviewHeight = 0, 
        maxPreviewWidth = 0
    };
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    v14.onTreeItemClicked = function(v16) --[[ Line: 37 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            selectedPreviewInstance = v16
        });
    end;
    v14.tryInsert = function() --[[ Line: 43 ]]
        -- upvalues: v14 (copy)
        local l_props_0 = v14.props;
        local l_Analytics_0 = l_props_0.Analytics;
        local l_AssetData_0 = l_props_0.AssetData;
        l_props_0.dispatchOnAssetDoubleClick(l_Analytics_0, l_AssetData_0, true);
    end;
    v14.requestFavoriteCounts = function() --[[ Line: 51 ]]
        -- upvalues: v14 (copy)
        local l_props_1 = v14.props;
        local l_id_0 = l_props_1.AssetData.id;
        local v22 = l_props_1.API:get();
        l_props_1.dispatchGetAssetFavoriteCount(v22, l_id_0);
    end;
    v14.checkFavorited = function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), l_l_StudioService_0_UserId_0 (copy)
        local l_props_2 = v14.props;
        local l_id_1 = l_props_2.AssetData.id;
        local v25 = l_props_2.API:get();
        l_props_2.dispatchGetAssetFavorited(v25, l_id_1, l_l_StudioService_0_UserId_0);
    end;
    v14.onFavoritedActivated = function(_) --[[ Line: 65 ]]
        -- upvalues: v14 (copy), l_l_StudioService_0_UserId_0 (copy)
        local l_props_3 = v14.props;
        local l_id_2 = l_props_3.AssetData.id;
        local v29 = l_props_3.API:get();
        local l_Favorited_0 = l_props_3.Favorited;
        l_props_3.dispatchToggleFavoriteStatus(v29, l_id_2, l_l_StudioService_0_UserId_0, l_Favorited_0);
    end;
    v14.tryCreateContextMenu = function() --[[ Line: 73 ]]
        -- upvalues: v14 (copy)
        v14.props:dispatchOnAssetRightClick();
    end;
    v14.ClickDetectorRef = v1.createRef();
    v14.onDetectorABSSizeChange = function() --[[ Line: 81 ]]
        -- upvalues: v14 (copy)
        local l_current_0 = v14.ClickDetectorRef.current;
        if not l_current_0 then
            return;
        else
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            local l_x_0 = l_AbsoluteSize_0.x;
            local l_y_0 = l_AbsoluteSize_0.y;
            v14:setState({
                maxPreviewWidth = l_x_0 - 64, 
                maxPreviewHeight = l_y_0 - 64
            });
            return;
        end;
    end;
end;
v13.didMount = function(v35) --[[ Line: 98 ]] --[[ Name: didMount ]]
    v35.checkFavorited();
    v35.requestFavoriteCounts();
end;
v13.render = function(v36) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_AssetPreview_0 (copy)
    local l_props_4 = v36.props;
    local l_state_0 = v36.state;
    local v39 = l_props_4.Focus:get();
    local l_Localization_0 = l_props_4.Localization;
    local l_Stylizer_0 = l_props_4.Stylizer;
    local l_AssetPreviewData_0 = l_props_4.AssetPreviewData;
    local v43 = if v36.state.selectedPreviewInstance then v36.state.selectedPreviewInstance else l_AssetPreviewData_0.rootTreeViewInstance;
    local v44 = if l_AssetPreviewData_0.favoriteCount then tonumber(l_AssetPreviewData_0.favoriteCount) else 0;
    local v45 = if l_AssetPreviewData_0.favorited then l_AssetPreviewData_0.favorited else false;
    local v46 = math.min(l_state_0.maxPreviewWidth, 640);
    local l_maxPreviewHeight_0 = l_state_0.maxPreviewHeight;
    local l_OnAssetPreviewClose_0 = l_props_4.OnAssetPreviewClose;
    return v1.createElement(v1.Portal, {
        target = v39
    }, {
        AssetPreview = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Background = v1.createElement("ImageButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = l_Stylizer_0.Overlay.Background.Transparency, 
                ZIndex = 1, 
                [v1.Event.Activated] = l_OnAssetPreviewClose_0, 
                [v1.Ref] = v36.ClickDetectorRef, 
                [v1.Change.AbsoluteSize] = v36.onDetectorABSSizeChange
            }), 
            Contents = v1.createElement(l_AssetPreview_0, {
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(v46, l_maxPreviewHeight_0), 
                AssetData = l_AssetPreviewData_0, 
                AssetInstance = v43, 
                OnClickContext = v36.tryCreateContextMenu, 
                ActionText = l_Localization_0:getText("AssetPreview", "Insert"), 
                OnClickAction = v36.tryInsert, 
                Favorites = {
                    OnClick = v36.onFavoritedActivated, 
                    Count = v44, 
                    IsFavorited = v45
                }, 
                HideCreatorSearch = true, 
                ZIndex = 2
            })
        })
    });
end;
local function v51(_, _) --[[ Line: 174 ]] --[[ Name: mapStateToProps ]]

end;
v13 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    API = l_ContextServices_0.API, 
    Focus = l_ContextServices_0.Focus, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13);
return v2.connect(v51, function(v52) --[[ Line: 185 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    return {
        dispatchOnAssetDoubleClick = function(v53, v54, v55) --[[ Line: 187 ]] --[[ Name: dispatchOnAssetDoubleClick ]]
            -- upvalues: v52 (copy), v7 (ref)
            v52(v7(v53, v54, v55));
        end, 
        dispatchOnAssetRightClick = function(v56) --[[ Line: 190 ]] --[[ Name: dispatchOnAssetRightClick ]]
            -- upvalues: v52 (copy), v8 (ref)
            v56.IsAssetPreviewMenu = true;
            v52(v8(v56));
        end, 
        dispatchGetAssetFavorited = function(v57, v58, v59) --[[ Line: 194 ]] --[[ Name: dispatchGetAssetFavorited ]]
            -- upvalues: v52 (copy), v9 (ref)
            v52(v9(v57, v58, v59));
        end, 
        dispatchGetAssetFavoriteCount = function(v60, v61) --[[ Line: 197 ]] --[[ Name: dispatchGetAssetFavoriteCount ]]
            -- upvalues: v52 (copy), v10 (ref)
            v52(v10(v60, v61));
        end, 
        dispatchToggleFavoriteStatus = function(v62, v63, v64, v65) --[[ Line: 200 ]] --[[ Name: dispatchToggleFavoriteStatus ]]
            -- upvalues: v52 (copy), v11 (ref)
            v52(v11(v62, v63, v64, v65));
        end
    };
end)(v13);