local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Dash);
local l_startsWith_0 = v2.startsWith;
local l_filter_0 = v2.filter;
local v5 = require(l_Parent_0.Src.Util.DesignHelpers);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v8) --[[ Line: 21 ]] --[[ Name: ClearStyleSheetCategory ]]
    -- upvalues: l_filter_0 (copy), l_startsWith_0 (copy), v5 (copy), l_ReplicatedStorage_0 (copy)
    return function(v9, v10) --[[ Line: 22 ]]
        -- upvalues: v8 (copy), l_filter_0 (ref), l_startsWith_0 (ref), v5 (ref), l_ReplicatedStorage_0 (ref)
        local l_DesignSheet_0 = v9:getState().Window.DesignSheet;
        if not l_DesignSheet_0 then
            return;
        else
            assert(l_DesignSheet_0 ~= nil, "expecting valid design sheet");
            v10.recordChange({
                Name = "StyleEditor/ClearStyleSheetCategory", 
                DisplayName = "StyleEditor - Clear StyleSheet Category", 
                DoChange = function() --[[ Line: 34 ]] --[[ Name: DoChange ]]
                    -- upvalues: v8 (ref), l_filter_0 (ref), l_startsWith_0 (ref), v5 (ref), l_DesignSheet_0 (copy), l_ReplicatedStorage_0 (ref)
                    local l_v8_Attribute_0 = v8:GetAttribute("StyleCategory");
                    if not l_v8_Attribute_0 then
                        return Enum.FinishRecordingOperation.Cancel;
                    else
                        if l_v8_Attribute_0 == "Themes" then
                            local v14 = l_filter_0(v8:GetDerives(), function(v13) --[[ Line: 43 ]]
                                -- upvalues: l_startsWith_0 (ref)
                                return not l_startsWith_0(v13:GetAttribute("StyleCategory"), "Tokens");
                            end);
                            v8:SetDerives(v14);
                            v5.removeDerive(l_DesignSheet_0, v8);
                        elseif l_v8_Attribute_0 == "Tokens" then
                            for _, v16 in l_ReplicatedStorage_0:GetDescendants() do
                                if v16:IsA("StyleSheet") then
                                    local l_v16_Attribute_0 = v16:GetAttribute("StyleCategory");
                                    if l_v16_Attribute_0 and l_startsWith_0(l_v16_Attribute_0, "Themes") then
                                        v5.removeDerive(v16, v8);
                                    end;
                                end;
                            end;
                        end;
                        v8:SetAttribute("StyleCategory", nil);
                        return Enum.FinishRecordingOperation.Commit;
                    end;
                end
            });
            return;
        end;
    end;
end;