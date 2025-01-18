return {
    mock = function() --[[ Line: 14 ]] --[[ Name: mock ]]
        return {
            groupId = 12341234, 
            name = "yeet"
        };
    end, 
    fromJsonData = function(v0) --[[ Line: 21 ]] --[[ Name: fromJsonData ]]
        if type(v0.id) ~= "number" then
            return false, "Group.fromJsonData expects id to be a number";
        elseif type(v0.name) ~= "string" then
            return false, "Group.fromJsonData expects name to be a string";
        else
            return true, {
                name = v0.name, 
                groupId = v0.id
            };
        end;
    end
};