return {
    from = function(v0, v1, _, v3) --[[ Line: 7 ]] --[[ Name: from ]]
        return {
            id = v0, 
            imageId = v0, 
            approved = v1 or false, 
            isModerated = v3 or false
        };
    end, 
    fromDevelop = function(v4) --[[ Line: 16 ]] --[[ Name: fromDevelop ]]
        local v5 = true;
        if v4.reviewStatus ~= nil then
            v5 = true;
            if v4.reviewStatus ~= "Finished" then
                v5 = v4.reviewStatus == "DoesNotRequire";
            end;
        end;
        local v6 = v4.isModerated and v4.reviewStatus ~= "Pending";
        return {
            id = v4.id, 
            imageId = v4.id, 
            approved = v5, 
            isModerated = v6
        };
    end
};