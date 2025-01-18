return {
    validate = function(v0) --[[ Line: 8 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        elseif v0.id and typeof(v0.id) ~= "number" then
            return (("\"id\" > Expected number, got %*"):format((typeof(v0.id))));
        elseif v0.universeId and typeof(v0.universeId) ~= "number" then
            return (("\"universeId\" > Expected number, got %*"):format((typeof(v0.universeId))));
        elseif v0.name and typeof(v0.name) ~= "string" then
            return (("\"name\" > Expected string, got %*"):format((typeof(v0.name))));
        elseif v0.description and typeof(v0.description) ~= "string" then
            return (("\"description\" > Expected string, got %*"):format((typeof(v0.description))));
        else
            return nil;
        end;
    end
};