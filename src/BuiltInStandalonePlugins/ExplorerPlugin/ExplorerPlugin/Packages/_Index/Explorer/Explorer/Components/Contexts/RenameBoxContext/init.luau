local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.createUnimplemented);
local l_createElement_0 = v1.createElement;
local v5 = {
    renameBoxActiveFor = nil, 
    setRenameBoxActiveFor = v3("setRenameBoxActiveFor")
};
local v6 = v1.createContext(v5);
return {
    Context = v6, 
    Provider = function(v7) --[[ Line: 21 ]] --[[ Name: Provider ]]
        -- upvalues: v1 (copy), l_createElement_0 (copy), v6 (copy)
        local v8, v9 = v1.useState(nil);
        local v10 = {
            renameBoxActiveFor = v8, 
            setRenameBoxActiveFor = v9
        };
        return l_createElement_0(v6.Provider, {
            value = v10
        }, v7.children);
    end
};