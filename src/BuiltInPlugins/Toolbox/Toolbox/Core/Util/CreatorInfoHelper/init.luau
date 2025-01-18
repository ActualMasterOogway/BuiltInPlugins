local _ = script.Parent.Parent.Parent;
local v9 = {
    getCreatorTypeValueFromName = function(v1) --[[ Line: 5 ]] --[[ Name: getCreatorTypeValueFromName ]]
        assert(type(v1) == "string");
        for _, v3 in ipairs(Enum.CreatorType:GetEnumItems()) do
            if v3.Name == v1 then
                return v3.Value;
            end;
        end;
        error(("'%s' is not a valid Enum.CreatorType"):format(v1));
    end, 
    isValidCreatorType = function(v4) --[[ Line: 17 ]] --[[ Name: isValidCreatorType ]]
        for _, v6 in ipairs(Enum.CreatorType:GetEnumItems()) do
            if v6.Value == v4 then
                return true;
            end;
        end;
        return false;
    end, 
    backendToClient = function(v7) --[[ Line: 27 ]] --[[ Name: backendToClient ]]
        if v7 == 1 then
            return Enum.CreatorType.User.Value;
        elseif v7 == 2 then
            return Enum.CreatorType.Group.Value;
        else
            error("Unknown backendCreatorType received " .. tostring(v7));
            return;
        end;
    end, 
    clientToBackend = function(v8) --[[ Line: 37 ]] --[[ Name: clientToBackend ]]
        if v8 == Enum.CreatorType.User.Value then
            return 1;
        elseif v8 == Enum.CreatorType.Group.Value then
            return 2;
        else
            error("Unknown creatorType received " .. tostring(v8));
            return;
        end;
    end
};
v9.getNameFromResult = function(v10, v11) --[[ Line: 47 ]] --[[ Name: getNameFromResult ]]
    -- upvalues: v9 (copy)
    assert(v9.isValidCreatorType(v11));
    local l_responseBody_0 = v10.responseBody;
    if v11 == Enum.CreatorType.Group.Value then
        return l_responseBody_0.Name;
    elseif v11 == Enum.CreatorType.User.Value then
        return l_responseBody_0.name;
    else
        error(("Unknown creatorType: '%s'"):format(v11));
        return;
    end;
end;
v9.isCached = function(v13, v14, v15) --[[ Line: 61 ]] --[[ Name: isCached ]]
    -- upvalues: v9 (copy)
    assert(v9.isValidCreatorType(v15));
    local l_cachedCreatorInfo_0 = v13:getState().assets.cachedCreatorInfo;
    if not l_cachedCreatorInfo_0 then
        return false;
    elseif not l_cachedCreatorInfo_0.Id then
        return false;
    else
        local v17 = false;
        if l_cachedCreatorInfo_0.Id == v14 then
            v17 = l_cachedCreatorInfo_0.Type == v15;
        end;
        return v17;
    end;
end;
return v9;