local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Util.ConstantTemplate);
local v6 = require(l_Parent_0.Util.StateInterfaceTemplates);
local v7 = require(l_Parent_0.Util.StateModelTemplate);
local v8 = require(l_Parent_0.Components.RadioButtonSetPanel);
local v9 = v2.Component:extend("ComponentCollisionPanel");
v9.render = function(v10) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v7 (copy), v2 (copy), v8 (copy), v6 (copy)
    local v11 = {
        [v5.OuterCollision] = v7.setCollisionOuterBox, 
        [v5.InnerCollision] = v7.setCollisionInnerBox
    };
    local l_props_0 = v10.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Mouse_0 = l_props_0.Mouse;
    return v2.createElement(v8, {
        Title = l_Localization_0:getText("General", "TitleCollision"), 
        Buttons = {
            {
                Id = v5.OuterCollision, 
                Title = l_Localization_0:getText("General", "CollisionOuterBox")
            }, 
            {
                Id = v5.InnerCollision, 
                Title = l_Localization_0:getText("General", "CollisionInnerBox")
            }
        }, 
        Enabled = v10.props.IsEnabled, 
        LayoutOrder = v10.props.LayoutOrder, 
        Selected = v6.getStateModelTemplate(v10.props).CollisionValue, 
        Mouse = l_Mouse_0:get(), 
        SelectionChanged = function(v15) --[[ Line: 42 ]] --[[ Name: SelectionChanged ]]
            -- upvalues: v6 (ref), v10 (copy), v11 (copy)
            local v16 = v6.getStateModelTemplateCopy(v10.props);
            v11[v15.Id](v16);
            v10.props.clobberTemplate(v10.props.template, v16);
        end
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v9));