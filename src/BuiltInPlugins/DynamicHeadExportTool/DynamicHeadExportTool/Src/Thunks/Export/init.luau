local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local l_Workspace_0 = game:GetService("Workspace");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_PublishService_0 = game:GetService("PublishService");
local l_Selection_0 = game:GetService("Selection");
local v5 = require(l_script_FirstAncestor_0.Src.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetScreen);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetOwnershipTransferText);
local v9 = require(l_script_FirstAncestor_0.Src.Util.getOwnershipTransferAssetIds);
return function(v10) --[[ Line: 16 ]]
    -- upvalues: l_Selection_0 (copy), l_PublishService_0 (copy), l_Workspace_0 (copy), v9 (copy), l_CollectionService_0 (copy), v5 (copy), v6 (copy), v8 (copy), v7 (copy)
    return function(v11) --[[ Line: 17 ]]
        -- upvalues: l_Selection_0 (ref), l_PublishService_0 (ref), l_Workspace_0 (ref), v9 (ref), l_CollectionService_0 (ref), v5 (ref), v10 (copy), v6 (ref), v8 (ref), v7 (ref)
        local v12 = l_Selection_0:Get();
        l_PublishService_0:PublishDescendantAssets(l_Workspace_0);
        local v13 = v9();
        for _, v15 in l_CollectionService_0:GetTagged(v5.Tag) do
            l_Selection_0:Set(v15:GetChildren());
            v10:PromptSaveSelection(v15.Name);
        end;
        l_Selection_0:Set(v12);
        v11:dispatch(v6(true));
        v11:dispatch(v8(table.concat(v13, "\n")));
        v11:dispatch(v7(v5.Screens.OwnershipTransfer));
    end;
end;