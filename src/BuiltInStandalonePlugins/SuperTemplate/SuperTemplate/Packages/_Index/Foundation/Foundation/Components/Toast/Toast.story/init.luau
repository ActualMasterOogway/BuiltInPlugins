local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v4 = require(l_script_FirstAncestor_0.Components.Toast);
local function v6(v5) --[[ Line: 9 ]] --[[ Name: Story ]]
    -- upvalues: v2 (copy), v4 (copy)
    return v2.createElement(v4, v5);
end;
return {
    summary = "Toast", 
    stories = {
        {
            name = "Toast", 
            story = function(v7) --[[ Line: 18 ]] --[[ Name: story ]]
                -- upvalues: v6 (copy), v3 (copy)
                return v6({
                    title = v7.controls.title, 
                    text = v7.controls.text, 
                    icon = v7.controls.icon, 
                    actions = {
                        if v7.controls.button1 ~= "" then {
                            onActivated = function() --[[ Line: 26 ]] --[[ Name: onActivated ]]
                                -- upvalues: v7 (copy)
                                print(v7.controls.button1);
                            end, 
                            variant = v3.Subtle, 
                            text = v7.controls.button1
                        } else nil, 
                        if v7.controls.button2 ~= "" then {
                            onActivated = function() --[[ Line: 35 ]] --[[ Name: onActivated ]]
                                -- upvalues: v7 (copy)
                                print(v7.controls.button2);
                            end, 
                            variant = v3.Emphasis, 
                            text = v7.controls.button2
                        } else nil
                    }
                });
            end
        }
    }, 
    controls = {
        icon = {
            "rbxthumb://type=AvatarHeadShot&id=6181525679&w=420&h=420", 
            "icons/common/play", 
            ""
        }, 
        title = "Toast Notification", 
        text = "U have been toasted . >:)", 
        button1 = "Action 1", 
        button2 = "Action 2"
    }
};