local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetAvatarType);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 5 ]]
        -- upvalues: v2 (copy), v1 (ref)
        task.spawn(function() --[[ Line: 6 ]]
            -- upvalues: v2 (ref), v3 (copy), v1 (ref)
            while true do
                local v4 = v2:getAvatarType(game);
                v3:dispatch(v1(v4));
                wait(5);
            end;
        end);
    end;
end;