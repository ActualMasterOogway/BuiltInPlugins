local v0 = require(script.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.AppNavigationContext);
local v2 = require(script.Parent.Parent.utils.validate);
return function(v3) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    v2(v3 ~= nil, "withNavigation must be passed a render prop");
    return v0.createElement(v1.Consumer, {
        render = v3
    });
end;