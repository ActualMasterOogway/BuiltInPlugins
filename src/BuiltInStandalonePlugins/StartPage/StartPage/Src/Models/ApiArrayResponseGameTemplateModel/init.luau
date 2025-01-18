local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.Models.GameTemplateModel);
return {
    validate = function(v2) --[[ Line: 10 ]] --[[ Name: validate ]]
        -- upvalues: v1 (copy)
        if typeof(v2) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v2))));
        else
            local l_data_0 = v2.data;
            if l_data_0 then
                if typeof(l_data_0) ~= "table" then
                    return (("\"data\" > Expected table, got %*"):format((typeof(l_data_0))));
                else
                    for v4, v5 in l_data_0 do
                        local v6 = v1.validate(v5);
                        if v6 then
                            return (("\"data\" > [%*] > %*"):format(v4, v6));
                        end;
                    end;
                end;
            end;
            return nil;
        end;
    end
};