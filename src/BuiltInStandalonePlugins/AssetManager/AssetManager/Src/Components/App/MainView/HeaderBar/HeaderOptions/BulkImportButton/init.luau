local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local v3 = require(l_script_FirstAncestor_0.Src.Components.Shared.MinimalButton);
local v4 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useGameInfo);
return function(v6) --[[ Line: 22 ]] --[[ Name: BulkImportButton ]]
    -- upvalues: l_Localization_0 (copy), v4 (copy), v5 (copy), v1 (copy), v3 (copy)
    local v7 = l_Localization_0.use();
    local v8 = v4.use();
    local v9 = v5(v8).Id ~= 0;
    local v10 = v9 and "" or "Disabled";
    local v11 = if v9 then v7:getText("Tooltip", "BulkImport") else v7:getText("Tooltip", "BulkImportDisabled");
    return v1.createElement(v3, {
        LayoutOrder = v6.LayoutOrder, 
        OnClick = function() --[[ Line: 34 ]] --[[ Name: OnClick ]]
            -- upvalues: v9 (copy), v8 (copy)
            if v9 then
                v8:launchBulkImport();
            end;
        end, 
        Tooltip = v11, 
        [v1.Tag] = ("ImportIcon %*"):format(v10)
    });
end;