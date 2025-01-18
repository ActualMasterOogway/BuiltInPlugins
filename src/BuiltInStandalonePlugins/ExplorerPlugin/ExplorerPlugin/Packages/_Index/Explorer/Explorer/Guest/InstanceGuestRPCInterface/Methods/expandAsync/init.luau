local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.createDatumFromInstance);
local v5 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v6 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.getInstanceId);
local v7 = require(l_script_FirstAncestor_0.Util.profile);
local v8 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.startTrackingInstance);
local v9 = v5("expandAsync");
local function v10(v11, v12) --[[ Line: 14 ]] --[[ Name: expandAsync ]]
    -- upvalues: v9 (copy), v1 (copy), v10 (copy), v6 (copy), v4 (copy), v8 (copy)
    v9("Expanding %*", v12);
    assert(typeof(v12) == "string", "Instance ID is not a string");
    local v13 = v11.instanceIdsToInstance[v12];
    assert(v13 ~= nil, "Host asking to expand instance we haven't seen yet");
    if v11.expandedInstances[v13] then
        v9("%* already expanded", v13);
        return {};
    else
        local v14 = v12 == v1.rootId;
        local v15 = if not not v14 or v13.Parent == nil then {} else v10(v11, v6(v11, v13.Parent));
        v11.expandedInstances[v13] = true;
        if v14 and v13:IsA("DataModel") and v11.isServiceVisible then
            for _, v17 in v13:GetChildren() do
                if v11.isServiceVisible(v17) then
                    table.insert(v15, v4(v11, v17));
                    if v11.watchingInstanceConnections[v17] == nil then
                        v8(v11, v17);
                    end;
                end;
            end;
            return v15;
        else
            for _, v19 in v13:GetChildren() do
                table.insert(v15, v4(v11, v19));
                if v11.watchingInstanceConnections[v19] == nil then
                    v8(v11, v19);
                end;
            end;
            return v15;
        end;
    end;
end;
return v7(v10);