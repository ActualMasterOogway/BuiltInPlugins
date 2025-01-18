local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_LuaMeshEditingModuleContext_0 = v2.Contexts.LuaMeshEditingModuleContext;
local l_SliderSetting_0 = v2.Components.SliderSetting;
local v5 = require(l_Parent_0.Src.Util.Constants);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v6.UI.Pane;
local v10 = v1.PureComponent:extend("FalloffSlider");
v10.init = function(v11) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v11.state = {
        falloff = v5.DEFAULT_FALLOFF
    };
    v11.reportFalloffChangeEvent = function() --[[ Line: 34 ]]
        -- upvalues: v11 (copy)
        v11.props.Analytics:getHandler("FalloffSliderAdjusted")();
    end;
    v11.setFalloff = function(v12) --[[ Line: 38 ]]
        -- upvalues: v11 (copy)
        local v13 = v11.props.LuaMeshEditingModuleContext:getCurrentTool();
        if not v13 then
            return;
        else
            v13:setFalloff(v12);
            v11:setState({
                falloff = v12
            });
            return;
        end;
    end;
end;
v10.didMount = function(v14) --[[ Line: 51 ]] --[[ Name: didMount ]]
    local v15 = v14.props.LuaMeshEditingModuleContext:getCurrentTool();
    if v15 then
        v14:setState({
            falloff = v15:getFalloff()
        });
    end;
end;
v10.render = function(v16) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_SliderSetting_0 (copy), v5 (copy)
    local l_props_0 = v16.props;
    local l_falloff_0 = v16.state.falloff;
    local _ = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ShowMinimal_0 = l_props_0.ShowMinimal;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_SliderSetting_0, {
        Title = if not l_ShowMinimal_0 then l_Localization_0:getText("ToolSettings", "FalloffDistance") else nil, 
        Value = l_falloff_0, 
        MaxValue = v5.MAX_FALLOFF, 
        SnapIncrement = 0.1, 
        Height = l_Stylizer_0.SliderHeight, 
        UsePercentage = false, 
        LayoutOrder = l_LayoutOrder_0, 
        SetValue = v16.setFalloff, 
        ShowInputField = not l_ShowMinimal_0, 
        ShowBackground = true, 
        IsDisabled = false, 
        OnChangeBegan = v16.reportFalloffChangeEvent, 
        OnTextBoxValueChanged = v16.reportFalloffChangeEvent
    });
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10));