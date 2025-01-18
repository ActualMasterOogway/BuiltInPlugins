return {
    validate = function(v0) --[[ Line: 6 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        elseif v0.userIsEligible and typeof(v0.userIsEligible) ~= "boolean" then
            return (("\"userIsEligible\" > Expected boolean, got %*"):format((typeof(v0.userIsEligible))));
        elseif v0.displayText and typeof(v0.displayText) ~= "string" then
            return (("\"displayText\" > Expected string, got %*"):format((typeof(v0.displayText))));
        else
            return nil;
        end;
    end
};