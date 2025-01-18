local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_createElement_0 = v1.createElement;
return function(v3) --[[ Line: 9 ]] --[[ Name: ProviderOrDefault ]]
    -- upvalues: v1 (copy), l_createElement_0 (copy)
    if not v1.useContext(v3.context).default then
        return v3.children;
    else
        return l_createElement_0(v3.defaultProvider, {}, v3.children);
    end;
end;