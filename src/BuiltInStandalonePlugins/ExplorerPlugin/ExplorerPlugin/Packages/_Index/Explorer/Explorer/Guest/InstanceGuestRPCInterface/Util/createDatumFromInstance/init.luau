local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.getInstanceId);
return function(v4, v5) --[[ Line: 7 ]] --[[ Name: createDatumFromInstance ]]
    -- upvalues: v3 (copy)
    local v6 = v3(v4, v5);
    local v7 = v5.Parent and v3(v4, v5.Parent);
    return {
        id = v6, 
        name = v5.Name, 
        className = v5.ClassName, 
        parentId = v7, 
        hasChildren = #v5:GetChildren() > 0, 
        fieldValues = nil
    };
end;