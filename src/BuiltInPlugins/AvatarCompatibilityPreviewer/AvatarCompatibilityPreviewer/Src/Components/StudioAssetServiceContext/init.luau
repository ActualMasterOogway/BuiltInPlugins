local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
    return game:GetService("StudioAssetService");
end);
local v4 = {
    showSaveToRoblox = function(...) --[[ Line: 16 ]] --[[ Name: showSaveToRoblox ]]
        -- upvalues: l_status_0 (copy), l_result_0 (copy)
        if l_status_0 then
            l_result_0:ShowSaveToRoblox(...);
            return;
        else
            error("Calling showSaveToRoblox on unmocked StudioAssetService");
            return;
        end;
    end, 
    onUGCSubmitCompleted = if l_status_0 then l_result_0.OnUGCSubmitCompleted else nil
};
return (v1.createContext(v4));