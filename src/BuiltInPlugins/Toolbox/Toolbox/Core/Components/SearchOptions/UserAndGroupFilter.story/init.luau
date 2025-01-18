local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(script.Parent.UserAndGroupFilter);
local v3 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
return {
    name = "UserAndGroupFilter", 
    summary = "A live Search Bar for users and groups", 
    stories = {
        {
            story = function() --[[ Line: 14 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy), v2 (copy)
                return v1.createElement(v3, {}, {
                    UserAndGroupFilter = v1.createElement(v2, {
                        OnDeleteCreatorPill = function() --[[ Line: 17 ]] --[[ Name: OnDeleteCreatorPill ]]
                            print("onDeleteCreatorPill");
                        end, 
                        OnSearchUpdate = function() --[[ Line: 20 ]] --[[ Name: OnSearchUpdate ]]
                            print("onDeleteCreatorPill");
                        end, 
                        OnSelectCreator = function() --[[ Line: 23 ]] --[[ Name: OnSelectCreator ]]
                            print("onDeleteCreatorPill");
                        end, 
                        SelectedUsers = {
                            {
                                Name = "Selected Username", 
                                Id = 123, 
                                Type = Enum.CreatorType.User
                            }
                        }, 
                        SelectedGroups = {
                            {
                                Name = "Selected Group name", 
                                Id = 123, 
                                Type = Enum.CreatorType.Group
                            }
                        }
                    })
                });
            end
        }
    }
};