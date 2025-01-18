local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.PageNavigation);
local v3 = v1.PureComponent:extend("ControlledNav");
v3.init = function(v4) --[[ Line: 7 ]] --[[ Name: init ]]
    v4.state = {
        PageIndex = 1
    };
    v4.onPageChange = function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (copy)
        v4:setState({
            PageIndex = v5
        });
    end;
end;
v3.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_state_0 = v6.state;
    return v1.createElement(v2, {
        PageIndex = l_state_0.PageIndex, 
        PageCount = 5, 
        OnPageChange = v6.onPageChange
    });
end;
return v1.createElement(v3);