local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Src.Components;
local v7 = require(l_Components_0.RepopulatableHistoryItem);
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v12 = v1.PureComponent:extend("RepopulatableHistory");
v12.init = function(v13) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v7 (copy)
    v13.createChildren = function() --[[ Line: 21 ]]
        -- upvalues: v13 (copy), v1 (ref), v7 (ref)
        local l_props_0 = v13.props;
        local l_HistoryItems_0 = l_props_0.HistoryItems;
        local l_Vertical_0 = l_props_0.Stylizer.Layout.Vertical;
        local v17 = {
            Layout = v1.createElement("UIListLayout", l_Vertical_0.Vertical)
        };
        for _, v19 in pairs(l_HistoryItems_0) do
            table.insert(v17, 1, v1.createElement(v7, {
                View = v19.View, 
                Name = v19.Name, 
                Data = v19.Data
            }));
        end;
        return v17;
    end;
end;
v12.render = function(v20) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_ScrollingFrame_0 (copy)
    local l_Text_0 = v20.props.Stylizer.Text;
    return v1.createElement(l_Pane_0, {
        Style = "RoundBox", 
        Layout = Enum.FillDirection.Vertical
    }, {
        Header = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Style = "Bold", 
            Text = "History"
        }), 
        ScrollingContainer = v1.createElement(l_ScrollingFrame_0, {
            Size = UDim2.new(1, 0, 1, -l_Text_0.BrightText.Size)
        }, v20.createChildren())
    });
end;
v12 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12);
return v2.connect(function(v22, _) --[[ Line: 72 ]]
    return {
        HistoryItems = v22.History.HistoryItems
    };
end)(v12);