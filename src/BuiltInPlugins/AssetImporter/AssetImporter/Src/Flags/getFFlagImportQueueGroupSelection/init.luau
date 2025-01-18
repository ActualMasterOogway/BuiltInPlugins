local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
game:DefineFastFlag("ImportQueueGroupSelection_DEV", false);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return game:GetFastFlag("ImportQueueGroupSelection_DEV") and v1();
end;