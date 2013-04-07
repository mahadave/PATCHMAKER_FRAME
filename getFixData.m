function [FixPoints] = getFixData(users,filename)

FixPoints =[];
    for j = 1:length(users) % for all users find Fixation Points
            user = users{j};
            Pts = getFixationPointsAcrossUsers(filename,user);
            FixPoints = [FixPoints ; Pts];
    end        
    
end