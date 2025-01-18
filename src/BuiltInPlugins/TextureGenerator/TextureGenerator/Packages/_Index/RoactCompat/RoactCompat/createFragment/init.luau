local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.warnOnce);
return function(v3) --[[ Line: 21 ]]
    -- upvalues: v2 (copy), v1 (copy)
    if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
        v2("createFragment", "Please instead use:\n\tReact.createElement(React.Fragment, ...)");
    end;
    return v1.createElement(v1.Fragment, nil, v3);
end;