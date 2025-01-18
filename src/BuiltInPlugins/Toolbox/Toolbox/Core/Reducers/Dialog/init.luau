local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v5 = require(l_Actions_0.DequeueSubsequentDialog);
local v6 = require(l_Actions_0.EnqueueSubsequentDialog);
return v3.createReducer({
    subsequentDialogQueue = {}
}, {
    [v6.name] = function(v7, v8) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        local l_assetData_0 = v8.assetData;
        local l_status_0 = v8.status;
        local v11 = v2.List.join(v7.subsequentDialogQueue, {
            {
                assetData = l_assetData_0, 
                status = l_status_0
            }
        });
        return v2.Dictionary.join(v7, {
            subsequentDialogQueue = v11
        });
    end, 
    [v5.name] = function(v12, _) --[[ Line: 34 ]]
        -- upvalues: v2 (copy)
        local v14 = v2.List.removeValue(v12.subsequentDialogQueue, v12.subsequentDialogQueue[1]);
        return v2.Dictionary.join(v12, {
            subsequentDialogQueue = v14
        });
    end
});