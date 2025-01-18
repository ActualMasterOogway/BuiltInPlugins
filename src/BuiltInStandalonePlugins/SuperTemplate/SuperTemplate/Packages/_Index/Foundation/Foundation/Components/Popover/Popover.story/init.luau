local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Components.Text);
local v6 = require(l_script_FirstAncestor_0.Components.Button);
local v7 = require(l_script_FirstAncestor_0.Components.Popover);
local v8 = require(l_script_FirstAncestor_0.Enums.ButtonSize);
local v9 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v10 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
return {
    summary = "Popover", 
    stories = {
        Basic = {
            name = "Basic", 
            story = function(v11) --[[ Line: 19 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v4 (copy), v7 (copy), v5 (copy), v6 (copy), v8 (copy)
                return v2.createElement(v4, {
                    Size = UDim2.new(1, 0, 0, 1000), 
                    tag = "row align-x-center align-y-center"
                }, {
                    Popover = v2.createElement(v7.Root, {
                        isOpen = true
                    }, {
                        Anchor = v2.createElement(v7.Anchor, nil, v2.createElement(v4, {
                            tag = "bg-surface-100 padding-large auto-xy radius-medium stroke-neutral col gap-large"
                        }, {
                            Text = v2.createElement(v5, {
                                Text = "I am a card", 
                                tag = "auto-xy text-heading-medium"
                            }), 
                            Button = v2.createElement(v6, {
                                text = "Just a button!", 
                                size = v8.Medium, 
                                onActivated = function() --[[ Line: 40 ]] --[[ Name: onActivated ]]
                                    print("Button activated");
                                end
                            })
                        })), 
                        Content = v2.createElement(v7.Content, {
                            align = v11.controls.align, 
                            side = v11.controls.side
                        }, v2.createElement(v4, {
                            tag = "col gap-small padding-medium auto-xy"
                        }, {
                            Title = v2.createElement(v5, {
                                Text = "Tooltip Title", 
                                tag = "auto-xy text-title-medium"
                            }), 
                            Subtitle = v2.createElement(v5, {
                                Text = "Here's the tootip's subtitle and content.", 
                                tag = "auto-xy text-body-small"
                            })
                        }))
                    })
                });
            end
        }, 
        ClickOutside = {
            name = "Click Outside", 
            story = function(v12) --[[ Line: 71 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v4 (copy), v7 (copy), v5 (copy), v6 (copy), v8 (copy)
                local v13, v14 = v2.useState(false);
                return v2.createElement(v4, {
                    tag = "row align-x-center align-y-center size-full-0 auto-y"
                }, {
                    Popover = v2.createElement(v7.Root, {
                        isOpen = v13
                    }, {
                        Anchor = v2.createElement(v7.Anchor, nil, v2.createElement(v4, {
                            tag = "bg-surface-100 padding-large auto-xy radius-medium stroke-neutral col gap-large"
                        }, {
                            Text = v2.createElement(v5, {
                                Text = "I am a card", 
                                tag = "auto-xy text-heading-medium"
                            }), 
                            Button = v2.createElement(v6, {
                                text = "Click me to open!", 
                                size = v8.Medium, 
                                onActivated = function() --[[ Line: 93 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v14 (copy)
                                    v14(true);
                                end
                            })
                        })), 
                        Content = v2.createElement(v7.Content, {
                            align = v12.controls.align, 
                            side = v12.controls.side, 
                            onPressedOutside = function() --[[ Line: 104 ]] --[[ Name: onPressedOutside ]]
                                -- upvalues: v14 (copy)
                                v14(false);
                            end
                        }, v2.createElement(v4, {
                            tag = "col gap-small padding-medium auto-xy"
                        }, {
                            Title = v2.createElement(v5, {
                                Text = "Click outside example", 
                                tag = "auto-xy text-title-medium"
                            }), 
                            Subtitle = v2.createElement(v5, {
                                Text = "Click anywhere outside to close this", 
                                tag = "auto-xy text-body-small"
                            })
                        }))
                    })
                });
            end
        }
    }, 
    controls = {
        side = v3.values(v9), 
        align = v3.values(v10)
    }
};