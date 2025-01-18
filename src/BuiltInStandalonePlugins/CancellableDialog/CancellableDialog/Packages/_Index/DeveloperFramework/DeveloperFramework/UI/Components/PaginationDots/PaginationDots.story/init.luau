local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.PaginationDots);
local v3 = v1.PureComponent:extend("ControlledDots");
v3.init = function(v4) --[[ Line: 6 ]] --[[ Name: init ]]
    v4.state = {
        page = 1
    };
    v4.select = function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (copy)
        v4:setState({
            page = v5
        });
    end;
end;
v3.render = function(v6) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_state_0 = v6.state;
    return v1.createElement(v2, {
        Count = 5, 
        ShowArrows = true, 
        SelectedIndex = l_state_0.page, 
        OnSelected = v6.select
    });
end;
return {
    stories = {
        {
            name = "PaginationDots", 
            story = v1.createElement(v3)
        }
    }
};