local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_Reducers_0 = l_script_FirstAncestor_0.Src.Reducers;
local v3 = require(l_Reducers_0.Preview);
local v4 = require(l_Reducers_0.Dialogs);
local v5 = require(l_Reducers_0.Sessions);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
return (v1.combineReducers({
    Preview = v3, 
    Dialogs = v4, 
    Sessions = if v6() then v5 else nil
}));