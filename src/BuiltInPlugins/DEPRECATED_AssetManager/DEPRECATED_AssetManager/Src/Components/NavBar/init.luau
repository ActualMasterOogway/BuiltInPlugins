local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LinkText_0 = v4.UI.LinkText;
local l_Util_0 = v4.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v12 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
local v13 = require(l_Parent_0.Src.Actions.SetScreen);
local v14 = require(l_Parent_0.Src.Util.Screens);
local v15 = v2.PureComponent:extend("NavBar");
v15.getCurrentPath = function(v16, v17) --[[ Line: 35 ]] --[[ Name: getCurrentPath ]]
    -- upvalues: v14 (copy)
    local v18 = {};
    local l_v17_0 = v17;
    local v20 = v17.Path == v14.MAIN.Path;
    local v21 = v16.NavBar.current and v16.NavBar.current.AbsoluteSize.X or 0;
    while v17 ~= nil do
        if v21 < v16.state.contentWidth + 12 then
            v16.preTruncContentWidth = v16.state.contentWidth;
            if (v17.Path ~= l_v17_0.Path or v20) and not v16.truncatedPathParts[v17.Path] then
                v16.truncatedPathParts[v17.Path] = true;
            end;
        elseif v16.preTruncContentWidth + 12 <= v21 then
            v16.truncatedPathParts = {};
        end;
        table.insert(v18, 1, v17);
        v17 = v14[v17.Parent];
    end;
    return v18;
