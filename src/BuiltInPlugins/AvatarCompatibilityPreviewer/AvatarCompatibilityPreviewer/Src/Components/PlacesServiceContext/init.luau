local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
    return game:GetService("PlacesService");
end);
local v4 = {
    startPlaySolo = function() --[[ Line: 16 ]] --[[ Name: startPlaySolo ]]
        -- upvalues: l_status_0 (copy), l_result_0 (copy)
        if l_status_0 then
            l_result_0:StartPlaySolo();
            return;
        else
            error("Calling startPlaySolo on unmocked PlacesService");
            return;
        end;
    end, 
    stopPlaySolo = function() --[[ Line: 24 ]] --[[ Name: stopPlaySolo ]]
        -- upvalues: l_status_0 (copy), l_result_0 (copy)
        if l_status_0 then
            l_result_0:StopPlaySolo();
            return;
        else
            error("Calling stopPlaySolo on unmocked PlacesService");
            return;
        end;
    end
};
return (v1.createContext(v4));