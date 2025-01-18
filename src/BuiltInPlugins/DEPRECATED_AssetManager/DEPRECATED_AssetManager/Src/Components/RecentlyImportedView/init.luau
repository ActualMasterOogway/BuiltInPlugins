local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.InsertAsset);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_InsertAssetContext_0 = v2.Context.InsertAssetContext;
local l_ScrollingFrame_0 = v5.UI.ScrollingFrame;
local l_Util_0 = v5.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v13 = require(l_Parent_0.Src.Components.ListItem);
local v14 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
local v15 = require(l_Parent_0.Src.Thunks.OnAssetDrag);
local v16 = v3.PureComponent:extend("RecentlyImportedView");
v16.createListItems = function(v17, _, v19, v20, v21) --[[ Line: 35 ]] --[[ Name: createListItems ]]
    -- upvalues: v3 (copy), v13 (copy), l_StyleModifier_0 (copy)
    local v22 = {};
    for _, v24 in pairs(v19) do
        local v25 = v3.createElement(v13, {
            AssetData = v24, 
            LayoutOrder = v24.key, 
            StyleModifier = v20[v24.key] and l_StyleModifier_0.Selected or nil, 
            Enabled = v21, 
            RecentListItem = true, 
            OnAssetDrag = v17.onAssetDrag
        });
        v22[v24.id] = v25;
    end;
    return v22;
end;
v16.init = function(v26) --[[ Line: 52 ]] --[[ Name: init ]]
    v26.onMouseActivated = function(_, _, _) --[[ Line: 53 ]]
        -- upvalues: v26 (copy)
        local l_props_0 = v26.props;
        l_props_0.dispatchSetRecentViewToggled(not l_props_0.RecentViewToggled);
    end;
    v26.mouseEnter = function() --[[ Line: 58 ]]
        -- upvalues: v26 (copy)
        v26.props.Mouse:__pushCursor("PointingHand");
    end;
    v26.mouseLeave = function() --[[ Line: 63 ]]
        -- upvalues: v26 (copy)
        v26.props.Mouse:__popCursor();
    end;
    v26.onAssetDrag = function(v31) --[[ Line: 68 ]]
        -- upvalues: v26 (copy)
        local l_props_1 = v26.props;
        local v33 = l_props_1.InsertAsset:get();
        l_props_1.dispatchOnAssetDrag(v33, v31, l_props_1.Analytics);
    end;
end;
v16.render = function(v34) --[[ Line: 75 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v3 (copy), v1 (copy), l_ScrollingFrame_0 (copy)
    local l_props_2 = v34.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_RecentView_0 = l_Stylizer_0.RecentView;
    local l_Localization_0 = l_props_2.Localization;
    local l_Size_0 = l_props_2.Size;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Enabled_0 = l_props_2.Enabled;
    local v42 = l_Localization_0:getText("RecentlyImportedView", "Title");
    local l_RecentViewToggled_0 = l_props_2.RecentViewToggled;
    local v44 = l_RecentViewToggled_0 and l_RecentView_0.Bar.Arrow.Expanded or l_RecentView_0.Bar.Arrow.Collapsed;
    local v45 = v34:createListItems(l_Stylizer_0, l_props_2.RecentAssets, l_props_2.SelectedAssets, l_Enabled_0);
    local v46 = l_LayoutOrderIterator_0.new();
    return v3.createElement("Frame", {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = 2, 
        BackgroundTransparency = 1
    }, {
        RecentlyImportedViewLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        RecentlyImportedViewBar = v3.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, l_RecentView_0.Bar.Height), 
            LayoutOrder = v46:getNextOrder(), 
            ZIndex = 100, 
            BackgroundColor3 = l_RecentView_0.Bar.BackgroundColor, 
            BorderColor3 = l_Stylizer_0.BorderColor, 
            BorderSizePixel = 1, 
            [v3.Event.Activated] = v34.onMouseActivated, 
            [v3.Event.MouseEnter] = v34.mouseEnter, 
            [v3.Event.mouseLeave] = v34.mouseLeave
        }, {
            RecentlyImportedViewBarLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, l_RecentView_0.Bar.Padding), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            GameBarPadding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_RecentView_0.Bar.Padding)
            }), 
            RecentlyImportedViewBarText = v3.createElement("TextLabel", {
                Size = UDim2.new(1, -l_RecentView_0.Bar.Button.Size - l_RecentView_0.Bar.Padding, 1, 0), 
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Text = v42, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextSize = l_Stylizer_0.FontSizeSmall, 
                Font = l_Stylizer_0.Font, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            CollapseImageFrame = v3.createElement("Frame", {
                Size = UDim2.new(0, l_RecentView_0.Bar.Button.Size, 0, l_RecentView_0.Bar.Button.Size), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                CollapseArrow = v3.createElement("ImageLabel", v1.Dictionary.join(v44, {
                    Size = UDim2.new(0, l_RecentView_0.Bar.Arrow.Size, 0, l_RecentView_0.Bar.Arrow.Size), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    ImageColor3 = l_RecentView_0.Bar.Arrow.Color
                }))
            })
        }), 
        RecentlyImportedViewScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            Size = UDim2.new(1, 0, l_RecentViewToggled_0 and 1 or 0, l_RecentViewToggled_0 and -l_RecentView_0.Bar.Height or 0), 
            LayoutOrder = v46:getNextOrder(), 
            BackgroundTransparency = 1, 
            AutoSizeLayoutOptions = {
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, v45)
    });
end;
v16 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    InsertAsset = l_InsertAssetContext_0, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Stylizer = l_ContextServices_0.Stylizer
})(v16);
return v4.connect(function(v47, _) --[[ Line: 191 ]] --[[ Name: mapStateToProps ]]
    local l_AssetManagerReducer_0 = v47.AssetManagerReducer;
    return {
        RecentAssets = l_AssetManagerReducer_0.recentAssets, 
        RecentViewToggled = l_AssetManagerReducer_0.recentViewToggled, 
        SelectedAssets = l_AssetManagerReducer_0.selectedAssets
    };
end, function(v50) --[[ Line: 201 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), v14 (copy)
    return {
        dispatchOnAssetDrag = function(v51, v52, v53) --[[ Line: 203 ]] --[[ Name: dispatchOnAssetDrag ]]
            -- upvalues: v50 (copy), v15 (ref)
            v50(v15(v51, v52, v53));
        end, 
        dispatchSetRecentViewToggled = function(v54) --[[ Line: 206 ]] --[[ Name: dispatchSetRecentViewToggled ]]
            -- upvalues: v50 (copy), v14 (ref)
            v50(v14(v54));
        end
    };
end)(v16);