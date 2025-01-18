local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(script.ItemDataPreviewModel);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5) --[[ Line: 17 ]] --[[ Name: ItemDataPreview ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    if v5.ItemData.item.source == v1.SOURCE_BUILTIN then
        return v2.createElement(v5.ItemData.palette.PreviewComponent, {
            Item = v5.ItemData.item.builtinItem, 
            Selected = v5.Selected, 
            Transparency = v5.Transparency
        });
    elseif v5.ItemData.item.source == v1.SOURCE_INSTANCE then
        return v2.createElement(v3, {
            Instance = v5.ItemData.item.instance, 
            Transparency = v5.Transparency
        });
    else
        error((("Unknown item source: %*"):format(v5.ItemData.item.source)));
        return;
    end;
end;