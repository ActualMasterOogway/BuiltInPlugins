return {
    validate = function(v0) --[[ Line: 5 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        elseif v0.id and typeof(v0.id) ~= "number" then
            return (("\"id\" > Expected number, got %*"):format((typeof(v0.id))));
        else
            return nil;
        end;
    end
};