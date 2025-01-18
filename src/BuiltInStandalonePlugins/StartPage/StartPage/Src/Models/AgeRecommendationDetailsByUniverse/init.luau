return {
    validate = function(v0) --[[ Line: 12 ]] --[[ Name: validate ]]
        if typeof(v0) ~= "table" then
            return (("Expected table, got %*"):format((typeof(v0))));
        else
            local l_ageRecommendationDetails_0 = v0.ageRecommendationDetails;
            if l_ageRecommendationDetails_0 then
                if typeof(l_ageRecommendationDetails_0) ~= "table" then
                    return (("\"ageRecommendationDetails\" > Expected table, got %*"):format((typeof(l_ageRecommendationDetails_0))));
                else
                    local l_ageRecommendationSummary_0 = l_ageRecommendationDetails_0.ageRecommendationSummary;
                    if l_ageRecommendationSummary_0 then
                        if typeof(l_ageRecommendationSummary_0) ~= "table" then
                            return (("\"ageRecommendationDetails\" > \"ageRecommendationSummary\" > Expected table, got %*"):format((typeof(l_ageRecommendationSummary_0))));
                        else
                            local l_ageRecommendation_0 = l_ageRecommendationSummary_0.ageRecommendation;
                            if l_ageRecommendation_0 then
                                if typeof(l_ageRecommendation_0) ~= "table" then
                                    return (("\"ageRecommendationDetails\" > \"ageRecommendationSummary\" > \"ageRecommendation\" > Expected table, got %*"):format((typeof(l_ageRecommendation_0))));
                                elseif l_ageRecommendation_0.minimumAge and typeof(l_ageRecommendation_0.minimumAge) ~= "number" then
                                    return (("\"ageRecommendationDetails\" > \"ageRecommendationSummary\" > \"ageRecommendation\" > \"minimumAge\" > Expected number, got %*"):format((typeof(l_ageRecommendation_0.minimumAge))));
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if v0.universeId and typeof(v0.universeId) ~= "number" then
                return (("\"universeId\" > Expected number, got %*"):format((typeof(v0.universeId))));
            else
                return nil;
            end;
        end;
    end
};