function []=visualizeBoxes(lowerX,lowerY,boxSize,META)

    if (META.show==1 || META.boxShow==1) % visualize
        boxRect=[lowerY lowerX boxSize*2 boxSize*2]; % xStart,yStart,boxSize
        rectangle('Position', boxRect, 'LineWidth',2,'LineStyle','--')
    end
    
end