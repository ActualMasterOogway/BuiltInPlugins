local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.RadioButtonList);
return {
    stories = {
        {
            name = "Vertical List", 
            story = function() --[[ Line: 10 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    Buttons = {
                        {
                            Key = "KEY1", 
                            Text = "option text 1"
                        }, 
                        {
                            Key = "KEY2", 
                            Text = "option text 2", 
                            Disabled = false
                        }, 
                        {
                            Key = "KEY3", 
                            Text = "option text 3", 
                            Disabled = false
                        }, 
                        {
                            Key = "KEY4", 
                            Text = "disabled text", 
                            Disabled = true
                        }
                    }, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SelectedKey = "KEY1"
                });
            end
        }, 
        {
            name = "Horizontal List", 
            story = function() --[[ Line: 40 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    Buttons = {
                        {
                            Key = "KEY1", 
                            Text = "option text 1", 
                            Disabled = false
                        }, 
                        {
                            Key = "KEY2", 
                            Text = "option text 2", 
                            Disabled = false
                        }, 
                        {
                            Key = "KEY4", 
                            Text = "disabled text", 
                            Disabled = true
                        }
                    }, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SelectedKey = "KEY2"
                });
            end
        }
    }
};