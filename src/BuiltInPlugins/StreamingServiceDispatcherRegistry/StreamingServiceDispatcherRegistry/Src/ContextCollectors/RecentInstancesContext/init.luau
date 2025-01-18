local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local v2 = {};
local v3 = {};
local v4 = {
    Workspace = true, 
    ReplicatedStorage = true, 
    ReplicatedFirst = true, 
    ServerScriptService = true, 
    ServerStorage = true, 
    StarterGui = true, 
    StarterPack = true, 
    StarterPlayer = true, 
    StarterPlayerScripts = true, 
    StarterCharacterScripts = true
};
local v5 = {
    Created = "Created", 
    Selected = "Selected", 
    ScriptAttached = "ScriptAttached"
};
v2.getInstanceTypes = function() --[[ Line: 32 ]] --[[ Name: getInstanceTypes ]]
    -- upvalues: v5 (copy)
    return v5;
end;
v2.registerInstanceV2 = function(v6, v7, v8) --[[ Line: 36 ]] --[[ Name: registerInstanceV2 ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy), v3 (ref), v1 (copy)
    if v4[v6.ClassName] then
        return;
    else
        if v6:IsA("Script") and v8 == v5.Created and v6.Parent then
            v2.registerInstanceV2(v6.Parent, v7, v5.ScriptAttached);
        end;
        v3[v6] = {
            instanceId = v6, 
            className = v6.ClassName, 
            instanceName = v6.Name, 
            assetId = if v6.SourceAssetId > 0 then v6.SourceAssetId else nil, 
            attributes = v1.getInstanceAttributes(v6), 
            instanceType = v8, 
            requestId = v7
        };
        return;
    end;
end;
v2.fetchContextV2 = function() --[[ Line: 59 ]] --[[ Name: fetchContextV2 ]]
    -- upvalues: v3 (ref)
    local v9 = {};
    for _, v11 in pairs(v3) do
        table.insert(v9, v11);
    end;
    return v9;
end;
v2.syncContext = function() --[[ Line: 71 ]] --[[ Name: syncContext ]]
    -- upvalues: v3 (ref)
    for v12, _ in pairs(v3) do
        if v12.Parent == nil then
            v3[v12] = nil;
        end;
    end;
end;
v2.clear = function() --[[ Line: 79 ]] --[[ Name: clear ]]
    -- upvalues: v3 (ref)
    v3 = {};
end;
return v2;