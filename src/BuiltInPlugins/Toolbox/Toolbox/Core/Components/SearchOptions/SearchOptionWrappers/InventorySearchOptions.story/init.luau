local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(script.Parent.InventorySearchOptions);
local v3 = require(l_script_FirstAncestor_0.TestUtils.ClickToShowInteractiveStoryWrapper);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
return {
    name = "InventorySearchOptions", 
    summary = "The Search Option component for Inventory", 
    stories = {
        {
            story = function() --[[ Line: 15 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v4 (copy), v3 (copy), v2 (copy)
                return v1.createElement(v4, {}, {
                    ClickToShowInteractiveStoryWrapper = v1.createElement(v3, {
                        IsShownByDefault = true, 
                        OnRender = function(_, v6) --[[ Line: 20 ]] --[[ Name: OnRender ]]
                            -- upvalues: v1 (ref), v2 (ref)
                            return v1.createElement(v2, {
                                GetSearchOptions = function() --[[ Line: 22 ]] --[[ Name: GetSearchOptions ]]

                                end, 
                                OnClose = v6
                            });
                        end
                    })
                });
            end
        }
    }
};