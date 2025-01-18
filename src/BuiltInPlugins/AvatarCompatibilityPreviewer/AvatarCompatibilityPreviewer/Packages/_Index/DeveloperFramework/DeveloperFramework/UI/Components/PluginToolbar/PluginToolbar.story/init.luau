local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.PluginToolbar);
local v3 = require(l_Parent_0.UI.Components.PluginButton);
local v4 = false;
return function() --[[ Line: 12 ]]
    -- upvalues: v4 (ref), v1 (copy), v2 (copy), v3 (copy)
    if v4 then
        warn("This example can only be run once, due to a bug with PluginToolbar and PluginToolbarButton.\nThe bug is filed under CLISTUDIO-20687.");
        return;
    else
        v4 = true;
        local v5 = v1.PureComponent:extend("ExampleToolbar");
        v5.init = function(v6) --[[ Line: 21 ]] --[[ Name: init ]]
            v6.state = {
                activeButton = 1
            };
            v6.toggleActiveButton = function(v7) --[[ Line: 26 ]]
                -- upvalues: v6 (copy)
                print(string.format("Button %s was clicked.", v7));
                v6:setState({
                    activeButton = v7
                });
            end;
        end;
        v5.render = function(v8) --[[ Line: 34 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v2 (ref), v3 (ref)
            local l_activeButton_0 = v8.state.activeButton;
            return v1.createElement(v2, {
                Title = "Test Toolbar", 
                RenderButtons = function(v10) --[[ Line: 38 ]] --[[ Name: RenderButtons ]]
                    -- upvalues: v1 (ref), v3 (ref), l_activeButton_0 (copy), v8 (copy)
                    return {
                        Button1 = v1.createElement(v3, {
                            Toolbar = v10, 
                            Title = "Button 1", 
                            Active = l_activeButton_0 == 1, 
                            OnClick = function() --[[ Line: 44 ]] --[[ Name: OnClick ]]
                                -- upvalues: v8 (ref)
                                v8.toggleActiveButton(1);
                            end
                        }), 
                        Button2 = v1.createElement(v3, {
                            Toolbar = v10, 
                            Title = "Button 2", 
                            Active = l_activeButton_0 == 2, 
                            OnClick = function() --[[ Line: 53 ]] --[[ Name: OnClick ]]
                                -- upvalues: v8 (ref)
                                v8.toggleActiveButton(2);
                            end
                        })
                    };
                end
            });
        end;
        return v1.createElement(v5);
    end;
end;