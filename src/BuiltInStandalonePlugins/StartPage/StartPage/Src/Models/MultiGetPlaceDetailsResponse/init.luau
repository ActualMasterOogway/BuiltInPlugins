local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.Models.PlaceDetailsModel);
return {
    validate = function(v2) --[[ Line: 8 ]] --[[ Name: validate ]]
        -- upvalues: v1 (copy)
        if typeof(v2) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v2))));
        else
            for v3, v4 in ipairs(v2) do
                local v5 = v1.validate(v4);
                if v5 then
                    return (("[%*] > %*"):format(v3, v5));
                end;
            end;
            return nil;
        end;
    end
};