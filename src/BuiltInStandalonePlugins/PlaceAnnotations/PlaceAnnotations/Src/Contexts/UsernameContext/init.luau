local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem:extend("UsernameContext");
v1.new = function(_) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {
        playersService = game:GetService("Players"), 
        usernames = {}
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.getUsername = function(v4, v5) --[[ Line: 18 ]] --[[ Name: getUsername ]]
    if not v4.usernames[v5] then
        local v6 = nil;
        local l_status_0, _ = pcall(function() --[[ Line: 21 ]]
            -- upvalues: v6 (ref), v4 (copy), v5 (copy)
            v6 = v4.playersService:GetNameFromUserIdAsync(v5);
        end);
        if l_status_0 then
            v4.usernames[v5] = v6;
            return v6;
        else
            warn("Annotations: Unable to find username for UserId ", v5);
            return nil;
        end;
    else
        return v4.usernames[v5];
    end;
end;
return v1;