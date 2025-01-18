local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
game:DefineFastFlag("ImportQueueFixGroupFetch3", false);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return game:GetFastFlag("ImportQueueFixGroupFetch3") and v1();
end;