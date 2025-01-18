local l_UGCAvatarService_0 = game:GetService("UGCAvatarService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
return (require(l_script_FirstAncestor_0.Packages.React).createContext(l_UGCAvatarService_0));