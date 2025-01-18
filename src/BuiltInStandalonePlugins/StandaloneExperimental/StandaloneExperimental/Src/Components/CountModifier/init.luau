local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Button_0 = l_UI_0.Button;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v14 = require(l_Actions_0.SetCount);
local v15 = v1.PureComponent:extend("CountModifier");
v15.init = function(v16) --[[ Line: 27 ]] --[[ Name: init ]]
    v16.increaseCountByOne = function() --[[ Line: 28 ]]
        -- upvalues: v16 (copy)
        v16.props.dispatchSetCount(v16.props.Count + 1);
        v16.props.Analytics:report("counterClicked", "increment");
    end;
    v16.decreaseCountByOne = function() --[[ Line: 33 ]]
        -- upvalues: v16 (copy)
        v16.props.dispatchSetCount(v16.props.Count - 1);
        v16.props.Analytics:report("counterClicked", "decrement");
    end;
    v16.resetCount = function() --[[ Line: 38 ]]
        -- upvalues: v16 (copy)
        v16.props.dispatchSetCount(0);
        v16.props.Analytics:report("counterClicked", "reset");
    end;
end;
v15.render = function(v17) --[[ Line: 44 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v17.props;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v21 = tostring(l_props_0.Count);
    local v22 = l_props_0.Localization:getText("CountModifier", "Reset");
    return v1.createElement(l_Pane_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Vertical
    }, {
        CountController = v1.createElement(l_Pane_0, {
            Size = UDim2.fromScale(1, 0.5), 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1
        }, {
            Decrease = v1.createElement(l_Button_0, {
                Size = UDim2.fromOffset(50, 50), 
                Text = "-", 
                OnClick = v17.decreaseCountByOne, 
                LayoutOrder = 1
            }), 
            Display = v1.createElement(l_TextLabel_0, {
                Size = UDim2.fromOffset(150, 50), 
                Text = v21, 
                LayoutOrder = 2
            }), 
            Increase = v1.createElement(l_Button_0, {
                Text = "+", 
                Size = UDim2.fromOffset(50, 50), 
                OnClick = v17.increaseCountByOne, 
                LayoutOrder = 3
            })
        }), 
        ResetButton = v1.createElement(l_Button_0, {
            Size = UDim2.fromOffset(150, 50), 
            Text = v22, 
            OnClick = v17.resetCount, 
            LayoutOrder = 2
        })
    });
end;
v15 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v15);
return v2.connect(function(v23, _) --[[ Line: 97 ]]
    return {
        Count = v23.CountReducer.Count
    };
end, function(v25) --[[ Line: 101 ]]
    -- upvalues: v14 (copy)
    return {
        dispatchSetCount = function(v26) --[[ Line: 103 ]] --[[ Name: dispatchSetCount ]]
            -- upvalues: v25 (copy), v14 (ref)
            v25(v14(v26));
        end
    };
end)(v15);