local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 7 ]]
    assert(type(v1) == "boolean", "isUploadFeeEnabled must be a boolean");
    local v4 = true;
    if v2 ~= nil then
        v4 = type(v2) == "number";
    end;
    assert(v4, "uploadFee must be a number or nil");
    v4 = true;
    if v3 ~= nil then
        v4 = type(v3) == "boolean";
    end;
    assert(v4, "canAffordUploadFee must be a boolean or nil");
    return {
        isUploadFeeEnabled = v1, 
        uploadFee = v2, 
        canAffordUploadFee = v3
    };
end);