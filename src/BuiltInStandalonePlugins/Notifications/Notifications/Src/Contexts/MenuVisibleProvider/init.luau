local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(script.Parent.MenuVisibleContext);
return function(v3) --[[ Line: 6 ]] --[[ Name: MenuVisibleProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4, v5 = v1.useState(false);
    local v6 = v1.useMemo(function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v5 (copy)
        return {
            menuVisible = v4, 
            setMenuVisible = v5
        };
    end, {
        v4, 
        v5
    });
    return v1.createElement(v2.Provider, {
        value = v6
    }, v3.children);
end;