return function(v0) --[[ Line: 1 ]] --[[ Name: isLayeredClothing ]]
    if v0 and typeof(v0) == "Instance" and v0:IsA("Accessory") then
        local l_Handle_0 = v0:FindFirstChild("Handle");
        if l_Handle_0 and l_Handle_0:IsA("MeshPart") and l_Handle_0:FindFirstChildOfClass("WrapLayer") then
            return true;
        end;
    end;
    return false;
end;