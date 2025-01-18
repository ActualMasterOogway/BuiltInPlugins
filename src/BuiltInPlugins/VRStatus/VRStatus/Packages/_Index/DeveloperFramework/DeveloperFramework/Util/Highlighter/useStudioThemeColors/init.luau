local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Util.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_Design_0 = require(l_Parent_0.ContextServices).Design;
local v5 = require(l_Parent_0.Util.Highlighter.Theme);
local v6 = require(l_Parent_0.TestHelpers.isCli);
return function() --[[ Line: 12 ]] --[[ Name: useStudioThemeColors ]]
    -- upvalues: l_useState_0 (copy), v5 (copy), l_Design_0 (copy), l_useEffect_0 (copy), v6 (copy)
    local v7, v8 = l_useState_0(v5.defaultColors);
    local v9 = l_Design_0.use();
    l_useEffect_0(function() --[[ Line: 17 ]]
        -- upvalues: v6 (ref), v5 (ref), v9 (copy), v8 (copy)
        local function v10() --[[ Line: 18 ]] --[[ Name: getTokens ]]
            -- upvalues: v6 (ref), v5 (ref), v9 (ref)
            if v6() then
                return v5.defaultColors;
            else
                return {
                    background = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptBackground), 
                    iden = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptText), 
                    keyword = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptKeyword), 
                    builtin = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptBuiltInFunction), 
                    string = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptString), 
                    number = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptNumber), 
                    comment = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptComment), 
                    operator = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptOperator), 
                    custom = v9.getStudioThemeColor(Enum.StudioStyleGuideColor.ScriptBool)
                };
            end;
        end;
        v8((v10()));
        local v11 = v9:getSignal():Connect(function() --[[ Line: 36 ]]
            -- upvalues: v8 (ref), v10 (copy)
            v8((v10()));
        end);
        return function() --[[ Line: 40 ]]
            -- upvalues: v11 (copy)
            v11:Disconnect();
        end;
    end, {});
    return v7;
end;