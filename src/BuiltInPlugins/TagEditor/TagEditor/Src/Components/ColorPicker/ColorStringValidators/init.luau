return {
    validateHex = function(v0) --[[ Line: 2 ]] --[[ Name: validateHex ]]
        return v0:match("^%s*%#?(%x%x%x%x%x%x)%s*$") ~= nil;
    end, 
    validateRGB = function(v1) --[[ Line: 6 ]] --[[ Name: validateRGB ]]
        local v2, v3, v4 = v1:match("^%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*%s*$");
        if v2 == nil or v3 == nil or v4 == nil then
            return false;
        elseif tonumber(v2) > 255 or tonumber(v3) > 255 or tonumber(v4) > 255 then
            return false;
        else
            return true;
        end;
    end, 
    validateHSV = function(v5) --[[ Line: 20 ]] --[[ Name: validateHSV ]]
        local v6, v7, v8 = v5:match("^%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*%s*$");
        if v6 == nil or v7 == nil or v8 == nil then
            return false;
        elseif tonumber(v6) > 360 then
            return false;
        elseif tonumber(v7) > 100 or tonumber(v8) > 100 then
            return false;
        else
            return true;
        end;
    end
};