local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local _ = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Dash);
local v5 = require(script.Parent.AudioPlayer);
local v6 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v7 = v2.PureComponent:extend("AudioPlayerWrapper");
v7.init = function(v8) --[[ Line: 14 ]] --[[ Name: init ]]
    v8.state = {
        isPlaying = false
    };
    v8.onEnded = function() --[[ Line: 17 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            isPlaying = false
        });
    end;
end;
v7.render = function(v9) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    return v2.createFragment({
        Controls = v2.createElement("TextButton", {
            Text = v9.state.isPlaying and "Pause" or "Play", 
            Size = UDim2.new(0, 40, 0, 40), 
            [v2.Event.Activated] = function() --[[ Line: 27 ]]
                -- upvalues: v9 (copy)
                v9:setState(function(v10) --[[ Line: 28 ]]
                    return {
                        isPlaying = not v10.isPlaying
                    };
                end);
            end
        }), 
        Player = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 10), 
                PaddingLeft = UDim.new(0, 10)
            }), 
            Player = v2.createElement(v5, v4.join(v9.props, {
                IsPlaying = v9.state.isPlaying, 
                OnEnded = v9.onEnded
            }))
        })
    });
end;
return {
    summary = "Audio Player", 
    stories = {
        {
            name = "Playing", 
            story = function() --[[ Line: 58 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v7 (copy)
                return v2.createElement(v6, {}, {
                    AudioPlayer = v2.createElement(v7, {
                        SoundId = 142376088
                    })
                });
            end
        }
    }
};