local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_copy_0 = require(l_Parent_0.Parent.Dash).copy;
local v3 = require(script.Parent);
local v4 = require(script.Parent.Parent.DEPRECATED_Button);
local function v7(v5) --[[ Line: 10 ]] --[[ Name: CustomPropertyRenderer ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_Schema_0 = v5.Schema;
    return v1.createElement(v4, {
        OnClick = l_Schema_0.OnClick, 
        Size = UDim2.new(1, 0, 0, 32), 
        Style = "RoundPrimary", 
        Text = v5.Value
    });
end;
local v8 = {
    {
        Id = "Checkbox", 
        Label = "Checkbox", 
        Schema = {
            Type = "Checkbox"
        }, 
        Value = true
    }, 
    {
        Id = "Text", 
        Label = "Text", 
        Schema = {
            Type = "Text", 
            PlaceholderText = "Text"
        }, 
        Value = "Text"
    }, 
    {
        Id = "Number", 
        Label = "Number", 
        Schema = {
            Type = "Number", 
            PlaceholderText = 0
        }, 
        Value = 1
    }, 
    {
        Id = "Slider", 
        Label = "Slider", 
        Schema = {
            Type = "Slider", 
            Min = 0, 
            Max = 1, 
            ShowInput = true, 
            SnapIncrement = 0.05
        }, 
        Value = 0.5
    }
};
local v14 = {
    {
        Id = "Select", 
        Label = "Select", 
        Schema = {
            Type = "Select", 
            Items = {
                {
                    Id = "Option1", 
                    Label = "Option 1"
                }, 
                {
                    Id = "Option2", 
                    Label = "Option 2"
                }, 
                {
                    Id = "Option3", 
                    Label = "Option 3"
                }
            }
        }, 
        Validate = function(v9) --[[ Line: 83 ]] --[[ Name: Validate ]]
            if v9 == "Option3" then
                return Enum.PropertyStatus.Error, "Option 3 is currently disabled";
            else
                return Enum.PropertyStatus.Ok;
            end;
        end, 
        Value = "Option1"
    }, 
    {
        Id = "Vector", 
        Label = "Vector", 
        Schema = {
            Type = "Vector", 
            Components = {
                "X", 
                "Y", 
                "Z"
            }, 
            GetValue = function(v10) --[[ Line: 98 ]] --[[ Name: GetValue ]]
                return (Vector3.new(v10[1], v10[2], v10[3]));
            end, 
            GetComponents = function(v11) --[[ Line: 101 ]] --[[ Name: GetComponents ]]
                return {
                    v11.X, 
                    v11.Y, 
                    v11.Z
                };
            end
        }, 
        Validate = function(v12) --[[ Line: 105 ]] --[[ Name: Validate ]]
            if v12.X * v12.Y * v12.Z > 1024 then
                return Enum.PropertyStatus.Error, "Exceded maximum volume";
            else
                return Enum.PropertyStatus.Ok, "";
            end;
        end, 
        Value = Vector3.new(0, 0, 0, 0)
    }, 
    {
        Id = "Custom", 
        Label = "Custom", 
        Schema = {
            Type = "Custom", 
            OnClick = function() --[[ Line: 118 ]] --[[ Name: OnClick ]]
                print("Clicked");
            end
        }, 
        Value = "Click me!"
    }, 
    {
        Id = "Hidden", 
        Label = "Hidden", 
        Schema = {
            Type = "Custom"
        }, 
        Value = "Hide me!"
    }, 
    {
        Id = "Validate", 
        Label = "Validation", 
        Schema = {
            Type = "Text", 
            PlaceholderText = "Text"
        }, 
        Validate = function(v13) --[[ Line: 139 ]] --[[ Name: Validate ]]
            if #v13 > 10 then
                return Enum.PropertyStatus.Error, "Username is too long";
            elseif #v13 > 9 then
                return Enum.PropertyStatus.Warning, "Username approaching limit";
            else
                return Enum.PropertyStatus.Ok, "";
            end;
        end, 
        Value = "Username"
    }
};
table.insert(v14, {
    Children = {
        {
            Id = "Slider", 
            Label = "Child 1", 
            Schema = {
                Type = "Slider", 
                Min = 0, 
                Max = 1, 
                ShowInput = true, 
                SnapIncrement = 0.05
            }, 
            Value = 0.5
        }, 
        {
            Children = {
                {
                    Id = "Number", 
                    Label = "Number", 
                    Schema = {
                        Type = "Number", 
                        PlaceholderText = 0
                    }, 
                    Value = 1
                }
            }, 
            Id = "Multi", 
            Label = "Child 2", 
            Schema = {
                Type = "Slider", 
                Min = 0, 
                Max = 1, 
                ShowInput = true, 
                SnapIncrement = 0.05
            }, 
            Value = 0.5
        }
    }, 
    Id = "Children", 
    Label = "Children", 
    Schema = {
        Type = "Number"
    }, 
    Value = 1
});
local v15 = v1.PureComponent:extend("Settings");
v15.init = function(v16) --[[ Line: 200 ]] --[[ Name: init ]]
    -- upvalues: l_copy_0 (copy), v14 (copy), v8 (copy)
    v16.OnExpansionChange = function(v17) --[[ Line: 201 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            Expansion = v17
        });
    end;
    v16.OnChange = function(v18) --[[ Line: 207 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            Items = v18
        });
    end;
    v16.HideButton = function() --[[ Line: 213 ]]
        -- upvalues: v16 (copy), l_copy_0 (ref)
        v16:setState(function(v19) --[[ Line: 214 ]]
            -- upvalues: l_copy_0 (ref)
            local v20 = l_copy_0(v19.Items);
            v20[2].Children[4].Hidden = true;
            return {
                Items = v20
            };
        end);
    end;
    v14[4].Schema.OnClick = v16.HideButton;
    v16.state = {
        Expansion = {}, 
        Items = {
            {
                Id = "Basic", 
                Label = "Basic Settings", 
                Children = v8, 
                Separator = true
            }, 
            {
                Expandable = false, 
                Id = "Advanced", 
                Label = "Advanced Settings", 
                Children = v14
            }
        }
    };
end;
v15.didUpdate = function(v21, v22) --[[ Line: 246 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_copy_0 (copy)
    local l_props_0 = v21.props;
    if v22.Disabled ~= l_props_0.Disabled then
        local v24 = l_copy_0(v21.state.Items);
        for v25, v26 in v24 do
            for v27, _ in v26.Children do
                v24[v25].Children[v27].Disabled = l_props_0.Disabled;
            end;
        end;
        v21:setState({
            Items = v24
        });
    end;
end;
v15.render = function(v29) --[[ Line: 264 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v7 (copy)
    return v1.createElement(v3, {
        Expansion = v29.state.Expansion, 
        ExpandByDefault = true, 
        Items = v29.state.Items, 
        LabelWidth = UDim.new(0, 150), 
        LabelHeight = 32, 
        OnExpansionChange = v29.OnExpansionChange, 
        OnChange = v29.OnChange, 
        Renderers = {
            Custom = v7
        }, 
        Size = UDim2.new(1, 0, 0, 500)
    });
end;
return {
    controls = {
        Disabled = false
    }, 
    stories = {
        {
            name = "Form", 
            story = function(v30) --[[ Line: 287 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v15 (copy)
                return v1.createElement(v15, {
                    Disabled = v30.controls.Disabled
                });
            end
        }
    }
};