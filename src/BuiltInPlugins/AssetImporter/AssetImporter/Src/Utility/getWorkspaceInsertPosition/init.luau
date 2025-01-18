local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFIntAssetImportInsertRayMaxDistance);
local v3 = if v1() then v2() else 2048;
return function() --[[ Line: 10 ]]
    -- upvalues: v3 (copy)
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
    local l_LookVector_0 = l_CurrentCamera_0.CFrame.LookVector;
    local v7 = game.Workspace:Raycast(l_Position_0, l_LookVector_0 * v3);
    if v7 == nil then
        return l_LookVector_0 * v3;
    else
        return v7.Position;
    end;
end;