local l_MaterialService_0 = game:GetService("MaterialService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local l_MaterialGeneratorHideTempMaterialVariants_0 = game:GetFastFlag("MaterialGeneratorHideTempMaterialVariants");
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorTempMaterialVariantsFix);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.GeneratedMaterialsContext);
local v8 = require(l_Util_0.getAllMaterialVariants);
return function() --[[ Line: 18 ]] --[[ Name: useMaterialVariants ]]
    -- upvalues: v4 (copy), v7 (copy), v8 (copy), v3 (copy), v6 (copy), l_MaterialService_0 (copy), l_MaterialGeneratorHideTempMaterialVariants_0 (copy)
    local v9 = v4.useContext(v7);
    local l_promptGroups_0 = v9.promptGroups;
    local l_getMaterialStatus_0 = v9.getMaterialStatus;
    v4.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v8 (ref), l_promptGroups_0 (copy), v3 (ref), v6 (ref), l_MaterialService_0 (ref), l_getMaterialStatus_0 (copy), l_MaterialGeneratorHideTempMaterialVariants_0 (ref)
        local v12 = v8(l_promptGroups_0);
        local v13 = nil;
        if not v3() and #v12 > 0 then
            local l_MATERIALS_FOLDER_NAME_0 = v6.MATERIALS_FOLDER_NAME;
            v13 = l_MaterialService_0:FindFirstChild(l_MATERIALS_FOLDER_NAME_0, true);
            if not v13 then
                v13 = Instance.new("Folder");
                v13.Archivable = false;
                v13.Parent = l_MaterialService_0;
                v13.Name = l_MATERIALS_FOLDER_NAME_0;
            end;
        end;
        for _, v16 in v12 do
            if l_getMaterialStatus_0(v16) == "Uploaded" then
                v16.Parent = l_MaterialService_0;
                if l_MaterialGeneratorHideTempMaterialVariants_0 then
                    v16.Archivable = true;
                end;
            elseif not v3() then
                v16.Parent = v13 or l_MaterialService_0;
                if l_MaterialGeneratorHideTempMaterialVariants_0 then
                    v16.Archivable = false;
                end;
            end;
        end;
        return function() --[[ Line: 59 ]]
            -- upvalues: v12 (copy), l_getMaterialStatus_0 (ref), v13 (ref)
            for _, v18 in v12 do
                if l_getMaterialStatus_0(v18) ~= "Uploaded" then
                    v18.Parent = nil;
                end;
            end;
            if v13 ~= nil then
                v13:Destroy();
            end;
        end;
    end, {
        l_promptGroups_0, 
        l_getMaterialStatus_0
    });
end;