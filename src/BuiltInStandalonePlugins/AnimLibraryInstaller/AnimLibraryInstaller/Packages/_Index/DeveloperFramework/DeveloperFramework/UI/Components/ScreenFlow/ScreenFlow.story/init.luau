local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.ScreenFlow);
local v3 = require(l_Parent_0.UI.Components.Pane);
local v4 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v5 = require(l_Parent_0.UI.Components.TextLabel);
local v6 = require(l_Parent_0.Util.StyleModifier);
local v7 = require(l_Parent_0.Util.LayoutOrderIterator);
local v8 = v1.PureComponent:extend("StartScreen");
local v9 = v1.PureComponent:extend("MiddleScreen");
local v10 = v1.PureComponent:extend("EndScreen");
local v11 = v1.PureComponent:extend("EndScreenCycle");
local function v21(v12) --[[ Line: 17 ]] --[[ Name: renderScreen ]]
    -- upvalues: v7 (copy), v1 (copy), v3 (copy), v5 (copy), v4 (copy), v6 (copy)
    local l_Text_0 = v12.Text;
    local l_BackButtonEnabled_0 = v12.BackButtonEnabled;
    local l_NextButtonEnabled_0 = v12.NextButtonEnabled;
    local l_HasBackButton_0 = v12.HasBackButton;
    local l_HasNextButton_0 = v12.HasNextButton;
    local v18 = l_NextButtonEnabled_0 and v12.GoToNext or function() --[[ Line: 23 ]]

    end;
    local v19 = l_BackButtonEnabled_0 and v12.GoToPrevious or function() --[[ Line: 24 ]]

    end;
    local v20 = v7.new();
    return v1.createElement(v3, {
        Size = UDim2.new(1, 0, 0, 200), 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Prompt = v1.createElement(v5, {
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = l_Text_0, 
            LayoutOrder = v20:getNextOrder()
        }), 
        NextAndBackButtonContainer = v1.createElement(v3, {
            Size = UDim2.new(1, 0, 0, 24), 
            LayoutOrder = v20:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Spacing = 12
        }, {
            BackButton = l_HasBackButton_0 and v1.createElement(v4, {
                Text = "Back", 
                StyleModifier = not l_BackButtonEnabled_0 and v6.Disabled or nil, 
                Size = UDim2.new(0, 64, 1, 0), 
                OnClick = v19, 
                LayoutOrder = v20:getNextOrder()
            }), 
            NextButton = l_HasNextButton_0 and v1.createElement(v4, {
                Text = "Next", 
                StyleModifier = not l_NextButtonEnabled_0 and v6.Disabled or nil, 
                Size = UDim2.new(0, 64, 1, 0), 
                OnClick = v18, 
                LayoutOrder = v20:getNextOrder()
            })
        })
    });
end;
v8.render = function(v22) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy)
    local l_props_0 = v22.props;
    return v21({
        Text = "First Screen", 
        NextButtonEnabled = true, 
        BackButtonEnabled = false, 
        HasBackButton = false, 
        HasNextButton = true, 
        GoToNext = l_props_0.GoToNext, 
        GoToPrevious = l_props_0.GoToPrevious
    });
end;
v9.render = function(v24) --[[ Line: 82 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy)
    local l_props_1 = v24.props;
    return v21({
        Text = "Second Screen", 
        NextButtonEnabled = true, 
        BackButtonEnabled = true, 
        HasBackButton = true, 
        HasNextButton = true, 
        GoToNext = l_props_1.GoToNext, 
        GoToPrevious = l_props_1.GoToPrevious
    });
end;
v10.render = function(v26) --[[ Line: 96 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy)
    local l_props_2 = v26.props;
    return v21({
        Text = "Last Screen", 
        NextButtonEnabled = false, 
        BackButtonEnabled = true, 
        HasBackButton = true, 
        HasNextButton = false, 
        GoToNext = l_props_2.GoToNext, 
        GoToPrevious = l_props_2.GoToPrevious
    });
end;
v11.render = function(v28) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy)
    local l_props_3 = v28.props;
    return v21({
        Text = "Last Screen", 
        NextButtonEnabled = true, 
        BackButtonEnabled = true, 
        HasBackButton = true, 
        HasNextButton = true, 
        GoToNext = l_props_3.GoToNext, 
        GoToPrevious = l_props_3.GoToPrevious
    });
end;
return {
    stories = {
        {
            name = "Default Linear Flow (No Cycle)", 
            story = v1.createElement(v2, {
                Screens = {
                    v8, 
                    v9, 
                    v10
                }
            })
        }, 
        {
            name = "Default Linear Flow (Cycle)", 
            story = v1.createElement(v2, {
                Screens = {
                    v8, 
                    v9, 
                    v11
                }
            })
        }
    }
};