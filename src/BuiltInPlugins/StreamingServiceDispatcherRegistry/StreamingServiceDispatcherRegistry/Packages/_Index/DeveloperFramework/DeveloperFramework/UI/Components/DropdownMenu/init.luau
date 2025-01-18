local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v5 = require(l_Parent_0.Styling.supportsStyleSheets);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = v6.getFFlagDropdownMenuAddItemHeight();
local v8 = v6.getFFlagDevFrameworkDropdownMenuHeight();
local v9 = v6.getFFlagDevFrameworkFixAutocompleteDropdownMenuStyle();
local v10 = v6.getFFlagDevFrameworkModernStartPageStyle();
local v11 = game:DefineFastFlag("DevFrameworkDropdownInGamePositioning", false);
local v12 = game:DefineFastFlag("DevFrameworkLimitDropdownHeight", false);
local v13 = game:DefineFastFlag("DevFrameworkLimitDropdownHeightFix", false);
local v14 = game:DefineFastFlag("DevFrameworkDropdownFromSide", false);
local v15 = require(l_Parent_0.Util);
local l_prioritize_0 = v15.prioritize;
local l_StyleModifier_0 = v15.StyleModifier;
local v18 = require(l_Parent_0.Util.Typecheck);
local v19 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v19.join;
local l_UI_0 = l_Parent_0.UI;
local v22 = require(l_UI_0.Components.Container);
local v23 = require(l_UI_0.Components.CaptureFocus);
local v24 = require(l_UI_0.Components.Image);
local v25 = require(l_UI_0.Components.ScrollingFrame);
local v26 = require(l_UI_0.Components.DEPRECATED_Button);
local v27 = require(l_UI_0.Components.Pane);
local v28 = require(l_UI_0.Components.RoundBox);
local v29 = require(l_UI_0.Components.TextLabel);
local v30 = v1.PureComponent:extend("DropdownMenu");
v18.wrap(v30, script);
v30.init = function(v31) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_prioritize_0 (copy), v11 (copy), v14 (copy), v13 (copy), v12 (copy), v8 (copy), v10 (copy), v7 (copy), v26 (copy), l_StyleModifier_0 (copy), v27 (copy), v24 (copy), l_join_0 (copy), v29 (copy), v19 (copy), v9 (copy), v5 (copy), v4 (copy)
    v31.ref = v1.createRef();
    v31.state = {
        absoluteSize = Vector2.new(0, 0), 
        menuContentSize = Vector2.new(0, 0)
    };
    v31.recalculateContentSize = function(v32) --[[ Line: 95 ]]
        -- upvalues: v31 (copy)
        local l_current_0 = v31.ref.current;
        if l_current_0 ~= nil then
            v31:setState({
                menuContentSize = v32.AbsoluteContentSize, 
                absolutePosition = l_current_0.AbsolutePosition, 
                absoluteSize = l_current_0.AbsoluteSize
            });
            return;
        else
            v31:setState({
                menuContentSize = v32.AbsoluteContentSize
            });
            return;
        end;
    end;
    v31.reposition = function() --[[ Line: 110 ]]
        -- upvalues: v31 (copy)
        local l_current_1 = v31.ref.current;
        if l_current_1 ~= nil then
            v31:setState({
                absolutePosition = l_current_1.AbsolutePosition, 
                absoluteSize = l_current_1.AbsoluteSize
            });
        end;
    end;
    v31.getPositionAndSize = function(v35, v36, v37) --[[ Line: 120 ]]
        -- upvalues: v31 (copy), l_prioritize_0 (ref), v11 (ref), v14 (ref), v13 (ref), v12 (ref)
        local l_state_0 = v31.state;
        local l_props_0 = v31.props;
        local l_Y_0 = l_state_0.menuContentSize.Y;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local v42 = l_prioritize_0(l_props_0.MaxHeight, l_Stylizer_0.MaxHeight);
        local v43 = Vector2.new();
        local v44 = Vector2.new();
        if v31.ref.current then
            v43 = v31.ref.current.Parent.AbsolutePosition;
            v44 = v31.ref.current.Parent.AbsoluteSize;
        end;
        local l_absoluteSize_0 = l_state_0.absoluteSize;
        local l_AbsoluteSize_0 = v35.AbsoluteSize;
        local v47 = nil;
        if v11 then
            v47 = v35.AbsolutePosition;
        end;
        local v48 = nil;
        local v49 = nil;
        local v50 = v14 and l_props_0.DropFromSide;
        v48 = if v43.X + v37.X + v36 + (if v50 then l_absoluteSize_0.X else 0) <= l_AbsoluteSize_0.X then v43.X + v37.X + if v50 then l_absoluteSize_0.X else 0 else v43.X + (v50 and 0 or l_absoluteSize_0.X) + v37.X - v36;
        local v51 = v43.Y + (v50 and 0 or v44.Y) + v37.Y + math.min(l_Y_0, v42) < l_AbsoluteSize_0.Y;
        local v52 = v43.Y - v37.Y - v42 + (if v50 then v44.Y else 0) > 0;
        local l_Bottom_0 = Enum.VerticalAlignment.Bottom;
        if (v51 or v52) and not v51 then
            l_Bottom_0 = Enum.VerticalAlignment.Top;
        end;
        local v54 = nil;
        if l_Bottom_0 == Enum.VerticalAlignment.Bottom then
            v49 = v43.Y + (v50 and 0 or v44.Y) + v37.Y;
            v54 = Enum.VerticalAlignment.Top;
        else
            local v55 = math.min(l_Y_0, v42);
            v49 = v43.Y - v37.Y - v55 + if v50 then v44.Y else 0;
            v54 = Enum.VerticalAlignment.Bottom;
        end;
        local v56 = nil;
        if not v13 then
            v56 = v42 < l_Y_0;
        end;
        if v11 then
            v49 = v49 - v47.Y;
            v48 = v48 - v47.X;
        end;
        if v12 then
            if l_AbsoluteSize_0.Y - v49 < v42 then
                if v13 then
                    v42 = l_AbsoluteSize_0.Y - v49;
                else
                    l_Y_0 = l_AbsoluteSize_0.Y - v49;
                end;
            end;
        elseif l_AbsoluteSize_0.Y - v49 < l_Y_0 then
            v42 = l_AbsoluteSize_0.Y - v49;
        end;
        if v13 then
            v56 = v42 < l_Y_0;
        end;
        return {
            X = v48, 
            Y = v49, 
            Height = math.min(l_Y_0, v42), 
            NeedsScrollingFrame = v56, 
            VerticalAlignment = v54
        };
    end;
    v31.changeTokens = {};
    if v8 then
        v31.onInputBegan = function(_, v58) --[[ Line: 225 ]]
            -- upvalues: v31 (copy)
            local l_props_1 = v31.props;
            local l_HoveredItemIndex_0 = l_props_1.HoveredItemIndex;
            if v58.KeyCode == Enum.KeyCode.Down then
                l_props_1.OnHoveredItemChanged((math.min(#l_props_1.Items, l_HoveredItemIndex_0 + 1)));
                return;
            elseif v58.KeyCode == Enum.KeyCode.Up then
                l_props_1.OnHoveredItemChanged((math.max(1, l_HoveredItemIndex_0 - 1)));
                return;
            else
                if v58.KeyCode == Enum.KeyCode.Return then
                    l_props_1.OnItemActivated(l_props_1.Items[l_HoveredItemIndex_0]);
                    if l_props_1.OnFocusLost then
                        l_props_1.OnFocusLost();
                    end;
                end;
                return;
            end;
        end;
    end;
    v31.defaultOnRenderItem = function(v61, v62, v63, v64) --[[ Line: 241 ]]
        -- upvalues: v31 (copy), v10 (ref), v7 (ref), l_prioritize_0 (ref), v1 (ref), v26 (ref), v8 (ref), l_StyleModifier_0 (ref), v27 (ref), v24 (ref), l_join_0 (ref), v29 (ref), v19 (ref), v9 (ref), v5 (ref), v4 (ref)
        local l_props_2 = v31.props;
        local l_Icons_0 = l_props_2.Icons;
        local l_Stylizer_1 = l_props_2.Stylizer;
        local v68 = v10 and l_props_2.Variant == "modern";
        local v69 = nil;
        v69 = if v7 then l_prioritize_0(l_props_2.ItemHeight, l_Stylizer_1.ItemHeight, 40) else 40;
        local l_v61_0 = v61;
        local v71 = if l_Icons_0 then l_Icons_0[v62] else nil;
        local v72 = nil;
        if typeof(v61) == "table" then
            l_v61_0 = v61.Label;
            if v61.Icon then
                v71 = v61.Icon;
            end;
        else
            v72 = {
                Image = v71
            };
        end;
        return v1.createElement(v26, {
            LayoutOrder = v62, 
            OnClick = v63, 
            OnMouseEnter = v8 and function() --[[ Line: 273 ]]
                -- upvalues: l_props_2 (copy), v62 (copy)
                if l_props_2.OnHoveredItemChanged then
                    l_props_2.OnHoveredItemChanged(v62);
                end;
            end or nil, 
            Size = UDim2.new(1, 0, 0, v69), 
            StyleModifier = if v8 and v64 then l_StyleModifier_0.Hover else nil, 
            Style = v68 and "ModernDropdown" or nil
        }, {
            ImageContainer = if v71 then v1.createElement(v27, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v69, v69)
            }, {
                Image = v1.createElement(v24, l_join_0({
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(16, 16), 
                    Style = v72
                }, if typeof(v71) == "table" then v71 else nil))
            }) else nil, 
            Label = v1.createElement(v29, v19.join({
                LayoutOrder = 2, 
                Size = UDim2.new(1, if v71 then -v69 else 0, 1, 0), 
                Text = l_v61_0, 
                TextTruncate = if v9 then Enum.TextTruncate.AtEnd else nil, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = v31.props.TextWrapped
            }, if v5 and v68 then {
                [v4.Tag] = "BuilderSans Muted"
            } else {}), {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v71 and 40 or 10)
                })
            })
        });
    end;
