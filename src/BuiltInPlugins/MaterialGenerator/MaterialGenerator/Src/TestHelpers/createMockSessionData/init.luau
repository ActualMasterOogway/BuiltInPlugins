local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.TestHelpers.createMockMaterialGenerationService);
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    local v2 = v1():StartSession();
    local v3, v4 = v2:GenerateImagesAsync("test", {});
    return v2, v3, v4;
end;