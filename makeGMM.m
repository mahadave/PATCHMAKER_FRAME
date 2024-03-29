function [GMMList,gmm] = makeGMM(pointList,k)

    k=5; % components
    GMMList = pointList;
    GMMList = double(GMMList); %--- universal list of descriptors over all training patches
    gmm = gmdistribution.fit(GMMList, k, 'covtype','diagonal',...
                                            'regularize',1e-8); % says some columns are constant.. do PCA?
                                       
    disp('gmm complete');
    