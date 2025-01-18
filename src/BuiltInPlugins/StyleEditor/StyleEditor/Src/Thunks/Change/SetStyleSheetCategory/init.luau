local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v2 = require(l_Actions_0.Window.SetDesignSheet);
local v3 = require(l_Parent_0.Src.Util.DesignHelpers);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v6, v7) --[[ Line: 18 ]] --[[ Name: SetStyleSheetCategory ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v8, v9) --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v2 (ref), v6 (copy), v3 (ref)
        local l_DesignSheet_0 = v8:getState().Window.DesignSheet;
        if not l_DesignSheet_0 then
            return;
        else
            assert(l_DesignSheet_0 ~= nil, "expecting valid design sheet");
            v9.recordChange({
                Name = "StyleEditor/SetStyleSheetCategory", 
                DisplayName = "StyleEditor - Set StyleSheet Category", 
                DoChange = function() --[[ Line: 31 ]] --[[ Name: DoChange ]]
                    -- upvalues: v7 (ref), l_DesignSheet_0 (copy), v8 (copy), v2 (ref), v6 (ref), v3 (ref)
                    if v7 == "Designs" then
                        l_DesignSheet_0:SetAttribute("StyleCategory", nil);
                        v8:dispatch(v2(v6));
                    elseif v7 == "Themes" then
                        v3.setAsTheme(v6, l_DesignSheet_0);
                    elseif v7 == "Tokens" then
                        v3.setAsToken(v6, l_DesignSheet_0);
                    else
                        warn("Unknown StyleSheetCategory:", v7);
                    end;
                    v6:SetAttribute("StyleCategory", v7);
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            return;
        end;
    end;
end;