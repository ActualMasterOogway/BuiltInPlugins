local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(script.Parent.AudioTabs);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v6 = v2.PureComponent:extend("AudioTabsStroyWrapper");
v6.init = function(v7) --[[ Line: 14 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v7.state = {
        selectedTab = v5.SOUND_EFFECTS.name
    };
    v7.OnTabSelect = function(v8) --[[ Line: 19 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            selectedTab = v8
        });
    end;
end;
v6.render = function(v9) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 330, 0, 30), 
        BackgroundTransparency = 1
    }, {
        AudioTabs = v2.createElement(v3, {
            SelectedTab = v9.state.selectedTab, 
            OnTabSelect = v9.OnTabSelect
        })
    });
end;
return {
    name = "Audio Tabs", 
    summary = "Tab selection with round edges", 
    story = function() --[[ Line: 39 ]] --[[ Name: story ]]
        -- upvalues: v2 (copy), v4 (copy), v6 (copy)
        return v2.createElement(v4, {}, {
            AudioTabs = v2.createElement(v6)
        });
    end
};