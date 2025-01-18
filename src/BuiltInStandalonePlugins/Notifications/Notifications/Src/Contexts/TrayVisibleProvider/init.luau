local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(script.Parent.TrayVisibleContext);
return function(v3) --[[ Line: 6 ]] --[[ Name: TrayVisibleProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.useMemo(function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        return {
            trayVisible = v3.trayVisible
        };
    end, {
        v3.trayVisible
    });
    return v1.createElement(v2.Provider, {
        value = v4
    }, v3.children);
end;