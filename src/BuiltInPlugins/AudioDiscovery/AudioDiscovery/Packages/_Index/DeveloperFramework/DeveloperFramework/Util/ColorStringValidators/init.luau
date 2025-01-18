return {
    RGBFromRGBString = function(v0) --[[ Line: 2 ]] --[[ Name: RGBFromRGBString ]]
        return v0:match("^%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%s*$");
    end, 
    RGBFromHexString = function(v1) --[[ Line: 6 ]] --[[ Name: RGBFromHexString ]]
        return v1:match("^%s*%#?(%x%x)(%x%x)(%x%x)%s*$");
    end, 
    HSVFromHSVString = function(v2) --[[ Line: 10 ]] --[[ Name: HSVFromHSVString ]]
        return v2:match("^%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%s*$");
    end, 
    validateHex = function(v3) --[[ Line: 14 ]] --[[ Name: validateHex ]]
        return v3:match("^%s*%#?(%x%x%x%x%x%x)%s*$") ~= nil;
    end, 
    validateRGB = function(v4) --[[ Line: 18 ]] --[[ Name: validateRGB ]]
        local v5, v6, v7 = v4:match("^%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*%s*$");
        if v5 == nil or v6 == nil or v7 == nil then
            return false;
        elseif tonumber(v5) > 255 or tonumber(v6) > 255 or tonumber(v7) > 255 then
            return false;
        else
            return true;
        end;
    end, 
    validateHSV = function(v8) --[[ Line: 32 ]] --[[ Name: validateHSV ]]
        local v9, v10, v11 = v8:match("^%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*%s*$");
        if v9 == nil or v10 == nil or v11 == nil then
            return false;
        elseif tonumber(v9) > 360 then
            return false;
        elseif tonumber(v10) > 100 or tonumber(v11) > 100 then
            return false;
        else
            return true;
        end;
    end
};