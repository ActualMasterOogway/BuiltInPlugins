local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.PropertyCell);
local v3 = v1.PureComponent:extend("PropertyCellStory");
v3.init = function(v4) --[[ Line: 7 ]] --[[ Name: init ]]
    v4.state = {
        value = v4.props.InitialValue
    };
    v4.onChanged = function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (copy)
        v4:setState({
            value = v5
        });
    end;
end;
v3.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_props_0 = v6.props;
    local l_state_0 = v6.state;
    return v1.createElement(v2, {
        Disabled = l_props_0.Disabled, 
        OnChanged = v6.onChanged, 
        Schema = l_props_0.Schema, 
        Size = UDim2.fromOffset(300, 24), 
        Tooltip = l_props_0.Tooltip, 
        Value = l_state_0.value
    });
end;
return {
    controls = {
        Disabled = false
    }, 
    stories = {
        {
            name = "Text", 
            story = function(v9) --[[ Line: 38 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy)
                return v1.createElement(v3, {
                    Disabled = v9.controls.Disabled, 
                    InitialValue = "A Button Label", 
                    Schema = {
                        Type = "Text"
                    }, 
                    Tooltip = "A Text cell"
                });
            end
        }, 
        {
            name = "Color", 
            story = function(v10) --[[ Line: 51 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy)
                return v1.createElement(v3, {
                    Disabled = v10.controls.Disabled, 
                    InitialValue = Color3.fromRGB(20, 160, 200), 
                    Schema = {
                        Type = "Color"
                    }, 
                    Tooltip = "A Color cell"
                });
            end
        }, 
        {
            name = "Checkbox", 
            story = function(v11) --[[ Line: 64 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy)
                return v1.createElement(v3, {
                    Disabled = v11.controls.Disabled, 
                    InitialValue = "", 
                    Schema = {
                        Type = "Checkbox"
                    }, 
                    Tooltip = "A Checkbox cell"
                });
            end
        }, 
        {
            name = "Slider", 
            story = function(v12) --[[ Line: 77 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy)
                return v1.createElement(v3, {
                    Disabled = v12.controls.Disabled, 
                    InitialValue = 0.5, 
                    Schema = {
                        Type = "Slider", 
                        Min = 0, 
                        Max = 1, 
                        SnapIncrement = 0.05, 
                        ShowInput = true
                    }, 
                    Tooltip = "A Slider cell"
                });
            end
        }, 
        {
            name = "Select", 
            story = function(v13) --[[ Line: 94 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy)
                return v1.createElement(v3, {
                    Disabled = v13.controls.Disabled, 
                    InitialValue = "SourceSans", 
                    Schema = {
                        Type = "Select", 
                        Items = {
                            {
                                Id = "Gotham", 
                                Label = "Gotham"
                            }, 
                            {
                                Id = "SourceSans", 
                                Label = "SourceSans"
                            }, 
                            {
                                Id = "SourceSansBold", 
                                Label = "SourceSansBold"
                            }
                        }
                    }, 
                    Tooltip = "A Select cell"
                });
            end
        }, 
        {
            name = "Single Select Button", 
            story = function(v14) --[[ Line: 121 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy)
                return v1.createElement(v3, {
                    Disabled = v14.controls.Disabled, 
                    IntialValue = "Left", 
                    Schema = {
                        Type = "SingleSelectButton", 
                        Items = {
                            {
                                Id = "Left", 
                                Label = "Left"
                            }, 
                            {
                                Id = "Center", 
                                Label = "Center"
                            }, 
                            {
                                Id = "Right", 
                                Label = "Right"
                            }
                        }
                    }, 
                    Tooltip = "A Single Select Button cell"
                });
            end
        }, 
        {
            name = "Vector2", 
            story = function(v15) --[[ Line: 148 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy)
                return v1.createElement(v3, {
                    Disabled = v15.controls.Disabled, 
                    InitialValue = Vector2.new(-3, 4.2), 
                    Schema = {
                        Type = "Vector", 
                        Components = {
                            "X", 
                            "Y"
                        }, 
                        GetValue = function(v16) --[[ Line: 155 ]] --[[ Name: GetValue ]]
                            return Vector2.new(v16[1], v16[2]);
                        end, 
                        GetComponents = function(v17) --[[ Line: 158 ]] --[[ Name: GetComponents ]]
                            return {
                                v17.X, 
                                v17.Y
                            };
                        end
                    }, 
                    Tooltip = "A Vector2 cell"
                });
            end
        }, 
        {
            name = "UDim2", 
            story = function(v18) --[[ Line: 168 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy)
                return v1.createElement(v3, {
                    Disabled = v18.controls.Disabled, 
                    InitialValue = UDim2.new(1, 0, 1, -30), 
                    Schema = {
                        Type = "Vector", 
                        Components = {
                            "X", 
                            "", 
                            "Y", 
                            ""
                        }, 
                        GetValue = function(v19) --[[ Line: 175 ]] --[[ Name: GetValue ]]
                            return UDim2.new(v19[1], v19[2], v19[3], v19[4]);
                        end, 
                        GetComponents = function(v20) --[[ Line: 178 ]] --[[ Name: GetComponents ]]
                            return {
                                v20.X.Scale, 
                                v20.X.Offset, 
                                v20.Y.Scale, 
                                v20.Y.Offset
                            };
                        end
                    }, 
                    Tooltip = "A UDim2 cell"
                });
            end
        }
    }
};