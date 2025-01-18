local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Src.Components.BlockingDialog.BlockingDialog);
return function(v4, v5) --[[ Line: 7 ]] --[[ Name: showBlockingDialog ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    return v2.new(function(v6) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v3 (ref), v4 (copy), v5 (copy)
        spawn(function() --[[ Line: 9 ]]
            -- upvalues: v1 (ref), v6 (copy), v3 (ref), v4 (ref), v5 (ref)
            local v7 = nil;
            local function v8() --[[ Line: 11 ]] --[[ Name: closeDialog ]]
                -- upvalues: v7 (ref), v1 (ref), v6 (ref)
                if v7 then
                    v1.unmount(v7);
                    v6();
                end;
            end;
            local v9 = v1.createElement(v3, {
                plugin = v4, 
                OnButtonClicked = v8, 
                OnClose = v8
            }, v5);
            v7 = v1.mount(v9);
        end);
    end):await();
end;