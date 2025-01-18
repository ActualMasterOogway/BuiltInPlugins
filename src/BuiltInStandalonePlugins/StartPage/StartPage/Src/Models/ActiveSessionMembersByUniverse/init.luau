local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.Models.ActiveUserModel);
return {
    validate = function(v2) --[[ Line: 11 ]] --[[ Name: validate ]]
        -- upvalues: v1 (copy)
        if typeof(v2) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v2))));
        elseif v2.id and typeof(v2.id) ~= "number" then
            return (("\"id\" > Expected number, got %*"):format((typeof(v2.id))));
        else
            local l_activeUsers_0 = v2.activeUsers;
            if l_activeUsers_0 then
                if typeof(l_activeUsers_0) ~= "table" then
                    return (("\"activeUsers\" > Expected table, got %*"):format((typeof(l_activeUsers_0))));
                else
                    for v4, v5 in l_activeUsers_0 do
                        local v6 = v1.validate(v5);
                        if v6 then
                            return (("\"activeUsers\" > [%*] > %*"):format(v4, v6));
                        end;
                    end;
                end;
            end;
            return nil;
        end;
    end
};