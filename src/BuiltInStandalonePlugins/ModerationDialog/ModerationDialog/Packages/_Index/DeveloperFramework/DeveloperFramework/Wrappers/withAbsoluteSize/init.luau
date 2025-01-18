local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local _ = require(l_Parent_0.Types);
local v3 = require(script.Parent.wrapperShouldUpdate);
local l_joinDeep_0 = require(l_Parent_0.Parent.Dash).joinDeep;
local v5 = v1.Component:extend("Resizer");
v5.shouldUpdate = v3;
v5.init = function(v6) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v6.ref = v1.createRef();
    v6.state = {
        absoluteSize = Vector2.new(0, 0)
    };
    v6.onSizeChanged = function() --[[ Line: 32 ]]
        -- upvalues: v6 (copy)
        v6:resize();
    end;
end;
v5.resize = function(v7) --[[ Line: 37 ]] --[[ Name: resize ]]
    local l_current_0 = v7.ref.current;
    if l_current_0 and l_current_0.AbsoluteSize then
        v7:setSize(l_current_0.AbsoluteSize);
    end;
end;
v5.setSize = function(v9, v10) --[[ Line: 44 ]] --[[ Name: setSize ]]
    v9:setState(function(v11) --[[ Line: 45 ]]
        -- upvalues: v10 (copy)
        if v11.absoluteSize ~= v10 then
            return {
                absoluteSize = Vector2.new(v10.X, v10.Y)
            };
        else
            return nil;
        end;
    end);
end;
v5.didMount = function(v12) --[[ Line: 56 ]] --[[ Name: didMount ]]
    v12:resize();
end;
v5.render = function(v13) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_joinDeep_0 (copy)
    local l_props_0 = v13.props;
    local l_state_0 = v13.state;
    local l_Component_0 = l_props_0.Component;
    local l_ComponentProps_0 = l_props_0.ComponentProps;
    local v18 = {
        [v1.Change.AbsoluteSize] = v13.onSizeChanged, 
        [v1.Ref] = v13.ref
    };
    return v1.createElement(l_Component_0, l_joinDeep_0({
        AbsoluteSize = l_state_0.absoluteSize, 
        WrapperProps = v18
    }, l_ComponentProps_0));
end;
return function(v19) --[[ Line: 79 ]] --[[ Name: withAbsoluteSize ]]
    -- upvalues: v1 (copy), v5 (copy)
    return function(v20) --[[ Line: 80 ]]
        -- upvalues: v1 (ref), v5 (ref), v19 (copy)
        return v1.createElement(v5, {
            Component = v19, 
            ComponentProps = v20
        });
    end;
end;