return {
    getConstraintCounterpart = function(v0, v1) --[[ Line: 3 ]] --[[ Name: getConstraintCounterpart ]]
        local l_Attachment0_0 = v0.Attachment0;
        if l_Attachment0_0 then
            local l_Parent_0 = l_Attachment0_0.Parent;
            if l_Parent_0 == v1 then
                local l_Attachment1_0 = v0.Attachment1;
                return l_Attachment1_0 and l_Attachment1_0.Parent;
            else
                return l_Parent_0;
            end;
        else
            local l_Attachment1_1 = v0.Attachment1;
            return l_Attachment1_1 and l_Attachment1_1.Parent;
        end;
    end, 
    getJointInstanceCounterpart = function(v6, v7) --[[ Line: 22 ]] --[[ Name: getJointInstanceCounterpart ]]
        local l_Part0_0 = v6.Part0;
        if l_Part0_0 == v7 then
            return v6.Part1;
        else
            return l_Part0_0;
        end;
    end, 
    getWeldConstraintCounterpart = function(v9, v10) --[[ Line: 31 ]] --[[ Name: getWeldConstraintCounterpart ]]
        local l_Part0_1 = v9.Part0;
        if l_Part0_1 == v10 then
            return v9.Part1;
        else
            return l_Part0_1;
        end;
    end, 
    getNoCollisionConstraintCounterpart = function(v12, v13) --[[ Line: 40 ]] --[[ Name: getNoCollisionConstraintCounterpart ]]
        local l_Part0_2 = v12.Part0;
        if l_Part0_2 == v13 then
            return v12.Part1;
        else
            return l_Part0_2;
        end;
    end
};