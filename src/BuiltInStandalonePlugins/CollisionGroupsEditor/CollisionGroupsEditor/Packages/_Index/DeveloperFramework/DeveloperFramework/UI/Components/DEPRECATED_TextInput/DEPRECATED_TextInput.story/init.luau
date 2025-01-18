local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
return {
    stories = {
        {
            name = "RoundedBorder", 
            story = v1.createElement(v2, {
                Size = UDim2.new(0, 150, 0, 20), 
                Style = "RoundedBorder", 
                PlaceholderText = "Placeholder", 
                TextXAlignment = Enum.TextXAlignment.Center, 
                OnTextChanged = function(v3) --[[ Line: 15 ]] --[[ Name: OnTextChanged ]]
                    print("TextInput - OnTextChanged: ", v3);
                end, 
                OnFocusGained = function() --[[ Line: 18 ]] --[[ Name: OnFocusGained ]]
                    print("TextInput - OnFocusGained");
                end, 
                OnFocusLost = function(v4, v5) --[[ Line: 21 ]] --[[ Name: OnFocusLost ]]
                    print("TextInput - OnFocusLost", v4, "original text", v5.Text);
                end
            })
        }, 
        {
            name = "FilledRoundedBorder", 
            story = v1.createElement(v2, {
                Size = UDim2.new(0, 150, 0, 20), 
                Style = "FilledRoundedBorder", 
                PlaceholderText = "Placeholder", 
                OnTextChanged = function(v6) --[[ Line: 32 ]] --[[ Name: OnTextChanged ]]
                    print("TextInput - OnTextChanged: ", v6);
                end, 
                OnFocusGained = function() --[[ Line: 35 ]] --[[ Name: OnFocusGained ]]
                    print("TextInput - OnFocusGained");
                end, 
                OnFocusLost = function(v7) --[[ Line: 38 ]] --[[ Name: OnFocusLost ]]
                    print("TextInput - OnFocusLost", v7);
                end
            })
        }, 
        {
            name = "FilledRoundedRedBorder", 
            story = v1.createElement(v2, {
                Size = UDim2.new(0, 150, 0, 20), 
                Style = "FilledRoundedRedBorder", 
                PlaceholderText = "Placeholder", 
                OnTextChanged = function(v8) --[[ Line: 49 ]] --[[ Name: OnTextChanged ]]
                    print("TextInput - OnTextChanged: ", v8);
                end, 
                OnFocusGained = function() --[[ Line: 52 ]] --[[ Name: OnFocusGained ]]
                    print("TextInput - OnFocusGained");
                end, 
                OnFocusLost = function(v9) --[[ Line: 55 ]] --[[ Name: OnFocusLost ]]
                    print("TextInput - OnFocusLost", v9);
                end
            })
        }
    }
};