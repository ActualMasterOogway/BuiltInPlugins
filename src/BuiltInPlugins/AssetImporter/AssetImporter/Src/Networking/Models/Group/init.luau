local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return {
    mock = function() --[[ Line: 8 ]] --[[ Name: mock ]]
        return {
            groupId = 13370420, 
            name = "RobloxLovers"
        };
    end, 
    fromJsonData = function(v2) --[[ Line: 15 ]] --[[ Name: fromJsonData ]]
        if type(v2.id) ~= "number" then
            return false, "Group.fromJsonData expects id to be a number";
        elseif type(v2.name) ~= "string" then
            return false, "Group.fromJsonData expects name to be a string";
        else
            return true, {
                name = v2.name, 
                groupId = v2.id
            };
        end;
    end
};