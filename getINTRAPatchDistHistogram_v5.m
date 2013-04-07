function [histogram] = getINTRAPatchDistHistogram_v5(patch)

        [descriptors] = getSelfSimData_intra(patch);     
        % normalize histogram here
        histogram = 1-mean(descriptors);    
end

    