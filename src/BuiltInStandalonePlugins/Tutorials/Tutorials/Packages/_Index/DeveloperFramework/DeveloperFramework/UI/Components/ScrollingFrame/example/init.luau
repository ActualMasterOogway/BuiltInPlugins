return function(v0) --[[ Line: 1 ]]
    local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
    local v2 = require(l_Parent_0.Parent.Roact);
    local v3 = require(l_Parent_0.UI.ContextServices);
    local l_Plugin_0 = v3.Plugin;
    local v5 = require(l_Parent_0.UI.Components.ScrollingFrame);
    local v6 = require(l_Parent_0.UI.Components.Dialog);
    local v7 = l_Plugin_0.new(v0);
    local v8 = require(l_Parent_0.Style.Themes.StudioTheme).new();
    local v9 = v2.PureComponent:extend("ExampleButton");
    v9.init = function(v10) --[[ Line: 18 ]] --[[ Name: init ]]
        v10.state = {
            enabled = true
        };
        v10.close = function() --[[ Line: 23 ]]
            -- upvalues: v10 (copy)
            v10:setState({
                enabled = false
            });
        end;
    end;
    v9.render = function(v11) --[[ Line: 30 ]] --[[ Name: render ]]
        -- upvalues: v2 (copy), v3 (copy), v7 (copy), v8 (copy), v6 (copy), v5 (copy)
        if v11.state.enabled == false then
            return nil;
        else
            local v12 = {
                Layout = v2.createElement("UIListLayout")
            };
            for v13 = 1, 10 do
                v12[tostring(v13)] = v2.createElement("TextLabel", {
                    Text = "I'm an example child!", 
                    Size = UDim2.new(1, 0, 0, 30), 
                    LayoutOrder = v13
                });
            end;
            return v3.provide({
                v7, 
                v8
            }, {
                Main = v2.createElement(v6, {
                    Enabled = v11.state.enabled, 
                    Title = "ToggleButton Example", 
                    Size = Vector2.new(200, 200), 
                    Resizable = false, 
                    OnClose = v11.close
                }, {
                    Scroller = v2.createElement(v5, {
                        Size = UDim2.new(1, 0, 1, 0)
                    }, v12)
                })
            });
        end;
    end;
    local v14 = v2.createElement(v9);
    local v15 = v2.mount(v14);
    return function() --[[ Line: 66 ]] --[[ Name: stop ]]
        -- upvalues: v2 (copy), v15 (copy)
        v2.unmount(v15);
    end;
end;