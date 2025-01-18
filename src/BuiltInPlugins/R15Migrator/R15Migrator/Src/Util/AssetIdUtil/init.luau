return {
    getUnknownAssetId = function() --[[ Line: 11 ]] --[[ Name: getUnknownAssetId ]]
        return 0;
    end, 
    isValidAssetId = function(v0) --[[ Line: 15 ]] --[[ Name: isValidAssetId ]]
        if not v0 then
            return false;
        else
            return v0 ~= 0;
        end;
    end
};