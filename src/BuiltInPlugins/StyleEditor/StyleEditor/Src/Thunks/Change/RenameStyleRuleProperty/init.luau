local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v2 = require(l_Parent_0.Src.Util.StyleSchema);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v5, v6, v7) --[[ Line: 16 ]] --[[ Name: RenameStyleRuleProperty ]]
    -- upvalues: v1 (copy), v2 (copy)
    assert(v5 and v5:IsA("StyleRule"), "expecting valid StyleRule");
    return function(_, v9) --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v7 (copy), v1 (ref), v5 (copy), v2 (ref)
        if v6 == v7 then
            return;
        else
            local v10 = v1.findFirstClassSelector(v5);
            local v11 = v2.getPropertySchema(v7, v10);
            if not v11 then
                return;
            else
                local v12 = v11.GetDefaultValue();
                local l_v5_PropertyResolved_0 = v5:GetPropertyResolved(v6);
                local l_v5_Property_0 = v5:GetProperty(v6);
                local v15 = if typeof(v12) == typeof(l_v5_PropertyResolved_0) then l_v5_Property_0 else v12;
                v9.recordChange({
                    Name = "StyleEditor/RenameStyleRuleProperty", 
                    DisplayName = "StyleEditor - Rename StyleRule Property", 
                    DoChange = function() --[[ Line: 40 ]] --[[ Name: DoChange ]]
                        -- upvalues: v5 (ref), v6 (ref), v7 (ref), v15 (copy)
                        v5:SetProperty(v6, nil);
                        v5:SetProperty(v7, v15);
                        return Enum.FinishRecordingOperation.Commit;
                    end
                });
                return;
            end;
        end;
    end;
end;