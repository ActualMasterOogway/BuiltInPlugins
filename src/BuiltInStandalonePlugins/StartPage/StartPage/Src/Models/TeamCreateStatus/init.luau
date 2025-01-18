local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageTeamCreateStatus)();
return {
    validate = function(v2) --[[ Line: 10 ]] --[[ Name: validate ]]
        -- upvalues: v1 (copy)
        assert(v1, "Only use Team Create Status with FFlagLuaStartPageTeamCreateStatus on");
        if typeof(v2) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v2))));
        elseif v2.id and typeof(v2.id) ~= "number" then
            return (("\"id\" > Expected number, got %*"):format((typeof(v2.id))));
        elseif v2.isEnabled and typeof(v2.isEnabled) ~= "boolean" then
            return (("\"isEnabled\" > Expected boolean, got %*"):format((typeof(v2.isEnabled))));
        else
            return nil;
        end;
    end
};