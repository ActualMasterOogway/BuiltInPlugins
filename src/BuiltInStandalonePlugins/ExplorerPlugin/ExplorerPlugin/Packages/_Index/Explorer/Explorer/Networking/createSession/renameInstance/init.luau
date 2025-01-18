local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
return function(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: renameInstance ]]
    local v6 = v3.rootState.instanceIdsToNodes[v4];
    assert(v6 ~= nil, "Renaming instance we don't know about");
    v5 = v5:sub(1, 100);
    v6.datum = table.clone(v6.datum);
    v6.datum.name = v5;
    table.freeze(v6.datum);
    v3.rootState.fireRootChanged();
    v3.guestRpcInterface.renameInstance(v4, v5);
end;