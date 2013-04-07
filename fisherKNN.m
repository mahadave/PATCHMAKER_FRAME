%%This file runs the sift algorithm
%% bag is a patch and the instances are the randomly selected points 
% fischer extracts a feature vector for each bag based on the universal GMM
% trained using all the instances
%

startUp();

%--------------------------TRAIN-------------------------------------------
%---
%-


%%

[folder,files,users,color] =setDirs();

%%
%decide number of files to run for
trainingLimits = [1 50];

%%


D=[];

labelList=[];
testLabels=[];

close all

    %%---------------------------------------------------------------------
    %%--
    %%sift computation params
    %%
    [pointList,trainingLabels] = trainingDataAndLabels(trainingLimits);
    
    save('pointList','pointList');
%%
% 
% D=1; %divisions of data
% trainingLowerLimit = 1;
% trainingUpperLimit = numel(labelList)/D;
%%
    k=5;
    [GMMList,gmm] = makeGMM(pointList,k);
    save(['GMM_',num2str(k)],'gmm'); 
%%
    
    [fishers] = extractFishers(GMMList, gmm);
    
%%
 [trainingList,trainingLabels] = prepTraining(fishers,trainingLabels);
 info=['using image indices : ',num2str(trainingLimits) ];
 save('trainingData','trainingList','trainingLabels','info')
%%
    
    clc
    clear all
    load trainingData
    SVMStruct = trainSVM(trainingList,trainingLabels);
    save('SVMStruct','SVMStruct');

%%

%--------------------------TEST-------------------------------------------
%---
%-

testLimits = [51 81];
[testPointList,testLabels] = testingDataAndLabels(testLimits);
testInfo = ['testing from ',num2str(testLimits)];

%%
load gmm_5
testPointList = double(testPointList);
[fishers]=extractFishers(testPointList,gmm);
testList = fishers;
save('testData','testList','testLabels','testPointList');
%%
load testData
%predictedLabelList = svmclassify(SVMStruct,testList);

K=1;
%[neighbors distances] = kNearestNeighbors(trainingList,testList,K);

[class] = knnclassify(testList,trainingList,trainingLabels,K);
%save('testData','testLabels','predictedLabelList','testInfo');
%%
[p,n] = QuantTesting(testLabels,predictedLabelList);


%% KNN

%%
[p,n] = QuantTesting(testLabels,class);

%% expts

indices = find(trainingLabels==1);
posList = trainingList(indices,:);
%size(posList)

repList = repmat(posList,[15 1]);
disp(size(repList))

%% 
newTrainingList = [trainingList ; repList];
newLabelList    = [trainingLabels ones(1,size(repList,1))];

save('balanced','newTrainingList','newLabelList');



%%