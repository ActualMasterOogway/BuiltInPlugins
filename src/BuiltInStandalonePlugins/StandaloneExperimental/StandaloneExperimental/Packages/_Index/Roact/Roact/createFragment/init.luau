local v0 = require(script.Parent.ElementKind);
local v1 = require(script.Parent.Type);
return function(v2) --[[ Line: 4 ]] --[[ Name: createFragment ]]
    -- upvalues: v1 (copy), v0 (copy)
    return {
        [v1] = v1.Element, 
        [v0] = v0.Fragment, 
        elements = v2
    };
end;