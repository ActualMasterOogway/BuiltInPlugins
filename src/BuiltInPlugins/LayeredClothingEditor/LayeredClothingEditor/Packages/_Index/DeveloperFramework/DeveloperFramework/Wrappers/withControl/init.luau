local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local _ = require(l_Parent_0.Types);
local v3 = require(script.Parent.wrapperShouldUpdate);
local v4 = require(l_Parent_0.Util);
local l_isInputMainPress_0 = v4.isInputMainPress;
local v6 = require(l_Parent_0.Util.StyleModifier);
local l_DoubleClickDetector_0 = v4.DoubleClickDetector;
local l_joinDeep_0 = require(l_Parent_0.Parent.Dash).joinDeep;
local v9 = v1.Component:extend("Controllable");
v9.shouldUpdate = v3;
v9.init = function(v10) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: l_DoubleClickDetector_0 (copy), l_isInputMainPress_0 (copy)
    v10.state = {
        isHovering = false, 
        isPressing = false
    };
    v10.DoubleClickDetector = l_DoubleClickDetector_0.new();
    v10.onMouseEnter = function() --[[ Line: 38 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            isHovering = true
        });
    end;
    v10.onMouseLeave = function() --[[ Line: 43 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            isHovering = false
        });
        if v10.props.ComponentProps.OnHoverEnd then
            v10.props.ComponentProps.OnHoverEnd(v10.props.ComponentProps);
        end;
    end;
    v10.onInputBegan = function(v11, v12) --[[ Line: 51 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v10 (copy)
        if l_isInputMainPress_0(v12) then
            v10:setState({
                isPressing = true
            });
            if v10.props.ComponentProps.OnPress then
                v10.props.ComponentProps.OnPress(v10.props.ComponentProps, v11, v12);
            end;
            if v10.props.ComponentProps.OnDoubleClick and v10.DoubleClickDetector:isDoubleClick() then
                v10.props.ComponentProps.OnDoubleClick(v10.props.ComponentProps, v11, v12);
                return;
            end;
        elseif v12.UserInputType == Enum.UserInputType.MouseButton2 and v10.props.ComponentProps.OnSecondaryPress then
            v10.props.ComponentProps.OnSecondaryPress(v10.props.ComponentProps, v11, v12);
        end;
    end;
    v10.onInputEnded = function(v13, v14) --[[ Line: 68 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v10 (copy)
        if l_isInputMainPress_0(v14) then
            v10:setState({
                isPressing = false
            });
            if v10.props.ComponentProps.OnPressEnd then
                v10.props.ComponentProps.OnPressEnd(v10.props.ComponentProps, v13, v14);
            end;
        end;
    end;
end;
v9.didUpdate = function(v15, _, v17) --[[ Line: 80 ]] --[[ Name: didUpdate ]]
    local l_state_0 = v15.state;
    local l_ComponentProps_0 = v15.props.ComponentProps;
    if l_ComponentProps_0.OnHover and l_state_0.isHovering and not v17.isHovering then
        l_ComponentProps_0.OnHover(v15.props.ComponentProps);
    end;
end;
v9.render = function(v20) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v1 (copy), l_joinDeep_0 (copy)
    local l_props_0 = v20.props;
    local l_state_1 = v20.state;
    local l_Component_0 = l_props_0.Component;
    local l_ComponentProps_1 = l_props_0.ComponentProps;
    local v25 = l_ComponentProps_1.StyleModifier or l_ComponentProps_1.Disabled and v6.Disabled or l_ComponentProps_1.Selected and v6.Selected or l_state_1.isPressing and v6.Pressed or l_state_1.isHovering and v6.Hover or nil;
    return v1.createElement(l_Component_0, l_joinDeep_0(l_ComponentProps_1, {
        StyleModifier = v25, 
        WrapperProps = {
            [v1.Event.MouseEnter] = v20.onMouseEnter, 
            [v1.Event.MouseLeave] = v20.onMouseLeave, 
            [v1.Event.InputBegan] = v20.onInputBegan, 
            [v1.Event.InputEnded] = v20.onInputEnded
        }
    }));
end;
return function(v26) --[[ Line: 116 ]] --[[ Name: withControl ]]
    -- upvalues: v1 (copy), v9 (copy)
    return function(v27) --[[ Line: 117 ]]
        -- upvalues: v1 (ref), v9 (ref), v26 (copy)
        return v1.createElement(v9, {
            Component = v26, 
            ComponentProps = v27
        });
    end;
end;