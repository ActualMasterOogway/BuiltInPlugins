local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2) --[[ Line: 8 ]] --[[ Name: getItemAccessoryType ]]
    if v2.item.source == "builtin" then
        local v3 = v2.palette.GetBuiltinItemData(v2.item.builtinItem);
        return v3 and v3.accessoryType;
    elseif v2.item.instance:FindFirstChildWhichIsA("WrapLayer", true) == nil then
        return "rigid";
    else
        return "layered";
    end;
end;