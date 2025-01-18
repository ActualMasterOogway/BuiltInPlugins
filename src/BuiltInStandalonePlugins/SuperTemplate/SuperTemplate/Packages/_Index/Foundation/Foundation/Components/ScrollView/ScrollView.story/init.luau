local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local v4 = require(l_script_FirstAncestor_0.Components.ScrollView);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
return {
    summary = "ScrollView", 
    stories = {
        Scrolling = {
            name = "Scrolling", 
            story = function(v6) --[[ Line: 10 ]] --[[ Name: StoryScrolling ]]
                -- upvalues: v2 (copy), v3 (copy), v4 (copy)
                local l_controls_0 = v6.controls;
                return v2.createElement(v3, {
                    tag = "row gap-large auto-xy"
                }, {
                    Vertical = v2.createElement(v4, {
                        Size = UDim2.new(0, 120, 0, 120), 
                        layout = {
                            FillDirection = Enum.FillDirection.Vertical
                        }, 
                        scroll = {
                            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                            CanvasSize = UDim2.fromOffset(0, 0), 
                            ScrollingDirection = Enum.ScrollingDirection.Y, 
                            scrollBarVisibility = l_controls_0.scrollBarVisibility
                        }
                    }, {
                        v2.createElement(v3, {
                            Size = UDim2.fromOffset(120, 75), 
                            backgroundStyle = {
                                Transparency = 0, 
                                Color3 = Color3.new(0, 1, 1)
                            }
                        }), 
                        v2.createElement(v3, {
                            Size = UDim2.fromOffset(120, 75), 
                            backgroundStyle = {
                                Transparency = 0, 
                                Color3 = Color3.new(1, 0, 1)
                            }
                        })
                    }), 
                    Horizontal = v2.createElement(v4, {
                        Size = UDim2.new(0, 120, 0, 120), 
                        layout = {
                            FillDirection = Enum.FillDirection.Horizontal
                        }, 
                        scroll = {
                            AutomaticCanvasSize = Enum.AutomaticSize.X, 
                            CanvasSize = UDim2.fromOffset(0, 0), 
                            ScrollingDirection = Enum.ScrollingDirection.X, 
                            scrollBarVisibility = l_controls_0.scrollBarVisibility
                        }
                    }, {
                        v2.createElement(v3, {
                            Size = UDim2.fromOffset(120, 75), 
                            backgroundStyle = {
                                Transparency = 0, 
                                Color3 = Color3.new(0, 1, 1)
                            }
                        }), 
                        v2.createElement(v3, {
                            Size = UDim2.fromOffset(120, 75), 
                            backgroundStyle = {
                                Transparency = 0, 
                                Color3 = Color3.new(1, 0, 1)
                            }
                        })
                    })
                });
            end
        }
    }, 
    controls = {
        scrollBarVisibility = {
            "Auto", 
            "Always", 
            "None"
        }
    }
};