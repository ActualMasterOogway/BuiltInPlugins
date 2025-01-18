local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Container_0 = l_UI_0.Container;
local l_Box_0 = l_UI_0.Box;
local l_Components_0 = l_Parent_0.Src.Components;
local v10 = require(l_Components_0.NameBox);
local v11 = require(l_Components_0.Dropdown);
local v12 = require(l_Components_0.Views.RBXEventView);
local v13 = require(l_Components_0.Views.ThemeView);
local v14 = require(l_Components_0.Views.MemStorageEventView);
local v15 = require(l_Parent_0.Src.Util.Constants);
local l_VIEW_ID_0 = v15.VIEW_ID;
local l_INPUT_PANE_LAYOUT_0 = v15.INPUT_PANE_LAYOUT;
local v18 = v1.PureComponent:extend("InputPane");
v18.init = function(v19) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: l_VIEW_ID_0 (copy), v12 (copy), v13 (copy), v14 (copy), v1 (copy)
    v19.getView = function() --[[ Line: 31 ]]
        -- upvalues: v19 (copy), l_VIEW_ID_0 (ref), v12 (ref), v13 (ref), v14 (ref), v1 (ref)
        local l_ActiveView_0 = v19.props.ActiveView;
        local v21 = "Frame";
        if l_ActiveView_0 == l_VIEW_ID_0.RBXEvent then
            v21 = v12;
        end;
        if l_ActiveView_0 == l_VIEW_ID_0.Theme then
            v21 = v13;
        end;
        if l_ActiveView_0 == l_VIEW_ID_0.MemStorage then
            v21 = v14;
        end;
        return v1.createElement(v21);
    end;
end;
v18.render = function(v22) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Container_0 (copy), l_Box_0 (copy), l_INPUT_PANE_LAYOUT_0 (copy), v11 (copy), v10 (copy)
    local l_Stylizer_0 = v22.props.Stylizer;
    local l_Sizes_0 = l_Stylizer_0.Sizes;
    local l_Vertical_0 = l_Stylizer_0.Layout.Vertical;
    return v1.createElement(l_Container_0, {
        Size = UDim2.new(1, 0, 0, l_Sizes_0.InputPaneLength), 
        Background = l_Box_0, 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.InputPane
    }, {
        Layout = v1.createElement("UIListLayout", l_Vertical_0), 
        Dropdown = v1.createElement(v11), 
        Name = v1.createElement(v10), 
        View = v22.getView()
    });
end;
v18 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v18);
return v2.connect(function(v26, _) --[[ Line: 73 ]]
    return {
        ActiveView = v26.Status.ActiveView
    };
end)(v18);