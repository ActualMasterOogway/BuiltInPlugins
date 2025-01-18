local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Immutable_0 = require(l_Parent_0.Util).Immutable;
local v3 = require(l_Parent_0.Util.Typecheck);
local v4 = require(l_Parent_0.Wrappers.withForwardRef);
local v5 = v1.PureComponent:extend("Container");
v3.wrap(v5, script);
v5.render = function(v6) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Immutable_0 (copy)
    local l_props_0 = v6.props;
    local l_Background_0 = l_props_0.Background;
    local l_BackgroundStyle_0 = l_props_0.BackgroundStyle;
    local l_BackgroundStyleModifier_0 = l_props_0.BackgroundStyleModifier;
    local l_Active_0 = l_props_0.Active;
    local l_AutomaticSize_0 = l_props_0.AutomaticSize;
    local l_Padding_0 = l_props_0.Padding;
    local l_Margin_0 = l_props_0.Margin;
    local v15 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Visible_0 = l_props_0.Visible;
    local l_ElementOverride_0 = l_props_0.ElementOverride;
    local l_ForwardRef_0 = l_props_0.ForwardRef;
    local v23 = l_props_0.ClipsDescendants or false;
    local v24 = l_props_0[v1.Children] or {};
    if type(l_Padding_0) == "number" then
        v24 = l_Immutable_0.JoinDictionaries(v24, {
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Padding_0), 
                PaddingBottom = UDim.new(0, l_Padding_0), 
                PaddingLeft = UDim.new(0, l_Padding_0), 
                PaddingRight = UDim.new(0, l_Padding_0)
            })
        });
    elseif type(l_Padding_0) == "table" then
        v24 = l_Immutable_0.JoinDictionaries(v24, {
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Padding_0.Top), 
                PaddingBottom = UDim.new(0, l_Padding_0.Bottom), 
                PaddingLeft = UDim.new(0, l_Padding_0.Left), 
                PaddingRight = UDim.new(0, l_Padding_0.Right)
            })
        });
    end;
    local v25 = nil;
    if l_Margin_0 then
        if type(l_Margin_0) == "number" then
            v25 = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Margin_0), 
                PaddingBottom = UDim.new(0, l_Margin_0), 
                PaddingLeft = UDim.new(0, l_Margin_0), 
                PaddingRight = UDim.new(0, l_Margin_0)
            });
        elseif type(l_Margin_0) == "table" then
            v25 = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Margin_0.Top), 
                PaddingBottom = UDim.new(0, l_Margin_0.Bottom), 
                PaddingLeft = UDim.new(0, l_Margin_0.Left), 
                PaddingRight = UDim.new(0, l_Margin_0.Right)
            });
        end;
    end;
    local v26 = UDim2.new(1, 0, 1, 0);
    if l_AutomaticSize_0 then
        v26 = v15;
    end;
    return v1.createElement(l_ElementOverride_0 or "Frame", {
        Active = l_Active_0, 
        AutomaticSize = l_AutomaticSize_0, 
        BackgroundTransparency = 1, 
        Size = v15, 
        SizeConstraint = l_props_0.SizeConstraint, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        AnchorPoint = l_AnchorPoint_0, 
        ZIndex = l_ZIndex_0, 
        Visible = l_Visible_0, 
        [v1.Ref] = l_ForwardRef_0, 
        [v1.Change.AbsoluteSize] = l_props_0[v1.Change.AbsoluteSize], 
        [v1.Change.AbsolutePosition] = l_props_0[v1.Change.AbsolutePosition]
    }, {
        Margin = v25, 
        Decoration = l_Background_0 and v1.createElement(l_Background_0, {
            Style = l_BackgroundStyle_0, 
            StyleModifier = l_BackgroundStyleModifier_0, 
            ImageColor3 = l_props_0.ImageColor3
        }), 
        Contents = v1.createElement("Frame", {
            ClipsDescendants = v23, 
            BackgroundTransparency = 1, 
            Size = v26, 
            ZIndex = 2
        }, v24)
    });
end;
return v4(v5);