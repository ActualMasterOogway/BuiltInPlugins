local l_Flags_0 = script.Parent.Parent.Parent.Src.Flags;
local v1 = require(l_Flags_0.FFlagEnableBulkFaceImporter);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return game:GetService("StudioService"):HasInternalPermission() and v1();
end;