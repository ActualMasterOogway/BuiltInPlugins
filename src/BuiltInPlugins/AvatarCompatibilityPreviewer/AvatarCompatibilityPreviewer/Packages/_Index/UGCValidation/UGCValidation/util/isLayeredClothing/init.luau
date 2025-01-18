local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateRigidMeshPartAccessories);
return function(v2) --[[ Line: 6 ]] --[[ Name: isLayeredClothing ]]
    -- upvalues: v1 (copy)
    if v1() then
        return v2:FindFirstChildWhichIsA("WrapLayer", true);
    else
        if v2 and typeof(v2) == "Instance" and v2:IsA("Accessory") then
            local l_Handle_0 = v2:FindFirstChild("Handle");
            if l_Handle_0 and l_Handle_0:IsA("MeshPart") and l_Handle_0:FindFirstChildOfClass("WrapLayer") then
                return true;
            end;
        end;
        return false;
    end;
end;