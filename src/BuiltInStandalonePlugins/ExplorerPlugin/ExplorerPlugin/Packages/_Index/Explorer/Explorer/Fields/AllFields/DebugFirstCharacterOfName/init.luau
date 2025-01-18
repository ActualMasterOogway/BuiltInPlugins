local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Fields.FieldTypes);
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local l_Pane_0 = v2.UI.Pane;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_createElement_0 = v4.createElement;
return {
    key = "firstCharacterOfName", 
    icon = v3.standard("collapsed"), 
    watch = function(v8, v9, v10) --[[ Line: 17 ]] --[[ Name: watch ]]
        assert(typeof(v10) == "Color3", "Arguments weren't preserved");
        local v11 = v8.Name:sub(1, 1);
        local v12 = v8:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 22 ]]
            -- upvalues: v9 (copy), v8 (copy)
            v9(v8.Name:sub(1, 1));
        end);
        return v11, function() --[[ Line: 26 ]]
            -- upvalues: v12 (copy)
            v12:Disconnect();
        end;
    end, 
    render = function(v13, v14, v15) --[[ Line: 31 ]] --[[ Name: render ]]
        -- upvalues: l_createElement_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
        return l_createElement_0(l_Pane_0, {
            OnClick = function() --[[ Line: 35 ]] --[[ Name: OnClick ]]
                -- upvalues: v14 (copy)
                v14("swap");
            end
        }, l_createElement_0(l_TextLabel_0, {
            Text = v13:map(function(v16) --[[ Line: 40 ]]
                if v16 == nil then
                    return "?";
                else
                    return v16;
                end;
            end), 
            TextColor = v15
        }));
    end, 
    actions = {
        swap = function(v17, v18) --[[ Line: 50 ]] --[[ Name: swap ]]
            assert(typeof(v18) == "Color3", "Arguments weren't preserved");
            local v19 = v17.Name:sub(1);
            if v19:lower() == v19 then
                v17.Name = v17.Name:upper();
                return;
            else
                v17.Name = v17.Name:lower();
                return;
            end;
        end
    }, 
    validateArgs = function(v20) --[[ Line: 62 ]] --[[ Name: validateArgs ]]
        if typeof(v20) ~= "Color3" then
            return false, "Color3 must be passed";
        else
            return true, nil;
        end;
    end
};