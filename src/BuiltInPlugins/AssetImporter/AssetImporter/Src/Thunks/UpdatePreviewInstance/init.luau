local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetPreviewInstance);
local function v5(v2) --[[ Line: 9 ]] --[[ Name: cleanUpPreviewInstance ]]
    for _, v4 in (v2:GetDescendants()) do
        if v4:IsA("KeyframeSequence") then
            v4:Destroy();
        end;
    end;
end;
return function(v6) --[[ Line: 18 ]]
    -- upvalues: v5 (copy), v1 (copy)
    return function(v7) --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v5 (ref), v1 (ref)
        if v6 then
            local v8 = v6:Clone();
            if v8:IsA("KeyframeSequence") then
                local l_Preview_0 = v7:getState().Preview.assetImportSession:GetImportTree():GetPreview();
                v5(l_Preview_0);
                local l_WorldModel_0 = Instance.new("WorldModel");
                v8.Parent = l_Preview_0;
                l_Preview_0.Parent = l_WorldModel_0;
                v8 = l_WorldModel_0;
            end;
            v7:dispatch(v1(v8));
            return;
        else
            v7:dispatch(v1(nil));
            return;
        end;
    end;
end;