end;
v15.buildPathComponents = function(v22, v23, v24, v25, v26) --[[ Line: 63 ]] --[[ Name: buildPathComponents ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v14 (copy), v2 (copy), l_LinkText_0 (copy), l_StyleModifier_0 (copy), l_GetTextSize_0 (copy)
    local v27 = {};
    local l_CurrentScreen_0 = v23.CurrentScreen;
    local l_RecentViewToggled_0 = v23.RecentViewToggled;
    local l_dispatchSetRecentViewToggled_0 = v23.dispatchSetRecentViewToggled;
    local v31 = v22:getCurrentPath(l_CurrentScreen_0);
    local v32 = 1;
    local v33 = l_LayoutOrderIterator_0.new();
    local l_Path_0 = l_CurrentScreen_0.Path;
    for v35, v36 in ipairs(v31) do
        local v37 = v36.Path == l_Path_0;
        local v38 = v36.Path == v14.MAIN.Path;
        local v39 = v23.UniverseName ~= "" and v23.UniverseName or v25:getText("NavBar", "GamePlaceholderName");
        local v40 = v38 and v39 or v25:getText("Folders", v36.Path);
        local v41 = v22.truncatedPathParts[v36.Path] and Enum.TextTruncate.AtEnd or nil;
        local v42 = nil;
        if v22.truncatedPathParts[v36.Path] then
            v42 = UDim2.new(v24.NavBar.TruncatedTextScale, 0, 1, 0);
        end;
        v27[v36.Path] = v2.createElement(l_LinkText_0, {
            Size = v42, 
            Text = v40, 
            Style = "NavBar", 
            StyleModifier = v37 and l_StyleModifier_0.Disabled or v2.None, 
            OnClick = function() --[[ Line: 100 ]] --[[ Name: OnClick ]]
                -- upvalues: v37 (copy), v26 (copy), v36 (copy), l_RecentViewToggled_0 (copy), l_dispatchSetRecentViewToggled_0 (copy)
                if not v37 then
                    v26(true, v36);
                    if l_RecentViewToggled_0 then
                        l_dispatchSetRecentViewToggled_0(false);
                    end;
                end;
            end, 
            TextTruncate = v41, 
            LayoutOrder = v33:getNextOrder()
        });
        if v35 ~= #v31 then
            local v43 = l_GetTextSize_0(">", v24.FontSizeLarge, v24.Font);
            local v44 = UDim2.fromOffset(v43.X, v43.Y);
            v27["PathSeparator-" .. v32] = v2.createElement("TextLabel", {
                Size = v44, 
                BackgroundTransparency = 1, 
                Text = ">", 
                TextColor3 = v24.TextColor, 
                TextSize = v24.FontSizeLarge, 
                Font = v24.Font, 
                LayoutOrder = v33:getNextOrder(), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Bottom
            });
        end;
        if l_Path_0 == v14.MAIN.Path then
            local v45 = "[" .. v25:getText("NavBar", "ID", {
                gameId = game.GameId
            }) .. "]";
            local v46 = l_GetTextSize_0(v45, v24.FontSizeMedium, v24.Font);
            local v47 = UDim2.fromOffset(v46.X, v46.Y);
            v27.UniverseId = v2.createElement("TextBox", {
                Size = v47, 
                LayoutOrder = v33:getNextOrder(), 
                BackgroundTransparency = 1, 
                Text = v45, 
                TextColor3 = v24.SubTextColor, 
                TextSize = v24.FontSizeSmall, 
                Font = v24.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextEditable = false, 
                ClearTextOnFocus = false
            });
        end;
        v32 = v32 + 1;
    end;
    return v27;
end;
v15.init = function(v48) --[[ Line: 157 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v48.state = {
        contentWidth = 0, 
        currentScreen = ""
    };
    v48.preTruncContentWidth = 0;
    v48.truncatedPathParts = {};
    v48.Layout = v2.createRef();
    v48.NavBar = v2.createRef();
end;
v15.didMount = function(v49) --[[ Line: 170 ]] --[[ Name: didMount ]]
    v49:setState({
        contentWidth = v49.Layout.current and v49.Layout.current.AbsoluteContentSize.X or 0
    });
end;
v15.didUpdate = function(v50) --[[ Line: 176 ]] --[[ Name: didUpdate ]]
    local l_CurrentScreen_1 = v50.props.CurrentScreen;
    if l_CurrentScreen_1 ~= v50.state.currentScreen then
        v50:setState({
            currentScreen = l_CurrentScreen_1, 
            contentWidth = v50.Layout.current and v50.Layout.current.AbsoluteContentSize.X or 0
        });
    end;
end;
v15.render = function(v52) --[[ Line: 187 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_props_0 = v52.props;
    local l_Localization_0 = v52.props.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v58 = v52:buildPathComponents(l_props_0, l_Stylizer_0, l_Localization_0, l_props_0.dispatchSetScreen);
    local v59 = {
        GameBarLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, l_Stylizer_0.NavBar.Padding), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v52.Layout
        }), 
        GameBarPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Stylizer_0.NavBar.Padding)
        })
    };
    v59 = v1.Dictionary.join(v59, v58);
    return (v2.createElement("Frame", {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundColor3 = l_Stylizer_0.NavBar.BackgroundColor, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = function() --[[ Line: 224 ]]
            -- upvalues: v52 (copy)
            v52:setState({
                contentWidth = v52.Layout.current and v52.Layout.current.AbsoluteContentSize.X or 0
            });
        end, 
        [v2.Ref] = v52.NavBar
    }, v59));
end;
v15 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v15);
return v3.connect(function(v60, _) --[[ Line: 240 ]] --[[ Name: mapStateToProps ]]
    local l_currentScreen_0 = (v60.Screen or {}).currentScreen;
    return {
        UniverseName = v60.AssetManagerReducer.universeName, 
        CurrentScreen = l_currentScreen_0, 
        RecentViewToggled = v60.AssetManagerReducer.recentViewToggled
    };
end, function(v63) --[[ Line: 251 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy)
    return {
        dispatchSetRecentViewToggled = function(v64) --[[ Line: 253 ]] --[[ Name: dispatchSetRecentViewToggled ]]
            -- upvalues: v63 (copy), v12 (ref)
            v63(v12(v64));
        end, 
        dispatchSetScreen = function(v65, v66) --[[ Line: 256 ]] --[[ Name: dispatchSetScreen ]]
            -- upvalues: v63 (copy), v13 (ref)
            if v65 then
                v63(v13(v66));
            end;
        end
    };
end)(v15);