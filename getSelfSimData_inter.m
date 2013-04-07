function [descriptors] = getSelfSimData_inter(patch)

% INTRA PATCH
%{
    img =double( patch);
    parms.patch_size         = 5        ;
    parms.desc_rad           = 20       ;
    parms.nrad               = 3        ;
    parms.nang               = 12       ;
    parms.var_noise          = 300000   ;
    parms.saliency_thresh    = 0.7     ;
    parms.homogeneity_thresh = 0.7      ;
    parms.snn_thresh         = 0.85     ;
    
    %}


img =double( patch);
    parms.patch_size         = 3        ;
    parms.desc_rad           = 5       ;
    parms.nrad               = 3        ;
    parms.nang               = 12       ;
    parms.var_noise          = 300000   ;
    parms.saliency_thresh    = 1.0     ;
    parms.homogeneity_thresh = 1.0      ;
    parms.snn_thresh         = 1.0     ;

    [resp, draw_coords, salient_coords, homogeneous_coords, snn_coords] = ...
        mexCalcSsdescs(img, parms);
    
    descriptors = resp';
end