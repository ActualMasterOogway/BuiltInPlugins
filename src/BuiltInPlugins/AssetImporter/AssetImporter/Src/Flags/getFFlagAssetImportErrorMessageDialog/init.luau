local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportDialogButtonsAndStyling);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return game:GetFastFlag("AssetImportErrorMessageDialog") and v1() and v2();
end;