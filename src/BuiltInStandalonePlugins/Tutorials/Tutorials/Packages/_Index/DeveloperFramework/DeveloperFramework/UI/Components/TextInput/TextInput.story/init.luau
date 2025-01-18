local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v3 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v4 = require(l_Parent_0.UI.Components.Image);
local v5 = require(l_Parent_0.UI.Components.Pane);
local v6 = require(l_Parent_0.UI.Components.TextInput);
local v7 = require(l_Parent_0.Util.LayoutOrderIterator).new();
local function v9(v8) --[[ Line: 18 ]] --[[ Name: createStory ]]
    -- upvalues: v1 (copy), v5 (copy), v7 (copy)
    return v1.createElement(v5, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LayoutOrder = v7:getNextOrder(), 
        Size = UDim2.fromScale(1, 0), 
        Spacing = 10
    }, {
        Content = v8
    });
end;
local v10 = v1.PureComponent:extend("ControlledInput");
v10.defaultProps = {
    Width = 300
};
v10.init = function(v11) --[[ Line: 36 ]] --[[ Name: init ]]
    v11.state = {
        Text = ""
    };
end;
v10.render = function(v12) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), l_join_0 (copy)
    local l_props_0 = v12.props;
    return v1.createElement(v6, l_join_0(l_props_0, {
        Text = v12.state.Text or "", 
        OnTextChanged = function(v14) --[[ Line: 48 ]] --[[ Name: OnTextChanged ]]
            -- upvalues: v12 (copy)
            v12:setState({
                Text = v14
            });
        end
    }));
