local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestType);
local v2 = require(l_script_FirstAncestor_0.Src.Enums.UIRequestStatus);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return {
    IsDraft = function(v4) --[[ Line: 9 ]] --[[ Name: IsDraft ]]
        -- upvalues: v1 (copy)
        for _, v6 in (v4:GetRequests()) do
            if v6 == v1.Create then
                return true;
            end;
        end;
        return false;
    end, 
    HasRequests = function(v7) --[[ Line: 19 ]] --[[ Name: HasRequests ]]
        for _, _ in (v7:GetRequests()) do
            return true;
        end;
        return false;
    end, 
    HasReplyRequests = function(v10) --[[ Line: 27 ]] --[[ Name: HasReplyRequests ]]
        -- upvalues: v1 (copy)
        local v11 = false;
        for _, v13 in v10:GetChildren() do
            if v13:IsA("Annotation") then
                local v14;
                for _, v16 in (v13:GetRequests()) do
                    if v16 == v1.Create then
                        v14 = true;
                        v11 = true;
                    end;
                    if v11 then
                        break;
                    end;
                end;
                if not v11 then
                    v14 = false;
                end;
                v11 = false;
                if v14 then
                    return true;
                end;
            end;
        end;
        return false;
    end, 
    RequestErrorToUIRequestStatus = function(v17) --[[ Line: 36 ]] --[[ Name: RequestErrorToUIRequestStatus ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v17 == v1.Resolve then
            return v2.ErrorResolving;
        elseif v17 == v1.Delete then
            return v2.ErrorDeleting;
        else
            return v2.Error;
        end;
    end
};