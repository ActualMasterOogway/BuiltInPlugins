local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.getAssetThumbnail);
local l_Image_0 = v1.UI.Image;
return function(v5) --[[ Line: 15 ]] --[[ Name: CatalogPreviewBasic ]]
    -- upvalues: v2 (copy), l_Image_0 (copy), v3 (copy)
    return v2.createElement(l_Image_0, {
        Image = v3(v5.Item), 
        Style = {
            Transparency = v5.Transparency
        }, 
        Size = UDim2.fromScale(1, 1)
    });
end;