end;
return {
    controls = {
        isDisabled = false
    }, 
    stories = {
        {
            name = "Default", 
            story = function(v15) --[[ Line: 104 ]] --[[ Name: story ]]
                -- upvalues: v9 (copy), v1 (copy), v10 (copy)
                return v9(v1.createElement(v10, {
                    Disabled = v15.controls.isDisabled, 
                    PlaceholderText = "Hello, metaverse!", 
                    ShouldFocus = true, 
                    OnFocusLost = function(v16, v17) --[[ Line: 109 ]] --[[ Name: OnFocusLost ]]
                        print("Focus lost", v16, v17);
                    end
                }));
            end
        }, 
        {
            name = "Standard Styles", 
            story = v1.createElement(v5, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = 10
            }, {
                Box = v9(v1.createElement(v10, {
                    PlaceholderText = "Box style", 
                    Style = "Box"
                })), 
                RoundBox = v9(v1.createElement(v10, {
                    PlaceholderText = "RoundBox style", 
                    Style = "RoundBox"
                })), 
                BorderBox = v9(v1.createElement(v10, {
                    PlaceholderText = "BorderBox style", 
                    Style = "BorderBox"
                }))
            })
        }, 
        {
            name = "Bottom Text", 
            story = v9(v1.createElement(v10, {
                BottomText = "Username or email address"
            }))
        }, 
        {
            name = "Error Text", 
            summary = "Render component with error border color and error text", 
            story = v9(v1.createElement(v10, {
                ErrorText = "Invalid input"
            }))
        }, 
        {
            name = "Custom Components", 
            summary = "Render leading, trailing, and bottom components", 
            story = v1.createElement(v5, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = 10
            }, {
                Leading = v9(v1.createElement(v10, {
                    LeadingComponent = v4, 
                    LeadingComponentProps = {
                        Size = UDim2.fromOffset(16, 16), 
                        Style = {
                            Color = Color3.new(0.6, 0.6, 0.6), 
                            Image = "rbxasset://textures/DeveloperFramework/StudioTheme/search_16.png"
                        }
                    }, 
                    PlaceholderText = "Search..."
                })), 
                Trailing = v9(v1.createElement(v10, {
                    TrailingComponent = v4, 
                    TrailingComponentProps = {
                        Size = UDim2.fromOffset(13, 13), 
                        Style = {
                            Color = Color3.new(0.6, 0.6, 0.6), 
                            Image = "rbxasset://textures/DeveloperFramework/StudioTheme/clear.png"
                        }
                    }
                })), 
                Bottom = v9(v1.createElement(v10, {
                    BottomComponent = function(v18) --[[ Line: 57 ]] --[[ Name: TextInputToolbar ]]
                        -- upvalues: v1 (copy), v5 (copy), v4 (copy), v3 (copy)
                        return v1.createElement(v5, v18, {
                            ToolButtons = v1.createElement(v5, {
                                AutomaticSize = Enum.AutomaticSize.X, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                Layout = Enum.FillDirection.Horizontal, 
                                Spacing = 8, 
                                VerticalAlignment = Enum.VerticalAlignment.Center
                            }, {
                                InsertIcon = v1.createElement(v4, {
                                    LayoutOrder = 1, 
                                    Size = UDim2.fromOffset(16, 16), 
                                    Style = {
                                        Color = Color3.new(0.6, 0.6, 0.6), 
                                        Image = "rbxasset://textures/TagEditor/Insert.png"
                                    }
                                }), 
                                FolderIcon = v1.createElement(v4, {
                                    LayoutOrder = 2, 
                                    Size = UDim2.fromOffset(16, 16), 
                                    Style = {
                                        Color = Color3.new(0.6, 0.6, 0.6), 
                                        Image = "rbxasset://textures/TagEditor/Folder.png"
                                    }
                                })
                            }), 
                            SendButton = v1.createElement(v3, {
                                AnchorPoint = Vector2.new(1, 0.5), 
                                OnClick = function() --[[ Line: 86 ]] --[[ Name: OnClick ]]
                                    print("Clicked Send");
                                end, 
                                Position = UDim2.fromScale(1, 0.5), 
                                Size = UDim2.fromOffset(50, 28), 
                                Style = "Round", 
                                Text = "Send"
                            })
                        });
                    end, 
                    BottomComponentProps = {
                        Size = UDim2.new(1, 0, 0, 32)
                    }, 
                    MultiLine = true, 
                    OnEnter = function() --[[ Line: 188 ]] --[[ Name: OnEnter ]]
                        print("Pressed enter to Send");
                    end, 
                    Size = UDim2.fromOffset(300, 120), 
                    PlaceholderText = "Enter a message"
                }))
            })
        }, 
        {
            name = "Formatting", 
            summary = "Convert input to uppercase", 
            story = v9(v1.createElement(v10, {
                OnFormatText = function(v19) --[[ Line: 200 ]] --[[ Name: OnFormatText ]]
                    return string.upper(v19);
                end
            }))
        }, 
        {
            name = "Validation", 
            summary = "Validate input and render error style and text if invalid", 
            story = v9(v1.createElement(v10, {
                OnValidateText = function(v20) --[[ Line: 209 ]] --[[ Name: OnValidateText ]]
                    local v21 = true;
                    if v20 ~= "" then
                        v21 = tonumber(v20) ~= nil;
                    end;
                    local v22 = nil;
                    if not v21 then
                        v22 = "Must be a number";
                    end;
                    return v21, v22;
                end, 
                PlaceholderText = "Enter a number"
            }))
        }, 
        {
            name = "Max Length", 
            summary = "Provide a max length for the input", 
            story = v9(v1.createElement(v10, {
                PlaceholderText = "Enter text", 
                MaxLength = 20
            }))
        }, 
        {
            name = "MultiLine", 
            summary = "A multiline text input with max length", 
            story = v9(v1.createElement(v10, {
                PlaceholderText = "Enter text", 
                MaxLength = 200, 
                MultiLine = true, 
                Size = UDim2.fromOffset(300, 200)
            }))
        }, 
        {
            name = "Autocomplete", 
            summary = "Show an autocomplete dropdown of options when typing", 
            story = v9(v1.createElement(v10, {
                GetAutocompleteItems = function(v23) --[[ Line: 242 ]] --[[ Name: GetAutocompleteItems ]]
                    return {
                        {
                            Id = "Red", 
                            Label = "Add Red to " .. v23, 
                            Value = v23 .. ": Red"
                        }, 
                        {
                            Id = "Green", 
                            Label = "Add Green to " .. v23, 
                            Value = v23 .. ": Green"
                        }, 
                        {
                            Id = "Blue", 
                            Label = "Add Blue to " .. v23, 
                            Value = v23 .. ": Blue"
                        }
                    };
                end, 
                PlaceholderText = "Enter text"
            }))
        }, 
        {
            name = "OnEnter", 
            summary = "Prints to the console when you press enter", 
            story = v9(v1.createElement(v10, {
                MultiLine = true, 
                OnEnter = function() --[[ Line: 269 ]] --[[ Name: OnEnter ]]
                    print("OnEnter called");
                end
            }))
        }
    }
};