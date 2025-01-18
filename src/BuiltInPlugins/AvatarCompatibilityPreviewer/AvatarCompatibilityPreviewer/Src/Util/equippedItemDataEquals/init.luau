local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCheckFaceItems);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: equippedItemDataEquals ]]
    -- upvalues: v3 (copy), v1 (copy)
    if v3() then
        if v4.palette.Key ~= v5.palette.Key then
            return false;
        end;
    elseif v4.palette ~= v5.palette then
        return false;
    end;
    if v4.item.source ~= v5.item.source then
        return false;
    elseif v4.item.source == v1.SOURCE_BUILTIN and v5.item.source == v1.SOURCE_BUILTIN then
        return v4.item.builtinItem == v5.item.builtinItem;
    elseif v4.item.source == v1.SOURCE_INSTANCE and v5.item.source == v1.SOURCE_INSTANCE then
        return v4.item.instance == v5.item.instance;
    else
        error((("Unknown item source: %*"):format(v4.item.source)));
        return;
    end;
end;