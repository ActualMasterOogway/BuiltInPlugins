local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.Toolbar);
local v3 = require(l_script_FirstAncestor_0.Components.ToolbarBase);
local _ = require(l_script_FirstAncestor_0.Types);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagViewportToolingFrameworkSplitButtons);
return {
    story = function(v6) --[[ Line: 13 ]] --[[ Name: KitchenSink ]]
        -- upvalues: v1 (copy), v5 (copy), v2 (copy), v3 (copy)
        local v7 = {
            Type = "Button", 
            Tooltip = "A button", 
            TooltipDescription = ("This is a %*long description."):format((string.rep("very ", 10))), 
            Icon = "rbxassetid://11560341132", 
            OnClick = function() --[[ Line: 19 ]] --[[ Name: OnClick ]]
                print("Button clicked");
            end
        };
        local v8 = table.clone(v7);
        v8.Selected = true;
        local v9 = {
            Type = "SplitButton", 
            Options = {
                {
                    Icon = "rbxasset://textures/StudioToolbox/Search.png", 
                    Text = "Option A", 
                    OnClick = function() --[[ Line: 34 ]] --[[ Name: OnClick ]]
                        print("Option A clicked");
                    end
                }, 
                {
                    Icon = "rbxasset://textures/StudioToolbox/Gallery.png", 
                    Text = "This is the second option, as you can see", 
                    TooltipDescription = "The name is long on purpose!", 
                    OnClick = function() --[[ Line: 43 ]] --[[ Name: OnClick ]]
                        print("Option B clicked");
                    end
                }
            }
        };
        local v10 = {
            Type = "Separator"
        };
        local v11, v12 = v1.useState("gallery");
        local v13 = {
            Type = "Radio", 
            Value = v11, 
            OnChange = v12, 
            Items = {
                {
                    Id = "gallery", 
                    Tooltip = "Gallery", 
                    TooltipDescription = "The gallery", 
                    Icon = "rbxasset://textures/StudioToolbox/Gallery.png"
                }, 
                {
                    Id = "list", 
                    Tooltip = "List", 
                    Icon = "rbxasset://textures/StudioToolbox/List.png"
                }, 
                {
                    Id = "search", 
                    Tooltip = "Search", 
                    Icon = "rbxasset://textures/StudioToolbox/Search.png"
                }
            }
        };
        local v14, v15 = v1.useState(5);
        local v16 = {
            Type = "Slider", 
            Value = v14, 
            OnChange = v15, 
            Min = 0, 
            Max = 10, 
            IncrementStep = 1, 
            Icon = "rbxasset://textures/StudioToolbox/Gallery.png", 
            Tooltip = "My slider"
        };
        local v17 = {
            Type = "Label", 
            Text = "This is a label."
        };
        local v18 = {
            HorizontalItems = {
                v7, 
                v8, 
                if v5() then v9 else v10, 
                v10, 
                v13, 
                v10, 
                v16, 
                v10, 
                {
                    Type = "TextButton", 
                    Text = "On", 
                    OnClick = function() --[[ Line: 117 ]] --[[ Name: OnClick ]]
                        print("Clicked on");
                    end
                }, 
                {
                    Type = "TextButton", 
                    Text = "Off", 
                    Enabled = false, 
                    OnClick = function() --[[ Line: 126 ]] --[[ Name: OnClick ]]
                        error("Should be unreachable");
                    end
                }, 
                v10, 
                v17
            }
        };
        local v19 = {
            VerticalItems = {
                v7, 
                v8, 
                if v5() then v9 else v10, 
                v10, 
                v13
            }
        };
        local v20 = if v6.controls.PutInViewport then v2 else v3;
        return v1.createElement(v1.Fragment, {}, {
            HorizontalToolbar = v1.createElement(v20, v18), 
            VerticalToolbar = v1.createElement(v20, v19)
        });
    end, 
    controls = {
        PutInViewport = false
    }
};