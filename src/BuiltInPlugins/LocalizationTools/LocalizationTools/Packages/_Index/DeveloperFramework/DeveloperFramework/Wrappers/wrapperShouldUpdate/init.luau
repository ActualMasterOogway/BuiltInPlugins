local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local l_shallowEqual_0 = require(l_Parent_0.Parent.Dash).shallowEqual;
return function(v3, v4, v5) --[[ Line: 10 ]] --[[ Name: wrapperShouldUpdate ]]
    -- upvalues: l_shallowEqual_0 (copy)
    local l_props_0 = v3.props;
    local l_state_0 = v3.state;
    local v8 = true;
    if l_props_0.Component == v4.Component then
        v8 = not l_shallowEqual_0(l_state_0, v5) or not l_shallowEqual_0(l_props_0.ComponentProps, v4.ComponentProps);
    end;
    return v8;
end;