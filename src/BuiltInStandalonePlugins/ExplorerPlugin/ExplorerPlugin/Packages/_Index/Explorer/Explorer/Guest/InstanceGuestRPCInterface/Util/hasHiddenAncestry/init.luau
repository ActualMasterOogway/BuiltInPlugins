local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: hasHiddenAncestry ]]
    local l_root_0 = v2.root;
    while true do
        local l_Parent_0 = v3.Parent;
        if l_Parent_0 == nil then
            return false;
        elseif l_Parent_0 == l_root_0 then
            if l_root_0:IsA("DataModel") then
                local l_isServiceVisible_0 = v2.isServiceVisible;
                if l_isServiceVisible_0 then
                    return not l_isServiceVisible_0(v3);
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            v3 = l_Parent_0;
        end;
    end;
end;