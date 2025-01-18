local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Parent.Signal);
local v4 = require(l_script_FirstAncestor_0.Util.createUnimplemented);
local l_createElement_0 = v1.createElement;
local v6 = {
    showContextMenu = v4("showContextMenu"), 
    actionTriggeredSignal = v3.new()
};
local v7 = v1.createContext(v6);
return {
    Context = v7, 
    Provider = function(v8) --[[ Line: 24 ]] --[[ Name: Provider ]]
        -- upvalues: l_createElement_0 (copy), v7 (copy)
        return l_createElement_0(v7.Provider, {
            value = v8
        }, v8.children);
    end
};