local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorFixNilIndexBug);
local v2 = {
    TouchTransmitter = true
};
local function v3(v4) --[[ Line: 9 ]] --[[ Name: cloneIgnoreArchivable ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    assert(v1(), "This function should only be called when FFlagTextureGeneratorFixNilIndexBug is enabled");
    if v2[v4.ClassName] then
        return nil;
    else
        local v5 = Instance.fromExisting(v4);
        v5.Archivable = true;
        for _, v7 in v4:GetChildren() do
            local v8 = v3(v7);
            if v8 then
                v8.Parent = v5;
            end;
        end;
        return v5;
    end;
end;
return v3;