local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.RoundingBehaviour);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v4 = {
    hasEnoughRatings = function(v3) --[[ Line: 15 ]] --[[ Name: hasEnoughRatings ]]
        return v3 >= 10;
    end
};
v4.getFormattedVoteNumber = function(v5, v6) --[[ Line: 19 ]] --[[ Name: getFormattedVoteNumber ]]
    -- upvalues: v4 (copy), v1 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    if not v4.hasEnoughRatings(v5) then
        return "";
    else
        local v7 = nil;
        v7 = if v5 <= 9999 then tostring(v5) else v6:localizeAndAbbreviateNumber(v5, v1.Truncate, 1);
        if v5 <= 9999 then
            return v6:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "VoteBar", "VoteCountGreaterThanEqualTen1", {
                count = v7
            });
        else
            return v7;
        end;
    end;
end;
v4.getFormattedVoteNumberAndText = function(v8, v9, v10, v11) --[[ Line: 52 ]] --[[ Name: getFormattedVoteNumberAndText ]]
    -- upvalues: v4 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    if not v4.hasEnoughRatings(v8) then
        return v9:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "VoteBar", "VoteCountTooSmall");
    else
        local v12 = v4.getFormattedVoteNumber(v8, v9);
        if v10 then
            v12 = v9:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "VoteBar", "VoteCountWrappedInParens1", {
                count = v12
            });
        end;
        if v11 then
            v12 = v9:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "VoteBar", "VoteCountAndText1", {
                count = v12
            });
        end;
        return v12;
    end;
end;
return v4;