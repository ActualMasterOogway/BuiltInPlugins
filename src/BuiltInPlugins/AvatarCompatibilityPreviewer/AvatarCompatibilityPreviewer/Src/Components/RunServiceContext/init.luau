local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = {
    isRunning = function() --[[ Line: 13 ]] --[[ Name: isRunning ]]
        -- upvalues: l_RunService_0 (copy)
        return l_RunService_0:IsRunning();
    end
};
return (v2.createContext(v3));