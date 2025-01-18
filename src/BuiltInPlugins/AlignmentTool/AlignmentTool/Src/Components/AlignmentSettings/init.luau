local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Actions.SetAlignmentMode);
local v6 = require(l_Parent_0.Src.Actions.SetAlignmentSpace);
local v7 = require(l_Parent_0.Src.Actions.SetEnabledAxes);
local v8 = require(l_Parent_0.Src.Actions.SetRelativeTo);
local v9 = require(l_Parent_0.Src.Components.AxesSettingsFragment);
local v10 = require(l_Parent_0.Src.Components.ModeSetting);
local v11 = require(l_Parent_0.Src.Components.LabeledElementList);
local v12 = require(l_Parent_0.Src.Components.RelativeToSetting);
local v13 = require(l_Parent_0.Src.Thunks.UpdateActiveInstanceHighlight);
local v14 = require(l_Parent_0.Src.Thunks.UpdateAlignEnabled);
local v15 = v1.PureComponent:extend("AlignmentSettings");
v15.render = function(v16) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v10 (copy), v9 (copy), v12 (copy), v11 (copy)
    local l_props_0 = v16.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v20 = {
        {
            Text = l_Localization_0:getText("ModeSection", "Title"), 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Content = v1.createElement(v10, {
                Value = l_props_0.alignmentMode, 
                OnValueChanged = l_props_0.setAlignmentMode
            })
        }, 
        {
            Text = l_Localization_0:getText("AxesSection", "Title"), 
            Content = v1.createElement(v9, {
                AlignmentSpace = l_props_0.alignmentSpace, 
                EnabledAxes = l_props_0.enabledAxes, 
                OnAlignmentSpaceChanged = l_props_0.setAlignmentSpace, 
                OnEnabledAxesChanged = l_props_0.setEnabledAxes
            })
        }, 
        {
            Text = l_Localization_0:getText("RelativeToSection", "Title"), 
            Content = v1.createElement(v12, {
                Value = l_props_0.relativeTo, 
                OnValueChanged = l_props_0.setRelativeTo
            })
        }
    };
    return v1.createElement(v11, {
        Collapsible = true, 
        Items = v20, 
        LayoutOrder = l_props_0.LayoutOrder, 
        MaximumLabelWidth = l_Stylizer_0.MaximumLabelWidth
    });
end;
v15 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15);
return v2.connect(function(v21, _) --[[ Line: 70 ]] --[[ Name: mapStateToProps ]]
    return {
        alignmentMode = v21.alignmentMode, 
        alignmentSpace = v21.alignmentSpace, 
        enabledAxes = v21.enabledAxes, 
        relativeTo = v21.relativeTo
    };
end, function(v23) --[[ Line: 79 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy), v14 (copy), v6 (copy), v7 (copy), v8 (copy), v13 (copy)
    return {
        setAlignmentMode = function(v24) --[[ Line: 81 ]] --[[ Name: setAlignmentMode ]]
            -- upvalues: v23 (copy), v5 (ref), v14 (ref)
            v23(v5(v24));
            v23(v14());
        end, 
        setAlignmentSpace = function(v25) --[[ Line: 85 ]] --[[ Name: setAlignmentSpace ]]
            -- upvalues: v23 (copy), v6 (ref), v14 (ref)
            v23(v6(v25));
            v23(v14());
        end, 
        setEnabledAxes = function(v26) --[[ Line: 89 ]] --[[ Name: setEnabledAxes ]]
            -- upvalues: v23 (copy), v7 (ref), v14 (ref)
            v23(v7(v26));
            v23(v14());
        end, 
        setRelativeTo = function(v27) --[[ Line: 93 ]] --[[ Name: setRelativeTo ]]
            -- upvalues: v23 (copy), v8 (ref), v14 (ref), v13 (ref)
            v23(v8(v27));
            v23(v14());
            v23(v13());
        end
    };
end)(v15);