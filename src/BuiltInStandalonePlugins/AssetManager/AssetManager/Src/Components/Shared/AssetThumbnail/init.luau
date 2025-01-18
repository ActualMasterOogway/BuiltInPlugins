local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Networking);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_Image_0 = v2.UI.Image;
local v7 = require(script.styles);
local v8 = require(script.Shimmer);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Images);
return function(v10) --[[ Line: 22 ]] --[[ Name: AssetThumbnail ]]
    -- upvalues: v3 (copy), l_useState_0 (copy), l_useEffect_0 (copy), v1 (copy), l_Image_0 (copy), v9 (copy), v8 (copy), v7 (copy)
    local v11 = v3.use();
    local v12 = v11:getThumbnailForItem(v10.AssetId);
    local v13, v14 = l_useState_0(Enum.AssetFetchStatus.None);
    l_useEffect_0(function() --[[ Line: 28 ]]
        -- upvalues: v11 (copy), v10 (copy), v14 (copy)
        v11:getThumbnailForItemAsync(v10.AssetId, function(_, v16) --[[ Line: 29 ]]
            -- upvalues: v14 (ref)
            v14(v16);
        end);
    end, {
        v10.AssetId
    });
    if v13 == Enum.AssetFetchStatus.Success then
        return v1.createElement(l_Image_0, {
            Image = v12, 
            [v1.Tag] = "X-Fill"
        });
    elseif v13 == Enum.AssetFetchStatus.Failure or v13 == Enum.AssetFetchStatus.TimedOut then
        return v1.createElement(l_Image_0, {
            Image = v9.getImageHelper(v9.AvailableImages.DefaultThumbnail), 
            [v1.Tag] = "X-Fill"
        });
    else
        return v1.createElement(v8.Component, {
            Rotation = v7:GetAttribute("Rotation"), 
            Transparency = v7:GetAttribute("Transparency")
        });
    end;
end;