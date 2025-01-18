local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.Components.TreeTable);
local v4 = v2.PureComponent:extend(script.Parent.Name .. "ExampleTreeTable");
v4.init = function(v5) --[[ Line: 12 ]] --[[ Name: init ]]
    v5.state = {
        Expansion = {}, 
        Selection = {}, 
        Items = {
            {
                name = "Workspace.AbsurdlyLongFIlePath1.AbsurdlyLongFIlePath2.AbsurdlyLongFIlePath3.AbsurdlyLongFIlePath4.Script", 
                children = {
                    {
                        name = "Ocean", 
                        Col1 = 53, 
                        Col2 = 54, 
                        Col3 = 55, 
                        Col4 = 56, 
                        Col5 = 57, 
                        children = {
                            {
                                name = "Billy The Fish", 
                                Col1 = 12, 
                                Col2 = 13, 
                                Col3 = 14, 
                                Col4 = 15, 
                                Col5 = 16
                            }
                        }
                    }
                }
            }, 
            {
                name = "ReplicatedStorage", 
                children = {
                    {
                        name = "WeatherSystem", 
                        Col1 = "a", 
                        Col2 = "b", 
                        Col3 = "c", 
                        Col4 = "d", 
                        Col5 = "e", 
                        children = {
                            Col1 = 193, 
                            Col2 = 194, 
                            Col3 = 195, 
                            Col4 = 196, 
                            Col5 = 197, 
                            LeftIcon = {
                                Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                                Size = UDim2.new(0, 14, 0, 14)
                            }
                        }
                    }, 
                    {
                        name = "CloudSystem", 
                        Col1 = 9001, 
                        Col2 = 9002, 
                        Col3 = 9003, 
                        Col4 = 9004, 
                        Col5 = 9005, 
                        children = {
                            {
                                name = "Cheeky Cumulus", 
                                Col1 = "e", 
                                Col2 = "f", 
                                Col3 = "g", 
                                Col4 = "h", 
                                Col5 = "i", 
                                children = {
                                    Col1 = -1, 
                                    Col2 = -2, 
                                    Col3 = -3, 
                                    Col4 = -4, 
                                    Col5 = -5, 
                                    LeftIcon = {
                                        Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                                        Size = UDim2.new(0, 14, 0, 14)
                                    }
                                }
                            }
                        }
                    }
                }
            }, 
            {
                name = "ServerStorage", 
                children = {
                    {
                        name = "Secret Base", 
                        Col1 = 212, 
                        Col2 = 213, 
                        Col3 = 214, 
                        Col4 = 215, 
                        Col5 = 216, 
                        children = {
                            {
                                name = "Obsidian Door", 
                                Col1 = 120, 
                                Col2 = 121, 
                                Col3 = 122, 
                                Col4 = 123, 
                                Col5 = 124
                            }
                        }
                    }
                }
            }
        }
    };
end;
v4.render = function(v6) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), l_join_0 (copy)
    return v2.createElement(v3, {
        Size = UDim2.new(1, 0, 0, 240), 
        Columns = {
            {
                Name = "Name", 
                Key = "name"
            }, 
            {
                Name = "Col1", 
                Key = "Col1"
            }, 
            {
                Name = "Col2", 
                Key = "Col2"
            }, 
            {
                Name = "Col3", 
                Key = "Col3"
            }, 
            {
                Name = "Col4", 
                Key = "Col4"
            }, 
            {
                Name = "Col5", 
                Key = "Col5"
            }
        }, 
        OnExpansionChange = function(v7) --[[ Line: 149 ]] --[[ Name: OnExpansionChange ]]
            -- upvalues: v6 (copy), l_join_0 (ref)
            v6:setState({
                Expansion = l_join_0(v6.state.Expansion, v7)
            });
        end, 
        OnSelectionChange = function(v8) --[[ Line: 154 ]] --[[ Name: OnSelectionChange ]]
            -- upvalues: v6 (copy)
            v6:setState({
                Selection = v8
            });
        end, 
        Expansion = v6.state.Expansion, 
        RootItems = v6.state.Items, 
        GetChildren = function(v9) --[[ Line: 161 ]] --[[ Name: GetChildren ]]
            return v9.children or {};
        end, 
        Scroll = true, 
        FullSpan = true
    });
end;
return v4;