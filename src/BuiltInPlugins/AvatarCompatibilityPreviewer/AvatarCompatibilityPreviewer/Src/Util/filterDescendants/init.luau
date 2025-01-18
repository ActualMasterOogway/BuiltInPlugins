local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v2 = {
    "Attachment", 
    "BasePart", 
    "BaseWrap", 
    "DataModelMesh", 
    "FaceControls", 
    "Humanoid", 
    "SurfaceAppearance", 
    "ValueBase"
};
if v1() then
    table.insert(v2, "Animation");
end;
local function v3(v4, v5) --[[ Line: 22 ]] --[[ Name: filterDescendants ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    for _, v7 in v4:GetChildren() do
        local v8 = false;
        if v7:IsA("BasePart") then
            if v5 ~= nil and table.find(v5, v7.Name) ~= nil then
                v8 = true;
            else
                v7:Destroy();
                continue;
            end;
        else
            for _, v10 in v2 do
                if v7:IsA(v10) then
                    v8 = true;
                    break;
                end;
            end;
        end;
        if v1() and v7:IsA("LocalScript") and v7.Name == "Animate" then
            v8 = true;
        end;
        if v8 then
            v3(v7, v5);
        else
            v7:Destroy();
        end;
    end;
end;
return v3;