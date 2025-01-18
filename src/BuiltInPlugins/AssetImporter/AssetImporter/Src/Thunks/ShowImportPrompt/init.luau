local l_AssetImportService_0 = game:GetService("AssetImportService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.ResetState);
local v4 = require(l_Actions_0.SetAssetImportSession);
local v5 = require(l_Actions_0.SetFilename);
local v6 = require(l_Actions_0.SetImportTree);
local v7 = require(l_Actions_0.SetParsing);
local v8 = require(l_Actions_0.SetProgress);
local v9 = require(l_Actions_0.SetProgressGoal);
local v10 = require(l_Actions_0.SetSelectedImportItem);
local v11 = require(l_Actions_0.SetShowProgress);
local v12 = require(l_Actions_0.SetShowParsingWidget);
local v13 = require(l_Actions_0.SetShowError);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v15 = require(l_Thunks_0.CreateQueuedSession);
local v16 = require(l_Thunks_0.LoadManagedGroups);
local v17 = require(l_Thunks_0.UpdateChecked);
local v18 = require(l_Thunks_0.UpdatePreviewInstance);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableImportQueueModal);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportStartSessionAsync);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportParseDialog);
return function(v23) --[[ Line: 33 ]]
    -- upvalues: v19 (copy), v7 (copy), v20 (copy), l_AssetImportService_0 (copy), v8 (copy), v9 (copy), v11 (copy), v12 (copy), v21 (copy), v13 (copy), v15 (copy), v22 (copy), v3 (copy), v18 (copy), v6 (copy), v5 (copy), v10 (copy), v17 (copy), v16 (copy), v4 (copy)
    return function(v24) --[[ Line: 34 ]]
        -- upvalues: v19 (ref), v7 (ref), v20 (ref), l_AssetImportService_0 (ref), v23 (copy), v8 (ref), v9 (ref), v11 (ref), v12 (ref), v21 (ref), v13 (ref), v15 (ref), v22 (ref), v3 (ref), v18 (ref), v6 (ref), v5 (ref), v10 (ref), v17 (ref), v16 (ref), v4 (ref)
        if v19() then
            v24:dispatch(v7(true));
            local v25 = {};
            if v20() then
                v25 = l_AssetImportService_0:PickMultipleFilesWithPrompt();
            else
                local v26 = l_AssetImportService_0:PickMeshFileWithPrompt();
                if v26 and v26 ~= "" then
                    table.insert(v25, v26);
                end;
            end;
            if #v25 == 0 then
                v23(v25);
                v24:dispatch(v7(false));
                return;
            else
                v24:dispatch(v8(0));
                v24:dispatch(v9(#v25));
                v24:dispatch(v11(true));
                if not v20() then
                    v24:dispatch(v12(true));
                end;
                for v27, v28 in v25 do
                    local v29 = nil;
                    v29 = if v21() then l_AssetImportService_0:StartSessionWithPathAsync(v28) else l_AssetImportService_0:StartSessionWithPath(v28);
                    if not v20() and (not v29 or v29:GetImportTree() == nil) then
                        v24:dispatch(v13(true));
                    end;
                    v24:dispatch(v15(v28, v29));
                    v24:dispatch(v8(v27));
                end;
                if not v20() then
                    v24:dispatch(v12(false));
                end;
                v24:dispatch(v11(false));
                v24:dispatch(v7(false));
                if v23 then
                    v23(v25);
                    return;
                end;
            end;
        else
            local v30 = nil;
            local v31 = nil;
            local v32 = nil;
            if v21() then
                v32 = l_AssetImportService_0:PickMeshFileWithPrompt();
                if v22() and v32 and v32 ~= "" then
                    v24:dispatch(v12(true));
                    v30 = l_AssetImportService_0:StartSessionWithPathAsync(v32);
                    v24:dispatch(v12(false));
                elseif v32 and v32 ~= "" then
                    v30 = l_AssetImportService_0:StartSessionWithPathAsync(v32);
                end;
                if v30 then
                    v31 = v30:GetImportTree();
                end;
            else
                v30 = l_AssetImportService_0:StartSessionWithPrompt();
                if v30 then
                    v31 = v30:GetImportTree();
                    v32 = v30:GetFilename();
                end;
            end;
            if v31 and v32 then
                local l_v31_Preview_0 = v31:GetPreview();
                local v34 = {};
                for _, v36 in v31:GetDescendants() do
                    v34[v36] = v36.ShouldImport;
                end;
                v34[v31] = true;
                v24:dispatch(v3());
                v24:dispatch(v18(l_v31_Preview_0));
                v24:dispatch(v6(v31));
                v24:dispatch(v5(v32));
                v24:dispatch(v10(v31));
                v24:dispatch(v17(v34));
                v24:dispatch(v16());
            end;
            v24:dispatch(v4(v30));
            if v23 then
                local v37 = false;
                if v31 ~= nil then
                    v37 = v32 ~= nil;
                end;
                local v38 = v30 == nil;
                v23(v37, v38);
            end;
        end;
    end;
end;