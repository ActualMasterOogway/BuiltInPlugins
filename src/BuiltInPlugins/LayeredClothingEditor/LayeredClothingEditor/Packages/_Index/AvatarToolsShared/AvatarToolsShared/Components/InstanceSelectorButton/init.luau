local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local _ = require(l_Parent_0.Resources);
local l_Components_0 = l_Parent_0.Components;
local v5 = require(l_Components_0.InstanceSelector);
local v6 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_IconButton_0 = v6.UI.IconButton;
local _ = v6.UI.Button;
local l_Typecheck_0 = v6.Util.Typecheck;
local v12 = v2.PureComponent:extend("InstanceSelectorButton");
l_Typecheck_0.wrap(v12, script);
v12.defaultProps = {
    LayoutOrder = 1
};
v12.init = function(v13) --[[ Line: 41 ]] --[[ Name: init ]]
    v13.state = {
        isSelectorActive = false
    };
    v13.onInstanceSelectorValidSelection = function(v14) --[[ Line: 46 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            isSelectorActive = false
        });
        if v13.props.OnInstanceSelectorValidSelection then
            v13.props.OnInstanceSelectorValidSelection(v14);
        end;
    end;
    v13.onInstanceSelectorInvalidSelection = function(v15) --[[ Line: 55 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            isSelectorActive = false
        });
        if v13.props.OnInstanceSelectorInvalidSelection then
            v13.props.OnInstanceSelectorInvalidSelection(v15);
        end;
    end;
    v13.onClickAddNewInstance = function() --[[ Line: 64 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            isSelectorActive = true
        });
        if v13.props.OnClickAddNewInstance then
            v13.props.OnClickAddNewInstance();
        end;
    end;
end;
v12.render = function(v16) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_IconButton_0 (copy), v5 (copy)
    local l_props_0 = v16.props;
    local l_state_0 = v16.state;
    local _ = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_ImageSize_0 = l_Stylizer_0.ImageSize;
    local l_Image_0 = l_Stylizer_0.Image;
    local l_Padding_0 = l_Stylizer_0.Padding;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Tooltip_0 = l_props_0.Tooltip;
    local l_IsSelectedInstanceValid_0 = l_props_0.IsSelectedInstanceValid;
    local l_isSelectorActive_0 = l_state_0.isSelectorActive;
    return v2.createFragment({
        AddNewButton = v2.createElement(l_IconButton_0, {
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            IconSize = l_ImageSize_0, 
            LeftIcon = l_Image_0, 
            Padding = l_Padding_0, 
            OnClick = v16.onClickAddNewInstance, 
            LayoutOrder = l_LayoutOrder_0, 
            TooltipText = l_Tooltip_0
        }), 
        InstanceSelector = l_isSelectorActive_0 and v2.createElement(v5, {
            IsSelectedInstanceValid = l_IsSelectedInstanceValid_0, 
            OnValidSelection = v16.onInstanceSelectorValidSelection, 
            OnInvalidSelection = v16.onInstanceSelectorInvalidSelection
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12));