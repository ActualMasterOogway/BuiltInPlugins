local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Src.Components;
local v6 = require(l_Components_0.TextInput);
local l_RadioButtonList_0 = v2.UI.RadioButtonList;
local l_INPUT_PANE_LAYOUT_0 = require(l_Parent_0.Src.Util.Constants).INPUT_PANE_LAYOUT;
local v9 = v1.PureComponent:extend("ThemeView");
local v10 = {
    Routes = {}, 
    SelectedKey = "", 
    ThemeName = "", 
    FocusLost = function() --[[ Line: 35 ]] --[[ Name: FocusLost ]]

    end
};
v9.init = function(v11) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v11.state = {
        SelectedKey = nil
    };
    v11.OnClick = function(v12) --[[ Line: 43 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            SelectedKey = v12
        });
    end;
    v11.createRoutes = function() --[[ Line: 49 ]]
        -- upvalues: v10 (ref)
        local v13 = {};
        for v14, v15 in pairs(v10.Routes) do
            table.insert(v13, {
                Key = v15, 
                Text = "Use " .. v14
            });
        end;
        return v13;
    end;
end;
v9.render = function(v16) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_INPUT_PANE_LAYOUT_0 (copy), v6 (copy), v10 (copy), l_RadioButtonList_0 (copy)
    local l_state_0 = v16.state;
    local l_props_0 = v16.props;
    local l_SelectedKey_0 = l_state_0.SelectedKey;
    local l_Layout_0 = l_props_0.Stylizer.Layout;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.View, 
        BackgroundTransparency = 1, 
        ZIndex = -5
    }, {
        Layout = v1.createElement("UIListLayout", l_Layout_0.Vertical), 
        TextInput = v1.createElement(v6, {
            Label = "Theme Name", 
            Text = v10.ThemeName, 
            OnChange = v10.FocusLost, 
            LayoutOrder = 1
        }), 
        Switch = v1.createElement(l_RadioButtonList_0, {
            Buttons = v16.createRoutes(), 
            OnClick = v16.OnClick, 
            SelectedKey = l_SelectedKey_0, 
            LayoutOrder = 2
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));