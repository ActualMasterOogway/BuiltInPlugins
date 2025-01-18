return {
    validate = function(v0) --[[ Line: 19 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        elseif v0.placeId and typeof(v0.placeId) ~= "number" then
            return (("\"placeId\" > Expected number, got %*"):format((typeof(v0.placeId))));
        elseif v0.name and typeof(v0.name) ~= "string" then
            return (("\"name\" > Expected string, got %*"):format((typeof(v0.name))));
        elseif v0.description and typeof(v0.description) ~= "string" then
            return (("\"description\" > Expected string, got %*"):format((typeof(v0.description))));
        elseif v0.sourceName and typeof(v0.sourceName) ~= "string" then
            return (("\"sourceName\" > Expected string, got %*"):format((typeof(v0.sourceName))));
        elseif v0.sourceDescription and typeof(v0.sourceDescription) ~= "string" then
            return (("\"sourceDescription\" > Expected string, got %*"):format((typeof(v0.sourceDescription))));
        elseif v0.url and typeof(v0.url) ~= "string" then
            return (("\"url\" > Expected string, got %*"):format((typeof(v0.url))));
        elseif v0.builder and typeof(v0.builder) ~= "string" then
            return (("\"builder\" > Expected string, got %*"):format((typeof(v0.builder))));
        elseif v0.builderId and typeof(v0.builderId) ~= "number" then
            return (("\"builderId\" > Expected number, got %*"):format((typeof(v0.builderId))));
        elseif v0.hasVerifiedBadge and typeof(v0.hasVerifiedBadge) ~= "boolean" then
            return (("\"hasVerifiedBadge\" > Expected boolean, got %*"):format((typeof(v0.hasVerifiedBadge))));
        elseif v0.isPlayable and typeof(v0.isPlayable) ~= "boolean" then
            return (("\"isPlayable\" > Expected boolean, got %*"):format((typeof(v0.isPlayable))));
        elseif v0.reasonProhibited and typeof(v0.reasonProhibited) ~= "string" then
            return (("\"reasonProhibited\" > Expected string, got %*"):format((typeof(v0.reasonProhibited))));
        elseif v0.universeId and typeof(v0.universeId) ~= "number" then
            return (("\"universeId\" > Expected number, got %*"):format((typeof(v0.universeId))));
        elseif v0.universeRootPlaceId and typeof(v0.universeRootPlaceId) ~= "number" then
            return (("\"universeRootPlaceId\" > Expected number, got %*"):format((typeof(v0.universeRootPlaceId))));
        elseif v0.price and typeof(v0.price) ~= "number" then
            return (("\"price\" > Expected number, got %*"):format((typeof(v0.price))));
        elseif v0.imageToken and typeof(v0.imageToken) ~= "string" then
            return (("\"imageToken\" > Expected string, got %*"):format((typeof(v0.imageToken))));
        else
            return nil;
        end;
    end
};