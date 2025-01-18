return {
    validate = function(v0) --[[ Line: 13 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        elseif v0.id and typeof(v0.id) ~= "number" then
            return (("\"id\" > Expected number, got %*"):format((typeof(v0.id))));
        elseif v0.name and typeof(v0.name) ~= "string" then
            return (("\"name\" > Expected string, got %*"):format((typeof(v0.name))));
        elseif v0.description and typeof(v0.description) ~= "string" then
            return (("\"description\" > Expected string, got %*"):format((typeof(v0.description))));
        elseif v0.rootPlaceId and typeof(v0.rootPlaceId) ~= "number" then
            return (("\"rootPlaceId\" > Expected number, got %*"):format((typeof(v0.rootPlaceId))));
        else
            local l_privacyType_0 = v0.privacyType;
            if l_privacyType_0 and typeof(l_privacyType_0) ~= "string" then
                return (("\"privacyType\" > Expected string, got %*"):format((typeof(l_privacyType_0))));
            elseif v0.creatorTargetId and typeof(v0.creatorTargetId) ~= "number" then
                return (("\"creatorTargetId\" > Expected number, got %*"):format((typeof(v0.creatorTargetId))));
            elseif v0.creatorName and typeof(v0.creatorName) ~= "string" then
                return (("\"creatorName\" > Expected string, got %*"):format((typeof(v0.creatorName))));
            elseif v0.created and typeof(v0.created) ~= "string" then
                return (("\"created\" > Expected string, got %*"):format((typeof(v0.created))));
            elseif v0.updated and typeof(v0.updated) ~= "string" then
                return (("\"updated\" > Expected string, got %*"):format((typeof(v0.updated))));
            else
                return nil;
            end;
        end;
    end
};