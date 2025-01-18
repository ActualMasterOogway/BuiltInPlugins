local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
return function(v5, v6) --[[ Line: 18 ]] --[[ Name: UnlinkStyleSheetAttributeTokenReference ]]
    -- upvalues: l_StylingService_0 (copy)
    return function(_, v8) --[[ Line: 19 ]]
        -- upvalues: l_StylingService_0 (ref), v5 (copy), v6 (copy)
        v8.recordChange({
            Name = "StyleEditor/UnlinkStyleSheetAttributeTokenReference", 
            DisplayName = "StyleEditor - Unlink StyleSheet Token", 
            DoChange = function() --[[ Line: 23 ]] --[[ Name: DoChange ]]
                -- upvalues: l_StylingService_0 (ref), v5 (ref), v6 (ref)
                local v9 = l_StylingService_0:GetStyleSheetInfo(v5).Variables[v6];
                if v9 == nil or v9 == "$" then
                    v9 = "";
                end;
                v5:SetAttribute(v6, v9);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
end;