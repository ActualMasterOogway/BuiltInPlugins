return {
    validate = function(v0) --[[ Line: 6 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        elseif v0.targetId and typeof(v0.targetId) ~= "number" then
            return (("\"targetId\" > Expected number, got %*"):format((typeof(v0.targetId))));
        elseif v0.imageUrl and typeof(v0.imageUrl) ~= "string" then
            return (("\"imageUrl\" > Expected string, got %*"):format((typeof(v0.imageUrl))));
        else
            return nil;
        end;
    end
};