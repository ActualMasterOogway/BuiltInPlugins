local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local _ = require(l_Parent_0.Types);
local v3 = require(script.Parent.wrapperShouldUpdate);
local l_joinDeep_0 = require(l_Parent_0.Parent.Dash).joinDeep;
local v5 = v1.Component:extend("SizeAndPosition");
v5.shouldUpdate = v3;
v5.defaultProps = {
    WrapperProps = {}
};
v5.init = function(v6) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v6.ref = v1.createRef();
    v6.state = {
        absolutePosition = Vector2.new(0, 0), 
        absoluteSize = Vector2.new(0, 0)
    };
    v6.onPositionChanged = function() --[[ Line: 37 ]]
        -- upvalues: v6 (copy)
        v6:reposition();
    end;
    v6.onSizeChanged = function() --[[ Line: 40 ]]
        -- upvalues: v6 (copy)
        v6:resize();
    end;
end;
v5.reposition = function(v7) --[[ Line: 45 ]] --[[ Name: reposition ]]
    local l_current_0 = v7.ref.current;
    if l_current_0 and l_current_0.AbsolutePosition then
        v7:setSizeAndPosition();
    end;
end;
v5.resize = function(v9) --[[ Line: 52 ]] --[[ Name: resize ]]
    local l_current_1 = v9.ref.current;
    if l_current_1 and l_current_1.AbsoluteSize then
        v9:setSizeAndPosition();
    end;
end;
v5.setSizeAndPosition = function(v11) --[[ Line: 59 ]] --[[ Name: setSizeAndPosition ]]
    v11:setState(function(v12) --[[ Line: 60 ]]
        -- upvalues: v11 (copy)
        local l_current_2 = v11.ref.current;
        if v12.absolutePosition ~= l_current_2.AbsolutePosition or v12.absoluteSize ~= l_current_2.AbsoluteSize then
            return {
                absolutePosition = Vector2.new(l_current_2.AbsolutePosition.X, l_current_2.AbsolutePosition.Y), 
                absoluteSize = Vector2.new(l_current_2.AbsoluteSize.X, l_current_2.AbsoluteSize.Y)
            };
        else
            return nil;
        end;
    end);
end;
v5.didMount = function(v14) --[[ Line: 73 ]] --[[ Name: didMount ]]
    v14:reposition();
    v14:resize();
end;
v5.render = function(v15) --[[ Line: 78 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_joinDeep_0 (copy)
    local l_props_0 = v15.props;
    local l_state_0 = v15.state;
    local l_Component_0 = l_props_0.Component;
    local l_ComponentProps_0 = l_props_0.ComponentProps;
    return v1.createElement(l_Component_0, l_joinDeep_0({
        AbsolutePosition = l_state_0.absolutePosition, 
        AbsoluteSize = l_state_0.absoluteSize, 
        WrapperProps = {
            [v1.Change.AbsolutePosition] = v15.onPositionChanged, 
            [v1.Change.AbsoluteSize] = v15.onSizeChanged, 
            [v1.Ref] = v15.ref
        }
    }, l_ComponentProps_0));
end;
return function(v20) --[[ Line: 99 ]] --[[ Name: withAbsoluteSizeAndPosition ]]
    -- upvalues: v1 (copy), v5 (copy)
    return function(v21) --[[ Line: 100 ]]
        -- upvalues: v1 (ref), v5 (ref), v20 (copy)
        return v1.createElement(v5, {
            Component = v20, 
            ComponentProps = v21
        });
    end;
end;