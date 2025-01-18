local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local _ = require(l_Parent_0.Src.Types);
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
local v16 = require(l_Actions_0.SetCount);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v18 = v1.PureComponent:extend("CountModifier");
v18.init = function(v19) --[[ Line: 47 ]] --[[ Name: init ]]
    v19.increaseCountByOne = function() --[[ Line: 48 ]]
        -- upvalues: v19 (copy)
        local l_props_0 = v19.props;
        l_props_0.dispatchSetCount(l_props_0.Count + 1);
        l_props_0.Analytics:report("counterClicked", "increment");
    end;
    v19.decreaseCountByOne = function() --[[ Line: 54 ]]
        -- upvalues: v19 (copy)
        local l_props_1 = v19.props;
        l_props_1.dispatchSetCount(l_props_1.Count - 1);
        l_props_1.Analytics:report("counterClicked", "decrement");
    end;
    v19.resetCount = function() --[[ Line: 60 ]]
        -- upvalues: v19 (copy)
        local l_props_2 = v19.props;
        l_props_2.dispatchSetCount(0);
        l_props_2.Analytics:report("counterClicked", "reset");
    end;
end;
v18.render = function(v23) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_TextLabel_0 (copy)
    local l_props_3 = v23.props;
    local l_Size_0 = l_props_3.Size;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local v27 = tostring(l_props_3.Count);
    local v28 = l_props_3.Localization:getText("CountModifier", "Reset");
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
                OnClick = v23.decreaseCountByOne, 
                LayoutOrder = 1
            }), 
            Display = v1.createElement(l_TextLabel_0, {
                Size = UDim2.fromOffset(150, 50), 
                Text = v27, 
                LayoutOrder = 2
            }), 
            Increase = v1.createElement(l_Button_0, {
                Text = "+", 
                Size = UDim2.fromOffset(50, 50), 
                OnClick = v23.increaseCountByOne, 
                LayoutOrder = 3
            })
        }), 
        ResetButton = v1.createElement(l_Button_0, {
            Size = UDim2.fromOffset(150, 50), 
            Text = v28, 
            OnClick = v23.resetCount, 
            LayoutOrder = 2
        })
    });
end;
v18 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v18);
return v2.connect(function(v29, _) --[[ Line: 120 ]]
    return {
        Count = v29.CountReducer.Count
    };
end, function(v31) --[[ Line: 124 ]]
    -- upvalues: v16 (copy)
    return {
        dispatchSetCount = function(v32) --[[ Line: 126 ]] --[[ Name: dispatchSetCount ]]
            -- upvalues: v31 (copy), v16 (ref)
            v31(v16(v32));
        end
    };
end)(v18);