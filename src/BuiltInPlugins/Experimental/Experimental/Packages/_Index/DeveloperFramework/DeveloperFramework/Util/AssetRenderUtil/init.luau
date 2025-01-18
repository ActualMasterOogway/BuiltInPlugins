local l_Parent_0 = script.Parent.Parent;
local v1 = {
    AssetRenderType = require(l_Parent_0.Util.enumerate)("AssetRenderType", {
        "Model", 
        "Image", 
        "Sound", 
        "Script", 
        "Video", 
        "Other"
    })
};
local v2 = {
    BasePart = v1.AssetRenderType.Model, 
    Model = v1.AssetRenderType.Model, 
    BackpackItem = v1.AssetRenderType.Model, 
    Accoutrement = v1.AssetRenderType.Model, 
    Part = v1.AssetRenderType.Model, 
    MeshPart = v1.AssetRenderType.Model, 
    Decal = v1.AssetRenderType.Image, 
    ImageLabel = v1.AssetRenderType.Image, 
    ImageButton = v1.AssetRenderType.Image, 
    Texture = v1.AssetRenderType.Image, 
    Sky = v1.AssetRenderType.Image, 
    Sound = v1.AssetRenderType.Sound, 
    VideoFrame = v1.AssetRenderType.Video, 
    BaseScript = v1.AssetRenderType.Script
};
v1.getRenderType = function(_, v4) --[[ Line: 42 ]] --[[ Name: getRenderType ]]
    -- upvalues: v2 (copy), v1 (copy)
    if not v4 or typeof(v4) ~= "Instance" then
        return nil;
    else
        local v5 = v2[v4.className];
        if v5 then
            return v5;
        else
            return v1.AssetRenderType.Other;
        end;
    end;
end;
return v1;