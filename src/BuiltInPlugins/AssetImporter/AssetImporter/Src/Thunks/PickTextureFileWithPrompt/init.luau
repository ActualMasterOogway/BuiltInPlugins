local l_AssetImportService_0 = game:GetService("AssetImportService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v2 = require(l_script_FirstAncestor_0.Src.Utility.GetErrorChecked);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetErrorNodeChecked);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetTreeChecked);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
return function(v6, v7) --[[ Line: 14 ]]
    -- upvalues: l_AssetImportService_0 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: l_AssetImportService_0 (ref), v6 (copy), v7 (copy), v2 (ref), v3 (ref), v4 (ref), v5 (ref)
        local v9 = l_AssetImportService_0:PickImageFileWithPrompt();
        local v10 = v8:getState();
        if v9 and v9 ~= "" then
            v6[v7] = v9;
            local l_importTree_0 = v10.Preview.importTree;
            local v12 = v2(l_importTree_0);
            v8:dispatch(v3(v12));
            v8:dispatch(v4({
                [v6] = v6.ShouldImport
            }));
            v8:dispatch(v5(v6:GetPreview()));
        end;
    end;
end;