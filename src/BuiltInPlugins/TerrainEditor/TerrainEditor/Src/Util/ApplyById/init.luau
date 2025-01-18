local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local l_deepJoin_0 = v1.Util.deepJoin;
local v5 = require(l_script_FirstAncestor_0.Packages.Dash);
local function v6(v7, v8, v9) --[[ Line: 31 ]] --[[ Name: ApplyById ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy), l_deepJoin_0 (copy)
    local l_Localization_0 = v7.Localization;
    local v11 = {};
    for v12, v13 in v8 do
        local l_Id_0 = v13.Id;
        if v3() and v13.Children and v9.Data[l_Id_0] then
            v11[v12] = v5.join({
                Hidden = v9.Data[l_Id_0] == nil, 
                Label = l_Localization_0:getText(v9.Category, l_Id_0), 
                Layout = if v13.Schema.Type ~= "Checkbox" and v13.Schema.Type ~= "Number" and v13.Schema.Type ~= "Button" and v7.Tool:getShouldBeCompact() then Enum.FillDirection.Vertical else nil, 
                Value = v9.Data[l_Id_0].Value
            }, v13);
            v11[v12].Children = v6(v7, v13.Children, {
                Category = v9.Category, 
                Data = v9.Data[l_Id_0].Children, 
                Overrides = if v9.Overrides[l_Id_0] then v9.Overrides[l_Id_0].Children else {}
            });
        else
            v11[v12] = v5.join({
                Hidden = v9.Data[l_Id_0] == nil, 
                Label = l_Localization_0:getText(v9.Category, l_Id_0), 
                Layout = if v13.Schema.Type ~= "Checkbox" and v13.Schema.Type ~= "Number" and v13.Schema.Type ~= "Button" and v7.Tool:getShouldBeCompact() then Enum.FillDirection.Vertical else nil, 
                Value = v9.Data[l_Id_0]
            }, v13);
        end;
        if v9.Overrides[l_Id_0] then
            v11[v12] = l_deepJoin_0(v11[v12], v9.Overrides[l_Id_0]);
            if v9.Overrides[l_Id_0].Schema then
                v11[v12].Schema = v5.join(v11[v12].Schema, v9.Overrides[l_Id_0].Schema);
            end;
        end;
        if v11[v12].Validate then
            local v15 = v7.Tool:getValidateFunction(v9.Category, l_Id_0);
            if v15 then
                v11[v12].Validate = v15;
            else
                local l_Validate_0 = v11[v12].Validate;
                local function v20(v17) --[[ Line: 87 ]] --[[ Name: Validate ]]
                    -- upvalues: l_Validate_0 (copy), v7 (copy), v9 (copy), l_Id_0 (copy)
                    local v18, v19 = l_Validate_0(v17);
                    if v18 == Enum.PropertyStatus.Error then
                        v7.Tool:reportError(v9.Category, l_Id_0, v17);
                        return v18, v19;
                    else
                        v7.Tool:clearError(v9.Category, l_Id_0);
                        return v18, v19;
                    end;
                end;
                v7.Tool:setValidateFunction(v9.Category, l_Id_0, v20);
                v11[v12].Validate = v20;
            end;
        end;
    end;
    return v11;
end;
return v6;