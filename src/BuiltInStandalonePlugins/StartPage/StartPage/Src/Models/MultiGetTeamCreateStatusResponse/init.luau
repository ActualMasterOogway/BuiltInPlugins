local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageTeamCreateStatus)();
local v2 = require(l_script_FirstAncestor_0.Src.Models.TeamCreateStatus);
return {
    validate = function(v3) --[[ Line: 12 ]] --[[ Name: validate ]]
        -- upvalues: v1 (copy), v2 (copy)
        assert(v1, "Only use Team Create Status with FFlagLuaStartPageTeamCreateStatus on");
        if typeof(v3) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v3))));
        else
            local l_teamCreateStatusByGame_0 = v3.teamCreateStatusByGame;
            if l_teamCreateStatusByGame_0 then
                if typeof(l_teamCreateStatusByGame_0) ~= "table" then
                    return (("\"teamCreateStatusByGame\" > Expected table, got %*"):format((typeof(l_teamCreateStatusByGame_0))));
                else
                    for v5, v6 in l_teamCreateStatusByGame_0 do
                        local v7 = v2.validate(v6);
                        if v7 then
                            return (("\"teamCreateStatusByGame\" > [%*] > %*"):format(v5, v7));
                        end;
                    end;
                end;
            end;
            return nil;
        end;
    end
};