isMaterialVariantByIdentifier = function(v0) --[[ Line: 1 ]] --[[ Name: isMaterialVariantByIdentifier ]]
    return #string.split(v0, "__") == 2;
end;
return isMaterialVariantByIdentifier;