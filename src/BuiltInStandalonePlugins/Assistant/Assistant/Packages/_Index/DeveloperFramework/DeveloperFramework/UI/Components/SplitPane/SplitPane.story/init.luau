local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
local v3 = require(l_Parent_0.UI.Components.Pane);
local v4 = require(l_Parent_0.UI.Components.ScrollingFrame);
local v5 = require(l_Parent_0.UI.Components.TextLabel);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v7 = v1.PureComponent:extend("ControlledSplitPane");
v7.init = function(v8) --[[ Line: 14 ]] --[[ Name: init ]]
    v8.state = {
        sizes = v8.props.InitialSizes
    };
    v8.onSizesChange = function(v9) --[[ Line: 18 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            sizes = v9
        });
    end;
end;
v7.render = function(v10) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), l_join_0 (copy)
    local l_props_0 = v10.props;
    local l_state_0 = v10.state;
    return v1.createElement(v2, l_join_0({
        Sizes = l_state_0.sizes, 
        OnSizesChange = v10.onSizesChange, 
        MinSizes = l_props_0.MinSizes, 
        PaneStyle = "BorderBox", 
        BarStyle = "BorderBox"
    }, l_props_0));
end;
return {
    stories = {
        {
            name = "Clamped and Scaled", 
            summary = "This component is clamped to the size of the container, and panes scale proportionally when resized", 
            story = function() --[[ Line: 45 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v7 (copy), v5 (copy)
                return v1.createElement(v7, {
                    UseScale = true, 
                    ClampSize = true, 
                    Size = UDim2.new(1, 0, 0, 300), 
                    MinSizes = {
                        UDim.new(0.1, 0), 
                        UDim.new(0.1, 0), 
                        UDim.new(0.1, 0), 
                        UDim.new(0.1, 0)
                    }, 
                    MaxSizes = {
                        nil, 
                        nil, 
                        UDim.new(0.1, 0), 
                        nil
                    }, 
                    InitialSizes = {
                        UDim.new(0.25, 0), 
                        UDim.new(0.25, 0), 
                        UDim.new(0.1, 0), 
                        UDim.new(0.4, 0)
                    }
                }, {
                    v1.createElement(v5, {
                        Text = "This content appears in the first pane and will wrap based on the pane size", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    }), 
                    v1.createElement(v5, {
                        Text = "This content appears in the second pane and will wrap based on the pane size", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    }), 
                    v1.createElement(v5, {
                        Text = "Fixed Size Pane", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    }), 
                    v1.createElement(v5, {
                        Text = "This content appears in the fourth pane and will wrap based on the pane size", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    })
                });
            end
        }, 
        {
            name = "Hidden Drag bars", 
            summary = "The drag bars can be hidden to allow style customization", 
            story = function() --[[ Line: 84 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v7 (copy), v3 (copy), v5 (copy)
                return v1.createElement(v7, {
                    UseScale = true, 
                    ClampSize = true, 
                    HideBars = true, 
                    Size = UDim2.new(1, 0, 0, 40), 
                    MinSizes = {
                        UDim.new(0.1, 0), 
                        UDim.new(0.1, 0), 
                        UDim.new(0.1, 0), 
                        UDim.new(0.1, 0)
                    }, 
                    MaxSizes = {
                        nil, 
                        nil, 
                        UDim.new(0.1, 0), 
                        nil
                    }, 
                    InitialSizes = {
                        UDim.new(0.25, 0), 
                        UDim.new(0.25, 0), 
                        UDim.new(0.1, 0), 
                        UDim.new(0.4, 0)
                    }
                }, {
                    v1.createElement(v3, {
                        Style = "SubtleBorderBox"
                    }, {
                        Label = v1.createElement(v5, {
                            Text = "Row A", 
                            Size = UDim2.fromScale(1, 1)
                        })
                    }), 
                    v1.createElement(v3, {
                        Style = "SubtleBorderBox"
                    }, {
                        Label = v1.createElement(v5, {
                            Text = "Row B", 
                            Size = UDim2.fromScale(1, 1)
                        })
                    }), 
                    v1.createElement(v3, {
                        Style = "SubtleBorderBox"
                    }, {
                        Label = v1.createElement(v5, {
                            Text = "Fixed", 
                            Size = UDim2.fromScale(1, 1)
                        })
                    }), 
                    v1.createElement(v3, {
                        Style = "SubtleBorderBox"
                    }, {
                        Label = v1.createElement(v5, {
                            Text = "Row D", 
                            Size = UDim2.fromScale(1, 1)
                        })
                    })
                });
            end
        }, 
        {
            name = "Clamped with Deficit", 
            summary = "This component is clamped to the size of the container, with the last pane filling remaining space when resized", 
            story = function() --[[ Line: 132 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v7 (copy), v5 (copy)
                return v1.createElement(v7, {
                    UseDeficit = true, 
                    ClampSize = true, 
                    Size = UDim2.new(1, 0, 0, 300), 
                    MinSizes = {
                        UDim.new(0, 100), 
                        UDim.new(0, 100), 
                        UDim.new(0, 100), 
                        UDim.new(0, 100)
                    }, 
                    MaxSizes = {
                        nil, 
                        nil, 
                        UDim.new(0, 100), 
                        nil
                    }, 
                    InitialSizes = {
                        UDim.new(0, 100), 
                        UDim.new(0, 100), 
                        UDim.new(0, 100), 
                        UDim.new(1, -300)
                    }
                }, {
                    v1.createElement(v5, {
                        Text = "This content appears in the first pane and will wrap based on the pane size", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    }), 
                    v1.createElement(v5, {
                        Text = "This content appears in the second pane and will wrap based on the pane size", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    }), 
                    v1.createElement(v5, {
                        Text = "Fixed Size Pane", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    }), 
                    v1.createElement(v5, {
                        Text = "This content appears in the fourth pane and will wrap based on the pane size", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    })
                });
            end
        }, 
        {
            name = "Unclamped", 
            summary = "When not clamped, the component can grow horizontally as children are resized", 
            story = function() --[[ Line: 171 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v3 (copy), v4 (copy), v7 (copy), v5 (copy)
                return v1.createElement(v3, {
                    Style = "BorderBox", 
                    Size = UDim2.fromOffset(500, 100), 
                    Padding = 2
                }, {
                    Split = v1.createElement(v4, {
                        CanvasSize = UDim2.fromScale(0, 0), 
                        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                        ScrollingDirection = Enum.ScrollingDirection.X, 
                        ClipsDescendants = true
                    }, {
                        Child = v1.createElement(v7, {
                            AutomaticSize = Enum.AutomaticSize.X, 
                            PaneStyle = "Default", 
                            Size = UDim2.fromOffset(0, 95), 
                            MinSizes = {
                                UDim.new(0, 50), 
                                UDim.new(0, 50), 
                                UDim.new(0, 50), 
                                UDim.new(0, 50)
                            }, 
                            InitialSizes = {
                                UDim.new(0, 250), 
                                UDim.new(0, 300), 
                                UDim.new(0, 250), 
                                UDim.new(0, 100)
                            }
                        }, {
                            v1.createElement(v5, {
                                Text = "First", 
                                Size = UDim2.new(1, -20, 1, -20), 
                                Position = UDim2.fromOffset(10, 10), 
                                TextWrapped = true
                            }), 
                            v1.createElement(v5, {
                                Text = "Second", 
                                Size = UDim2.new(1, -20, 1, -20), 
                                Position = UDim2.fromOffset(10, 10), 
                                TextWrapped = true
                            }), 
                            v1.createElement(v5, {
                                Text = "Third", 
                                Size = UDim2.new(1, -20, 1, -20), 
                                Position = UDim2.fromOffset(10, 10), 
                                TextWrapped = true
                            }), 
                            v1.createElement(v5, {
                                Text = "Fourth", 
                                Size = UDim2.new(1, -20, 1, -20), 
                                Position = UDim2.fromOffset(10, 10), 
                                TextWrapped = true
                            })
                        })
                    })
                });
            end
        }, 
        {
            name = "Vertical", 
            summary = "Split Pane will also display vertical layout", 
            story = function() --[[ Line: 232 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v7 (copy), v5 (copy)
                return v1.createElement(v7, {
                    ClampSize = true, 
                    Layout = Enum.FillDirection.Vertical, 
                    Size = UDim2.fromOffset(300, 500), 
                    MinSizes = {
                        UDim.new(0, 100), 
                        UDim.new(0, 100), 
                        UDim.new(0, 100)
                    }, 
                    InitialSizes = {
                        UDim.new(0, 100), 
                        UDim.new(0, 100), 
                        UDim.new(0, 100)
                    }
                }, {
                    v1.createElement(v5, {
                        Text = "First", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    }), 
                    v1.createElement(v5, {
                        Text = "Second", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    }), 
                    v1.createElement(v5, {
                        Text = "Third", 
                        Size = UDim2.new(1, -20, 1, -20), 
                        Position = UDim2.fromOffset(10, 10), 
                        TextWrapped = true
                    })
                });
            end
        }
    }
};