local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = v2.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v14 = v1.PureComponent:extend("FlowScreenLayout");
l_Util_0.Typecheck.wrap(v14, script);
v14.init = function(v15) --[[ Line: 44 ]] --[[ Name: init ]]
    v15.emptyFunc = function() --[[ Line: 45 ]]
        return nil;
    end;
end;
v14.renderPane = function(v16) --[[ Line: 50 ]] --[[ Name: renderPane ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_ExpandablePane_0 (copy), l_TextLabel_0 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy)
    local l_props_0 = v16.props;
    local l_Title_0 = l_props_0.Title;
    local l_PromptText_0 = l_props_0.PromptText;
    local l_BackButtonText_0 = l_props_0.BackButtonText;
    local v21 = l_props_0.BackButtonEnabled or false;
    local l_NextButtonEnabled_0 = l_props_0.NextButtonEnabled;
    local l_NextButtonText_0 = l_props_0.NextButtonText;
    local l_HasBackButton_0 = l_props_0.HasBackButton;
    local v25 = l_props_0.LayoutOrder or 1;
    local l_GoToNext_0 = l_props_0.GoToNext;
    local v27 = l_props_0.GoToPrevious or v16.emptyFunc;
    local v28 = l_props_0.RenderContent or v16.emptyFunc;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v30 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_ExpandablePane_0, {
        Text = l_Title_0, 
        LayoutOrder = v25, 
        AlwaysExpanded = true, 
        Style = "Section", 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Spacing = l_Stylizer_0.ScreenSpacing
    }, {
        Prompt = v1.createElement(l_TextLabel_0, {
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = l_PromptText_0, 
            TextWrapped = true, 
            LayoutOrder = v30:getNextOrder()
        }), 
        Content = v28(v30:getNextOrder()), 
        NextAndBackButtonContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = v30:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Spacing = l_Stylizer_0.ButtonSpacing
        }, {
            BackButton = l_HasBackButton_0 and v1.createElement(l_Button_0, {
                Text = l_BackButtonText_0, 
                Style = "Round", 
                StyleModifier = not v21 and l_StyleModifier_0.Disabled or nil, 
                Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 0, l_Stylizer_0.ButtonHeight), 
                OnClick = v21 and v27 or function() --[[ Line: 103 ]]

                end, 
                LayoutOrder = v30:getNextOrder()
            }), 
            NextButton = v1.createElement(l_Button_0, {
                Text = l_NextButtonText_0, 
                Style = "Round", 
                StyleModifier = not l_NextButtonEnabled_0 and l_StyleModifier_0.Disabled or nil, 
                Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 0, l_Stylizer_0.ButtonHeight), 
                OnClick = l_NextButtonEnabled_0 and l_GoToNext_0 or function() --[[ Line: 112 ]]

                end, 
                LayoutOrder = v30:getNextOrder()
            })
        })
    });
end;
v14.render = function(v31) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_ScrollingFrame_0 (copy)
    local l_Scrollable_0 = v31.props.Scrollable;
    local v33 = v31:renderPane();
    if not l_Scrollable_0 then
        return v33;
    else
        return v1.createElement(l_Pane_0, {}, {
            MainFrame = v1.createElement(l_ScrollingFrame_0, {}, {
                ExpandablePane = v33
            })
        });
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));