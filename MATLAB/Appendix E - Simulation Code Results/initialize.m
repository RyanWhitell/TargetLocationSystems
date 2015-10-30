function  initialize() % Run initialize function to start simulation
  
% Declare and initialize copter formation
global A B C;
 
A = set_se2(-10,0,0);
B = set_se2(10,0,0);
C = set_se2(0,sqrt(20^2-10^2),0);
 
% Plot copter formation and target
plot_position(A,'A');
plot_position(B,'B');
plot_position(C,'C');
T = set_target(-35,-20);
disp('Click on the figure to advance');
 
% Locate and converge upon target
EXIT_FLAG = 0;
within = Inf;
while 1
    x = 10;
    within = is_D_m_from_target(A,B,C,T,within);
    if within == 10
        within = 10;
        reduce_formation_size(A,B,C);
        while 1
            x = 4;
            within = is_D_m_from_target(A,B,C,T, within);
            if within == 5
                within = 5;
                reduce_formation_size(A,B,C);
                while 1
                    x = 2;
                    within = is_D_m_from_target(A,B,C,T, within);
                    if within == 3
                         EXIT_FLAG = 1;
                         break;
                    end
                    if EXIT_FLAG, break, end
                    advance(A,B,C,T,x)
                end
            end
            if EXIT_FLAG, break, end
            advance(A,B,C,T,x)
        end
    end
    if EXIT_FLAG, break, end
    advance(A,B,C,T,x)
end
end