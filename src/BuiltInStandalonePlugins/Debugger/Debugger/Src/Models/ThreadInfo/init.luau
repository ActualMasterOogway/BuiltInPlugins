return {
    new = function() --[[ Line: 9 ]] --[[ Name: new ]]
        return {
            threadId = -1, 
            displayString = ""
        };
    end, 
    fromData = function(v0) --[[ Line: 16 ]] --[[ Name: fromData ]]
        return {
            threadId = v0.threadId or -1, 
            displayString = v0.displayString or ""
        };
    end
};