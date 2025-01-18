local v0 = require(script.Parent.Parent.utils.validate);
local v1 = require(script.Parent.Parent.utils.isValidScreenComponent);
return function(v2) --[[ Line: 22 ]]
    -- upvalues: v0 (copy), v1 (copy)
    v0(type(v2) == "table", "routeConfigs must be a table");
    local v3 = false;
    for v4, v5 in pairs(v2) do
        local v6 = true;
        if type(v5) ~= "table" then
            v6 = false;
        end;
        local v7 = v6 and v5 or {};
        local v8 = v6 and v5.screen or v5;
        v0(v1(v8) or type(v7.getScreen) == "function" and v1(v7.getScreen()), "The component for route '%s' must be a Roact Function/Stateful component or table with 'getScreen'." .. "getScreen function must return Roact Function/Stateful component.", v4);
        local l_v0_0 = v0;
        local v10 = true;
        if v7.screen ~= nil then
            v10 = v7.getScreen == nil;
        end;
        l_v0_0(v10, "Route '%s' should provide 'screen' or 'getScreen', but not both.", v4);
        v3 = true;
    end;
    v0(v3, "Please specify at least one route when configuring a navigator.");
    return v2;
end;