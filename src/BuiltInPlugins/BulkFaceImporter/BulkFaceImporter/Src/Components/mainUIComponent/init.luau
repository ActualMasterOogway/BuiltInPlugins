local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = v1.PureComponent:extend("Tabs");
local v3 = require(script.Parent.importUIComponent);
local v4 = require(script.Parent.avatarCheckUIComponent);
v2.init = function(v5) --[[ Line: 11 ]] --[[ Name: init ]]
    v5.state = {
        currentTab = "Tab1"
    };
end;
v2.render = function(v6) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Tabs = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 30), 
            BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        }, {
            Tab1 = v1.createElement("TextButton", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Import", 
                Font = Enum.Font.SourceSans, 
                TextSize = 18, 
                BackgroundColor3 = Color3.fromRGB(150, 150, 150), 
                BorderSizePixel = 0, 
                [v1.Event.Activated] = function() --[[ Line: 34 ]]
                    -- upvalues: v6 (copy)
                    v6:setState({
                        currentTab = "Tab1"
                    });
                end
            }), 
            Tab2 = v1.createElement("TextButton", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Text = "Check", 
                Font = Enum.Font.SourceSans, 
                TextSize = 18, 
                BackgroundColor3 = Color3.fromRGB(150, 150, 150), 
                BorderSizePixel = 0, 
                [v1.Event.Activated] = function() --[[ Line: 48 ]]
                    -- upvalues: v6 (copy)
                    v6:setState({
                        currentTab = "Tab2"
                    });
                end
            })
        }), 
        Frame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -30), 
            Position = UDim2.new(0, 0, 0, 30), 
            BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        }, {
            Content = v6.state.currentTab == "Tab1" and v1.createElement(v3) or v1.createElement(v4)
        })
    });
end;
return v2;