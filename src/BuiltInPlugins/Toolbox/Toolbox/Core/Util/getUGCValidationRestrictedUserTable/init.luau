local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Core.Types.UGCValidationTypes);
return function() --[[ Line: 9 ]] --[[ Name: getUGCValidationRestrictedUserTable ]]
    -- upvalues: l_StudioService_0 (copy)
    return {
        {
            creatorType = "User", 
            id = l_StudioService_0:GetUserId()
        }
    };
end;