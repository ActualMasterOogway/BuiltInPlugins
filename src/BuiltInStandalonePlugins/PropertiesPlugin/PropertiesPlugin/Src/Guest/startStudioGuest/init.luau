local l_script_FirstAncestor_0 = script:FindFirstAncestor("PropertiesPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Properties);
local v2 = require(l_script_FirstAncestor_0.Src.Guest.createStudioGuestConnection);
return function(v3) --[[ Line: 6 ]] --[[ Name: startStudioGuest ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4, v5 = v2(v3);
    local v6 = v1.Guest.startGuest({
        guestConnectionObservable = v4
    });
    v3.Unloading:Connect(function() --[[ Line: 12 ]]
        -- upvalues: v6 (copy), v5 (copy)
        v6();
        v5();
    end);
end;