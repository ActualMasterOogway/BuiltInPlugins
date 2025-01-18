local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(script.Parent.TargetTree);
local l_Util_0 = l_Parent_0.Src.Util;
local v6 = require(l_Util_0.TabIds);
local v7 = require(l_Parent_0.Src.Components.RoactInspectorView);
local v8 = require(l_Parent_0.Src.Components.RoactProfilerView);
local v9 = require(l_Parent_0.Src.Components.TopBar);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v15 = v1.PureComponent:extend("MainView");
v15.render = function(v16) --[[ Line: 29 ]] --[[ Name: render ]]
    local l_props_0 = v16.props;
    return l_props_0.SelectedTarget and v16:renderTarget(l_props_0) or v16:renderSelectTarget(l_props_0);
end;
v15.renderSelectTarget = function(v18, v19) --[[ Line: 34 ]] --[[ Name: renderSelectTarget ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v4 (copy)
    local l_Stylizer_0 = v19.Stylizer;
    return v1.createElement(l_Pane_0, {
        Style = "SubtleBox", 
        Layout = Enum.FillDirection.Vertical, 
        Padding = l_Stylizer_0.Padding
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Text = "Roact Trees", 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.HeaderHeight), 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        TargetTree = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -l_Stylizer_0.HeaderHeight)
        }, {
            Child = v1.createElement(v4, {
                selectTarget = v18.selectTarget
            })
        })
    });
end;
v15.renderTarget = function(_, v22) --[[ Line: 60 ]] --[[ Name: renderTarget ]]
    -- upvalues: v6 (copy), v1 (copy), v7 (copy), v8 (copy), l_Pane_0 (copy), v9 (copy)
    local l_Stylizer_1 = v22.Stylizer;
    local v24 = nil;
    if v22.SelectedTab.Id == v6.ELEMENTS then
        v24 = v1.createElement(v7, {});
    elseif v22.SelectedTab.Id == v6.PROFILE then
        v24 = v1.createElement(v8, {});
    else
        error({
            name = "Missing tab", 
            tab = v22.SelectedTab
        });
    end;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        Style = "Box"
    }, {
        TopBar = v1.createElement(v9, {
            Active = v22.Active
        }), 
        Content = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -l_Stylizer_1.HeaderHeight)
        }, {
            Child = v24
        })
    });
end;
v15 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15);
return v2.connect(function(v25, _) --[[ Line: 93 ]]
    return {
        SelectedTab = v25.Targets.selectedTab, 
        SelectedTarget = v25.Targets.selectedTarget
    };
end)(v15);