return {
    createDefaultCursor = function() --[[ Line: 3 ]] --[[ Name: createDefaultCursor ]]
        return {
            begin = true
        };
    end, 
    createCursor = function(v0) --[[ Line: 9 ]] --[[ Name: createCursor ]]
        if v0 then
            return {
                nextPageCursor = v0.nextPageCursor
            };
        else
            return {};
        end;
    end, 
    isNextPageAvailable = function(v1) --[[ Line: 18 ]] --[[ Name: isNextPageAvailable ]]
        if v1.begin or v1.nextPageCursor then
            return true;
        else
            return false;
        end;
    end, 
    getNextPageCursor = function(v2) --[[ Line: 22 ]] --[[ Name: getNextPageCursor ]]
        return v2.nextPageCursor;
    end
};