return {
    validate = function(v0) --[[ Line: 9 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        elseif v0.id and typeof(v0.id) ~= "number" then
            return (("\"id\" > Expected number, got %*"):format((typeof(v0.id))));
        elseif v0.name and typeof(v0.name) ~= "string" then
            return (("\"name\" > Expected string, got %*"):format((typeof(v0.name))));
        elseif v0.description and typeof(v0.description) ~= "string" then
            return (("\"description\" > Expected string, got %*"):format((typeof(v0.description))));
        elseif v0.url and typeof(v0.url) ~= "string" then
            return (("\"url\" > Expected string, got %*"):format((typeof(v0.url))));
        elseif v0.version and typeof(v0.version) ~= "number" then
            return (("\"version\" > Expected number, got %*"):format((typeof(v0.version))));
        else
            return nil;
        end;
    end
};