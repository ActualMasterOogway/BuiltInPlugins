local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.Models.UniverseModel);
return {
    validate = function(v2) --[[ Line: 11 ]] --[[ Name: validate ]]
        -- upvalues: v1 (copy)
        if typeof(v2) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v2))));
        elseif v2.gameTemplateType and typeof(v2.gameTemplateType) ~= "string" then
            return (("\"gameTemplateType\" > Expected string, got %*"):format((typeof(v2.gameTemplateType))));
        else
            if v2.universe then
                local v3 = v1.validate(v2.universe);
                if v3 then
                    return (("\"universe\" > %*"):format(v3));
                end;
            end;
            return nil;
        end;
    end
};