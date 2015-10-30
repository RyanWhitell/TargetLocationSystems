function plot_position(position_global,identifier)
% PLOT_POSITION
% This function plots the position of the copter that is passed in as an
% argument
 
global APLOT BPLOT CPLOT;
 
if identifier == 'A'
    delete(APLOT);
    APLOT = plot(position_global(1,3),position_global(2,3),'mo');
end
if identifier == 'B'
    delete(BPLOT);
    BPLOT = plot(position_global(1,3),position_global(2,3),'bo');
end
if identifier == 'C'
    delete(CPLOT);
    CPLOT = plot(position_global(1,3),position_global(2,3),'go');
end
 
grid on
title('Footbal Field')
xlabel('X (meters)')
ylabel('Y (meters)')
axis equal
axis([-55,55,-29,29])
hold on
end