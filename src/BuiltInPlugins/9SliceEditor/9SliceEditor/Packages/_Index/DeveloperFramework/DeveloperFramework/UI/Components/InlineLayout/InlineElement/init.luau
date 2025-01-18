local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v2.join;
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v7 = setmetatable({}, v4);
    v7.props = v6;
    v7.Element = v5;
    return v7;
end;
v4.getWidth = function(v8) --[[ Line: 36 ]] --[[ Name: getWidth ]]
    return v8.props.Size.Width.Offset;
end;
v4.split = function(v9) --[[ Line: 40 ]] --[[ Name: split ]]
    -- upvalues: v4 (copy), l_join_0 (copy)
    return v4.new(v9.Element, l_join_0(v9.props));
end;
v4.render = function(v10, v11) --[[ Line: 44 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v10.Element, v2.assign(v10.props, {
        id = v11
    }));
end;
return v4;