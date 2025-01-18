local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local _ = require(l_script_FirstAncestor_0.Networking.NetworkingTypes);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Util.createUnimplemented);
local l_createElement_0 = v2.createElement;
local v5 = {
    default = true, 
    registerOnConnect = v3("registerOnConnect")
};
local v6 = v2.createContext(v5);
return {
    Context = v6, 
    Provider = function(v7) --[[ Line: 26 ]] --[[ Name: Provider ]]
        -- upvalues: l_createElement_0 (copy), v6 (copy)
        assert(v7.default == nil, "default is used for testing if something is stubbed, do not specify it");
        return l_createElement_0(v6.Provider, {
            value = v7
        }, v7.children);
    end
};