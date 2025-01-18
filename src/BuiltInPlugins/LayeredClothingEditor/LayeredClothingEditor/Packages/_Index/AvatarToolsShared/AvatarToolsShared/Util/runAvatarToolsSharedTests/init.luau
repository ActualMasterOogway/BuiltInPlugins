local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_filter_0 = require(l_Parent_1.Dash).filter;
return function(v3, ...) --[[ Line: 6 ]] --[[ Name: runTests ]]
    -- upvalues: l_filter_0 (copy), l_Parent_0 (copy)
    return v3.TestBootstrap:run(l_filter_0(l_Parent_0:GetChildren(), function(v4) --[[ Line: 9 ]]
        return v4.Name ~= "packages";
    end), ...);
end;