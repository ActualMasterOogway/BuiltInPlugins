local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_createElement_0 = v1.createElement;
local v3 = {
    default = true, 
    activeViewIdentifier = nil
};
local v4 = v1.createContext(v3);
return {
    Context = v4, 
    Provider = function(v5) --[[ Line: 23 ]] --[[ Name: Provider ]]
        -- upvalues: l_createElement_0 (copy), v4 (copy)
        assert(v5.default == nil, "default is used for testing if something is stubbed, do not specify it");
        return l_createElement_0(v4.Provider, {
            value = v5
        }, v5.children);
    end
};