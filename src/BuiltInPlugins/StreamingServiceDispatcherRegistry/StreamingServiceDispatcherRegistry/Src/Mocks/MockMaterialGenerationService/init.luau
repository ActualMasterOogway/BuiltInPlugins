local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = {};
    setmetatable(v1, v0);
    return v1;
end;
v0.GenerateMaterialVariantsAsync = function(_, _, v4) --[[ Line: 12 ]] --[[ Name: GenerateMaterialVariantsAsync ]]
    local v5 = table.create(v4);
    for _ = 1, v4 do
        table.insert(v5, Instance.new("MaterialVariant"));
    end;
    return {
        materialVariants = v5, 
        generationId = "mockGenerationId"
    };
end;
v0.DEPRECATED_GenerateMaterialVariantsAync = function(_, _, v9) --[[ Line: 26 ]] --[[ Name: DEPRECATED_GenerateMaterialVariantsAync ]]
    local v10 = table.create(v9);
    for _ = 1, v9 do
        table.insert(v10, Instance.new("MaterialVariant"));
    end;
    return v10;
end;
v0.UploadMaterialVariantsAsync = function(_, _) --[[ Line: 37 ]] --[[ Name: UploadMaterialVariantsAsync ]]
    return nil;
end;
return v0;