local l_Parent_0 = script.Parent.Parent;
local l_filter_0 = require(l_Parent_0.Parent.Dash).filter;
return function(v2, ...) --[[ Line: 14 ]] --[[ Name: runFrameworkTests ]]
    -- upvalues: l_filter_0 (copy), l_Parent_0 (copy)
    return v2.TestBootstrap:run(l_filter_0(l_Parent_0:GetChildren(), function(v3) --[[ Line: 17 ]]
        return v3.Name ~= "packages";
    end), ...);
end;