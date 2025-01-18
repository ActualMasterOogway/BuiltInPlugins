local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.ExpandablePane);
local v3 = require(l_Parent_0.Util.Typecheck);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v5 = v1.PureComponent:extend("SimpleExpandablePane");
v3.wrap(v5, script);
v5.init = function(v6, v7) --[[ Line: 49 ]] --[[ Name: init ]]
    v6.state = {
        expanded = v7.Expanded
    };
    v6.expandedChanged = function() --[[ Line: 54 ]]
        -- upvalues: v6 (copy)
        v6:setState(function(v8) --[[ Line: 55 ]]
            return {
                expanded = not v8.expanded
            };
        end);
    end;
end;
v5.render = function(v9) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), l_join_0 (copy)
    return v1.createElement(v2, l_join_0(v9.props, {
        Expanded = v9.state.expanded, 
        OnExpandedChanged = v9.expandedChanged
    }));
end;
return v5;