end;
v30.didUpdate = function(v73) --[[ Line: 321 ]] --[[ Name: didUpdate ]]
    local l_current_2 = v73.ref.current;
    if not l_current_2 or v73.addedListeners then
        return;
    else
        v73.addedListeners = true;
        local l_Parent_1 = l_current_2.Parent;
        if l_Parent_1 then
            table.insert(v73.changeTokens, l_Parent_1:GetPropertyChangedSignal("AbsoluteSize"):Connect(v73.reposition));
            table.insert(v73.changeTokens, l_Parent_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(v73.reposition));
        end;
        return;
    end;
end;
v30.willUnmount = function(v76) --[[ Line: 334 ]] --[[ Name: willUnmount ]]
    for _, v78 in ipairs(v76.changeTokens) do
        v78:Disconnect();
    end;
end;
v30.renderMenu = function(v79) --[[ Line: 340 ]] --[[ Name: renderMenu ]]
    -- upvalues: v10 (copy), l_prioritize_0 (copy), v1 (copy), v8 (copy), v25 (copy), v19 (copy), v5 (copy), v4 (copy), v22 (copy), v28 (copy)
    local l_state_1 = v79.state;
    local l_props_3 = v79.props;
    local l_Stylizer_2 = l_props_3.Stylizer;
    local v83 = 1;
    local v84 = v10 and l_props_3.Variant == "modern";
    if v84 then
        v83 = 0;
    end;
    local l_Items_0 = l_props_3.Items;
    local v86 = l_prioritize_0(l_props_3.OnRenderItem, v79.defaultOnRenderItem);
    local function _(v87, v88) --[[ Line: 354 ]]
        -- upvalues: l_props_3 (copy)
        l_props_3.OnItemActivated(v87, v88);
        if l_props_3.OnFocusLost then
            l_props_3.OnFocusLost();
        end;
    end;
    local l_BackgroundColor_0 = l_Stylizer_2.BackgroundColor;
    local v91 = if l_props_3.UseAutoWidth then v79.state.menuContentSize.X else l_props_3.Width or l_Stylizer_2.Width;
    local v92 = l_prioritize_0(l_Stylizer_2.Offset, Vector2.new(0, 0));
    local v93 = l_props_3.Focus:get();
    local v94 = v79.getPositionAndSize(v93, v91, v92);
    local l_X_0 = v94.X;
    local l_Y_1 = v94.Y;
    local l_Height_0 = v94.Height;
    local l_NeedsScrollingFrame_0 = v94.NeedsScrollingFrame;
    local l_VerticalAlignment_0 = v94.VerticalAlignment;
    local v100 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = l_VerticalAlignment_0, 
            [v1.Change.AbsoluteContentSize] = v79.recalculateContentSize
        })
    };
    for v101, v102 in ipairs(l_Items_0) do
        v100[tostring(v101)] = v86(v102, v101, function() --[[ Line: 383 ]]
            -- upvalues: v102 (copy), v101 (copy), l_props_3 (copy)
            local l_v102_0 = v102;
            local l_v101_0 = v101;
            l_props_3.OnItemActivated(l_v102_0, l_v101_0);
            if l_props_3.OnFocusLost then
                l_props_3.OnFocusLost();
            end;
        end, if v8 then v101 == l_props_3.HoveredItemIndex else nil);
    end;
    local v105 = {
        UIStroke = if v84 then v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = l_Stylizer_2.StrokeColor, 
            Thickness = l_Stylizer_2.StrokeThickness
        }) else nil, 
        UICorner = if v84 then v1.createElement("UICorner", {
            CornerRadius = l_Stylizer_2.CornerRadius
        }) else nil, 
        ScrollingContainer = if l_NeedsScrollingFrame_0 then v1.createElement(v25, v19.join({
            AutoSizeCanvas = false, 
            Size = UDim2.new(1, -v83 * 2, 1, -v83 * 2), 
            AutomaticSize = if l_props_3.UseAutoWidth then Enum.AutomaticSize.X else nil, 
            Position = UDim2.fromOffset(v83, v83), 
            CanvasSize = UDim2.fromOffset(l_state_1.menuContentSize.X, l_state_1.menuContentSize.Y)
        }, if v5 and v84 then {
            [v4.Tag] = "modern"
        } else nil), v100) else nil, 
        Container = if l_NeedsScrollingFrame_0 then nil else v1.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, -v83 * 2, 1, -v83 * 2), 
            AutomaticSize = if l_props_3.UseAutoWidth then Enum.AutomaticSize.X else nil, 
            Position = UDim2.fromOffset(v83, v83), 
            BackgroundColor3 = l_BackgroundColor_0, 
            BackgroundTransparency = v84 and 1 or 0
        }, v100), 
        HoverDetector = v1.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -v83 * 2, 1, -v83 * 2), 
            Position = UDim2.fromOffset(v83, v83), 
            TextTransparency = 1, 
            ZIndex = -1, 
            [v1.Event.InputBegan] = if v8 then v79.onInputBegan else nil, 
            [v1.Event.MouseEnter] = l_props_3.OnMouseEnter, 
            [v1.Event.MouseLeave] = l_props_3.OnMouseLeave
        })
    };
    if v84 then
        return v1.createElement("CanvasGroup", {
            Position = UDim2.fromOffset(l_X_0, l_Y_1), 
            Size = UDim2.fromOffset(v91, l_Height_0 + v83 * 2), 
            BackgroundColor3 = l_BackgroundColor_0, 
            BackgroundTransparency = 0
        }, v105);
    else
        return v1.createElement(v22, {
            Position = UDim2.fromOffset(l_X_0, l_Y_1), 
            Size = UDim2.fromOffset(v91, l_Height_0 + v83 * 2), 
            Background = v28, 
            BackgroundStyle = l_Stylizer_2.BackgroundStyle
        }, v105);
    end;
end;
v30.render = function(v106) --[[ Line: 456 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v22 (copy), v23 (copy)
    local l_props_4 = v106.props;
    local v108 = not l_props_4.Hide;
    local l_Priority_0 = l_props_4.Priority;
    return v1.createElement(v22, {
        [v1.Ref] = v106.ref, 
        Size = UDim2.fromScale(1, 0)
    }, {
        PortalToRoot = v108 and v1.createElement(v23, {
            OnFocusLost = l_props_4.OnFocusLost, 
            Priority = l_Priority_0
        }, {
            Menu = v108 and v106:renderMenu()
        })
    });
end;
return (l_withContext_0({
    Focus = v2.Focus, 
    Stylizer = v2.Stylizer
})(v30));