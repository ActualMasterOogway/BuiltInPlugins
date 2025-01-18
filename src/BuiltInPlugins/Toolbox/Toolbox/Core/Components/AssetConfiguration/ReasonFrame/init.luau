local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.Constants);
local v5 = require(l_Packages_0.Framework);
local l_GetTextSize_0 = v5.Util.GetTextSize;
local v7 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = v2.PureComponent:extend("ReasonFrame");
local v11 = Vector2.new(400, 9000);
v10.init = function(v12, _) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v11 (copy), l_GetTextSize_0 (copy), v4 (copy)
    v12.scrollingFrameRef = v2.createRef();
    v12.calibrateCanvas = function() --[[ Line: 42 ]]
        -- upvalues: v12 (copy), v11 (ref), l_GetTextSize_0 (ref), v4 (ref)
        local v14 = v12.props.Reasons or {};
        local v15 = 0;
        local v16 = {};
        local l_current_0 = v12.scrollingFrameRef.current;
        for _, v19 in pairs(v14) do
            local l_responseBody_0 = v19.response.responseBody;
            local v21 = nil;
            if l_current_0 then
                local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
                v21 = Vector2.new(l_AbsoluteSize_0.X, 9000);
            else
                v21 = v11;
            end;
            local v23 = l_GetTextSize_0(l_responseBody_0, v4.FONT_SIZE_LARGE, v4.FONT, v21);
            table.insert(v16, v23);
            if v23 then
                v15 = v15 + v23.Y;
            else
                v15 = v15 + 10;
            end;
        end;
        if not v15 then
            v15 = 40;
        end;
        if l_current_0 then
            l_current_0.CanvasSize = UDim2.new(1, 0, 0, v15);
        end;
        return v16;
    end;
    v12.getReasons = function(v24, v25, v26) --[[ Line: 80 ]]
        -- upvalues: v2 (ref), v4 (ref), v12 (copy)
        local v27 = {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, v4.ASSET_INNER_PADDING), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            ExplainLabel = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                Text = v12.props.Localization:getText("AssetConfigError", "NetworkError"), 
                TextColor3 = v26.textColor, 
                Font = v4.FONT, 
                TextSize = v4.FONT_SIZE_LARGE, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 0
            })
        };
        for v28, v29 in pairs(v24) do
            local v30 = v25[v28];
            v27[v29.name] = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v30.Y), 
                Text = v29.response.responseBody, 
                TextColor3 = v26.textColor, 
                Font = v4.FONT, 
                TextSize = v4.FONT_SIZE_LARGE, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v28
            });
        end;
        return v27;
    end;
end;
v10.render = function(v31) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy)
    local l_props_0 = v31.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_Reasons_0 = l_props_0.Reasons;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_assetConfig_0 = l_Stylizer_0.assetConfig;
    local v39 = v31.getReasons(l_Reasons_0, v31.calibrateCanvas(), l_assetConfig_0);
    return v2.createElement(v7, {
        Position = l_Position_0, 
        Size = l_Size_0, 
        CanvasSize = UDim2.new(0, 0, 0, 40), 
        ZIndex = 1, 
        [v2.Ref] = v31.scrollingFrameRef, 
        onScroll = v31.onScroll, 
        LayoutOrder = l_LayoutOrder_0
    }, v39);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10));