local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.createNavigator);
local v2 = require(script.Parent.Parent.routers.StackRouter);
local v3 = require(script.Parent.Parent.views.StackView.StackView);
return function(v4) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v0 (copy)
    local v5 = v2(v4);
    return v1(v3, v5, v0.Dictionary.join(v4, {
        routes = v0.None
    }));
end;