local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.Components.SelectInput);
local v4 = require(l_Parent_0.UI.Components.TextLabel);
local v5 = require(l_Parent_0.Parent.Dash);
local v6 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkModernStartPageStyle)();
local v7 = v2.PureComponent:extend("SelectInputExample");
v7.init = function(v8) --[[ Line: 12 ]] --[[ Name: init ]]
    v8.state = {
        currentIndex = nil
    };
    v8.selectItem = function(_, v10) --[[ Line: 16 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            currentIndex = v10
        });
    end;
end;
v7.render = function(v11) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    return v2.createElement(v3, v1.Dictionary.join({
        PlaceholderText = "Choose an item...", 
        SelectedIndex = v11.state.currentIndex, 
        Items = {
            "The first element", 
            "The second", 
            "A really long element", 
            "A tiny one", 
            "The fifth one", 
            "The last one"
        }, 
        Icons = {
            "rbxasset://textures/ui/common/robux_color@2x.png"
        }, 
        OnItemActivated = v11.selectItem
    }, v11.props));
end;
return {
    controls = if v6 then {
        isModern = false
    } else nil, 
    stories = v5.join({
        {
            name = "Default", 
            story = function(v12) --[[ Line: 55 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v7 (copy)
                print(v12.controls.isModern and "modern" or nil);
                return v2.createElement(v7, {
                    Variant = v12.controls.isModern and "modern" or nil
                });
            end
        }, 
        {
            name = "ErrorText", 
            story = function(v13) --[[ Line: 66 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v7 (copy)
                return v2.createElement(v7, {
                    ErrorText = "PC LOAD LETTER", 
                    Variant = v13.controls.isModern and "modern" or nil
                });
            end
        }, 
        {
            name = "ExpandIcon", 
            summary = "A custom image path can be passed in to use for the expand icon, instead of the default caret", 
            story = function(v14) --[[ Line: 77 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v7 (copy)
                return v2.createElement(v7, {
                    ExpandIcon = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/OptionsDots.png", 
                    Variant = v14.controls.isModern and "modern" or nil
                });
            end
        }, 
        {
            name = "ShowSelection", 
            summary = "By default, SelectInput shows the selected element in a text button. This can be toggled off with ShowSelection", 
            story = function(v15) --[[ Line: 88 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v7 (copy)
                return v2.createElement(v7, {
                    ShowSelection = false, 
                    Size = UDim2.fromOffset(28, 28), 
                    Variant = v15.controls.isModern and "modern" or nil
                });
            end
        }, 
        {
            name = "WithScroll", 
            story = function(v16) --[[ Line: 99 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v7 (copy)
                return v2.createElement(v7, {
                    Items = {
                        "The first element", 
                        "The second", 
                        "A really long element", 
                        "A tiny one", 
                        "The fifth one", 
                        "The last one", 
                        "The last one", 
                        "The last one", 
                        "The last one", 
                        "The last one", 
                        "The last one", 
                        "The last one", 
                        "The last one", 
                        "The last one"
                    }, 
                    Variant = v16.controls.isModern and "modern" or nil
                });
            end
        }
    }, if not v6 then {
        {
            name = "ModernStyle", 
            story = function() --[[ Line: 126 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v4 (copy)
                return v2.createElement(v4, {
                    Size = UDim2.new(1, 0, 0, 100), 
                    Text = "Please enable DevFrameworkModernStartPageStyle to see modern style dropdowns"
                });
            end
        }
    } else nil)
};