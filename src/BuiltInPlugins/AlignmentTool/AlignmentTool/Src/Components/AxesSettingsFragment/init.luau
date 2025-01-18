local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_FitFrameOnAxis_0 = require(l_Parent_0.Packages.FitFrame).FitFrameOnAxis;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_RadioButton_0 = l_UI_0.RadioButton;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v11 = require(l_Parent_0.Src.Utility.AlignmentSpace);
local l_join_0 = v1.join;
local v13 = v3.PureComponent:extend("AxesSettingsFragment");
v13.init = function(v14, v15) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy)
    assert(type(v15.AlignmentSpace) == "string", "Missing required property AlignmentSpace.");
    assert(type(v15.EnabledAxes) == "table", "Missing required property EnabledAxes.");
    assert(type(v15.OnAlignmentSpaceChanged) == "function", "Missing required property OnAlignmentSpaceChanged.");
    assert(type(v15.OnEnabledAxesChanged) == "function", "Missing required property OnEnabledAxesChanged.");
    v14.setAlignmentSpace = function(v16) --[[ Line: 43 ]]
        -- upvalues: v14 (copy)
        local l_props_0 = v14.props;
        if l_props_0.OnAlignmentSpaceChanged then
            l_props_0.OnAlignmentSpaceChanged(v16);
        end;
    end;
    v14.toggleAxis = function(v18) --[[ Line: 50 ]]
        -- upvalues: v14 (copy), l_join_0 (ref)
        local l_props_1 = v14.props;
        if l_props_1.OnEnabledAxesChanged then
            local v20 = l_join_0(l_props_1.EnabledAxes, {
                [v18] = not l_props_1.EnabledAxes[v18]
            });
            l_props_1.OnEnabledAxesChanged(v20);
        end;
    end;
end;
v13.render = function(v21) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v3 (copy), l_Checkbox_0 (copy), l_RadioButton_0 (copy), l_FitFrameOnAxis_0 (copy), v11 (copy)
    local l_props_2 = v21.props;
    local l_EnabledAxes_0 = l_props_2.EnabledAxes;
    local l_Localization_0 = l_props_2.Localization;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local v26 = l_LayoutOrderIterator_0.new();
    local v27 = {};
    for _, v29 in ipairs({
        "X", 
        "Y", 
        "Z"
    }) do
        local v30 = l_EnabledAxes_0 and l_EnabledAxes_0[v29] or false;
        local v31 = l_Localization_0:getText("AxesSettingsFragment", v29);
        v27[v29] = v3.createElement(l_Checkbox_0, {
            Key = v29, 
            Checked = v30, 
            Disabled = false, 
            LayoutOrder = v26:getNextOrder(), 
            Text = v31, 
            OnClick = v21.toggleAxis
        });
    end;
    local function v34(v32, v33) --[[ Line: 87 ]] --[[ Name: renderRadioButton ]]
        -- upvalues: v3 (ref), l_RadioButton_0 (ref), l_props_2 (copy), l_Localization_0 (copy), v21 (copy)
        return v3.createElement(l_RadioButton_0, {
            Disabled = false, 
            Key = v32, 
            LayoutOrder = v33, 
            Selected = l_props_2.AlignmentSpace == v32, 
            Text = l_Localization_0:getText("AxesSettingsFragment", v32), 
            OnClick = v21.setAlignmentSpace
        });
    end;
    return v3.createFragment({
        AlignmentSpaceButtons = v3.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            contentPadding = l_Stylizer_0.SectionContentPadding, 
            BackgroundTransparency = 1, 
            FillDirection = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1
        }, {
            WorldSpaceButton = v34(v11.World, 1), 
            LocalSpaceButton = v34(v11.Local, 2)
        }), 
        AxisCheckboxes = v3.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            contentPadding = l_Stylizer_0.SectionContentPadding, 
            BackgroundTransparency = 1, 
            FillDirection = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1
        }, v27)
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13));