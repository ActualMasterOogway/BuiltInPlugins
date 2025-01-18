local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.Util.Images);
local v6 = require(l_Parent_0.Core.Util.Immutable);
return function(v7) --[[ Line: 11 ]] --[[ Name: DropShadow ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy), v4 (copy), v2 (copy)
    local v8 = (v3.Dictionary.join or v6.JoinDictionaries)(v7, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = v5.DROP_SHADOW_IMAGE, 
        ImageColor3 = v4.DROP_SHADOW_COLOR, 
        ImageTransparency = v4.DROP_SHADOW_TRANSPARENCY, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v4.DROP_SHADOW_SLICE_CENTER
    });
    return v2.createElement("ImageLabel", v8);
end;