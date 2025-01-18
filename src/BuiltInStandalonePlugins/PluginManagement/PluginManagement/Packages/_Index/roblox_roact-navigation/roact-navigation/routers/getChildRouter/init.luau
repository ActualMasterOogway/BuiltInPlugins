local v0 = require(script.Parent.Parent.utils.validate);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    v0(type(v1) == "table", "router must be a table");
    v0(type(v2) == "string", "routeName must be a string");
    if v1.childRouters and v1.childRouters[v2] then
        return v1.childRouters[v2];
    else
        v0(type(v1.getComponentForRouteName) == "function", "router.getComponentForRouteName must be a function if no child routers are specified");
        local v3 = v1.getComponentForRouteName(v2);
        if type(v3) == "table" then
            return v3.router;
        else
            return nil;
        end;
    end;
end;