local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v1.join;
local l_map_0 = v1.map;
local v4 = require(l_Parent_0.Parent.Roact);
local v5 = require(l_Parent_0.UI.Components.TreeTable);
local v6 = {
    {
        Name = "Name", 
        Key = "name"
    }, 
    {
        Name = "Value", 
        Key = "value"
    }
};
local function v7() --[[ Line: 22 ]] --[[ Name: getItems ]]
    return {
        {
            name = "Workspace", 
            value = {
                Value = "12 plus extralongtext lorem ipsum asdfghjkl asdfghjkl asdfghjkl asdfghjkl asdfghjkhjkl sadfrghjkm,l asdefrgthjk dfgthjk dfgthjk dfgthyjk dfl sadfrghjkm,l asdefrgthjk dfgthjk dfgthjk dfgthyjk dfghjk fdghjk dfghjk fdghjk", 
                LeftIcon = {
                    Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                    Size = UDim2.new(0, 14, 0, 14)
                }
            }, 
            children = {
                {
                    name = "Ocean", 
                    value = 53, 
                    children = {
                        {
                            name = "Billy The Fish", 
                            value = 12
                        }
                    }
                }
            }
        }, 
        {
            name = "ReplicatedStorage", 
            value = 18, 
            children = {
                {
                    name = "WeatherSystem", 
                    value = {
                        Value = 193, 
                        LeftIcon = {
                            Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                            Size = UDim2.new(0, 14, 0, 14)
                        }
                    }
                }, 
                {
                    name = "CloudSystem", 
                    value = 9001, 
                    children = {
                        {
                            name = "Cheeky Cumulus", 
                            value = {
                                Value = 200, 
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
            value = 30, 
            children = {
                {
                    name = "Secret Base", 
                    value = 212, 
                    children = {
                        {
                            name = "Obsidian Door", 
                            value = 120
                        }
                    }
                }
            }
        }
    };
end;
local function v20(v8, v9) --[[ Line: 97 ]] --[[ Name: createStory ]]
    -- upvalues: v4 (copy), v7 (copy), l_map_0 (copy), v6 (copy), l_join_0 (copy), v5 (copy)
    local v10 = v4.PureComponent:extend("Story");
    v10.init = function(v11) --[[ Line: 100 ]] --[[ Name: init ]]
        -- upvalues: v8 (copy), v7 (ref)
        v11.state = {
            Sizes = v8, 
            Expansion = {}, 
            Items = v7()
        };
        v11.onSizesChange = function(v12) --[[ Line: 106 ]]
            -- upvalues: v11 (copy)
            v11:setState({
                Sizes = v12
            });
        end;
    end;
    v10.render = function(v13) --[[ Line: 113 ]] --[[ Name: render ]]
        -- upvalues: l_map_0 (ref), v6 (ref), l_join_0 (ref), v4 (ref), v5 (ref), v9 (copy)
        local v16 = l_map_0(v6, function(v14, v15) --[[ Line: 114 ]]
            -- upvalues: l_join_0 (ref), v13 (copy)
            return l_join_0(v14, {
                Width = v13.state.Sizes[v15]
            });
        end);
        local l_onSizesChange_0 = v13.onSizesChange;
        return v4.createElement(v5, l_join_0({
            Size = UDim2.new(1, 0, 0, 240), 
            Columns = v16, 
            OnExpansionChange = function(v18) --[[ Line: 127 ]] --[[ Name: OnExpansionChange ]]
                -- upvalues: v13 (copy), l_join_0 (ref)
                v13:setState({
                    Expansion = l_join_0(v13.state.Expansion, v18)
                });
            end, 
            OnColumnSizesChange = l_onSizesChange_0, 
            Expansion = v13.state.Expansion, 
            RootItems = v13.state.Items, 
            GetChildren = function(v19) --[[ Line: 135 ]] --[[ Name: GetChildren ]]
                return v19.children or {};
            end, 
            Scroll = true
        }, v9));
    end;
    return v10;
end;
return {
    stories = {
        {
            name = "Clamped", 
            summary = "Columns can't extend outside table bounds, and resize proportionally when the outer size changes", 
            story = v20({
                UDim.new(0.5, 0), 
                UDim.new(0.5, 0)
            }, {
                ClampSize = true, 
                UseScale = true
            })
        }, 
        {
            name = "Clamped with deficit", 
            summary = "Columns can't extend outside table bounds, and only the last column resizes when the outer size changes", 
            story = v20({
                UDim.new(0, 200), 
                UDim.new(1, -200)
            }, {
                ClampSize = true, 
                UseDeficit = true
            })
        }, 
        {
            name = "Expanding", 
            summary = "Columns can extend outside the table bounds, producing a horizontal scroll, and do not resize when the outer size changes", 
            story = v20({
                UDim.new(0, 200), 
                UDim.new(0, 400)
            }, {})
        }, 
        {
            name = "Right click handling", 
            summary = "You can pass a callback OnRightClick() to handle right clicks on rows", 
            story = v20({}, {
                RightClick = function(v21, v22) --[[ Line: 182 ]] --[[ Name: RightClick ]]
                    print("onRightClick() pos = ", v22, ", row = ", v21);
                end
            })
        }
    }
};