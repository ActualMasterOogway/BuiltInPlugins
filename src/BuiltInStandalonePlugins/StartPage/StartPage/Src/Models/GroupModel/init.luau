return {
    validate = function(v0) --[[ Line: 6 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        elseif v0.id and typeof(v0.id) ~= "number" then
            return (("\"id\" > Expected number, got %*"):format((typeof(v0.id))));
        elseif v0.name and typeof(v0.name) ~= "string" then
            return (("\"name\" > Expected string, got %*"):format((typeof(v0.name))));
        else
            return nil;
        end;
    end
};