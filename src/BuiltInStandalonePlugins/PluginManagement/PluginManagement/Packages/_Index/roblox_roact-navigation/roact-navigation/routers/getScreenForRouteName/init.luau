local v0 = require(script.Parent.Parent.utils.validate);
local v1 = require(script.Parent.Parent.utils.isValidScreenComponent);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v0 (copy), v1 (copy)
    v0(type(v2) == "table", "routeConfigs must be a table");
    v0(type(v3) == "string", "routeName must be a string");
    local v4 = v2[v3];
    v0(v4 ~= nil, "There is no route defined for key '%s'.", v3);
    if type(v4) == "table" then
        if v4.screen ~= nil then
            v0(v1(v4.screen), "screen param for key '%s' must be a valid Roact component.", v3);
            return v4.screen;
        elseif type(v4.getScreen) == "function" then
            local v5 = v4.getScreen();
            v0(v1(v5), "The getScreen function defined for route '%s' did not return a valid screen or navigator", v3);
            return v5;
        end;
    end;
    v0(v1(v4), "Value for key '%s' must be a route config table or a valid Roact component.", v3);
    return v4;
end;