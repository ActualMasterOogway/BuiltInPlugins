local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v3 = require(l_Parent_0.Src.Util.StyleSchema);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
local function _(v7, v8) --[[ Line: 22 ]] --[[ Name: getDefaultValueForProperty ]]
    -- upvalues: v3 (copy)
    local v9 = nil;
    if v8 and #v8 > 0 then
        v9 = v3.allProperties[v8][v7];
    else
        local v10 = v3.getPossiblePropertyTypes(v7)[1];
        v9 = v3.PropertySchemas[v10];
    end;
    assert(v9 ~= nil, (("unknown schema for: %* (%*)"):format(v7, v8)));
    return v9.GetDefaultValue();
end;
return function(v12, v13) --[[ Line: 36 ]] --[[ Name: UnlinkStyleRulePropertyTokenReference ]]
    -- upvalues: l_StylingService_0 (copy), v2 (copy), v3 (copy)
    return function(_, v15) --[[ Line: 37 ]]
        -- upvalues: l_StylingService_0 (ref), v12 (copy), v13 (copy), v2 (ref), v3 (ref)
        v15.recordChange({
            Name = "StyleEditor/UnlinkStyleRulePropertyTokenReference", 
            DisplayName = "StyleEditor - Unlink Token from StyleRule Property", 
            DoChange = function() --[[ Line: 41 ]] --[[ Name: DoChange ]]
                -- upvalues: l_StylingService_0 (ref), v12 (ref), v13 (ref), v2 (ref), v3 (ref)
                local v16 = l_StylingService_0:GetStyleInfo(v12).Properties[v13];
                if not v16 then
                    return Enum.FinishRecordingOperation.Cancel;
                else
                    local l_Value_0 = v16.Value;
                    if v16.Error or l_Value_0 == "$" then
                        local v18 = v2.findFirstClassSelector(v12);
                        local l_v13_0 = v13;
                        local v20 = nil;
                        if v18 and #v18 > 0 then
                            v20 = v3.allProperties[v18][l_v13_0];
                        else
                            local v21 = v3.getPossiblePropertyTypes(l_v13_0)[1];
                            v20 = v3.PropertySchemas[v21];
                        end;
                        assert(v20 ~= nil, (("unknown schema for: %* (%*)"):format(l_v13_0, v18)));
                        l_Value_0 = v20.GetDefaultValue();
                    end;
                    v12:SetProperty(v13, l_Value_0);
                    return Enum.FinishRecordingOperation.Commit;
                end;
            end
        });
    end;
end;